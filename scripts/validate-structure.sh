#!/bin/bash

# validate-structure.sh
# Validates HTML page structure against design system standards
# Usage: ./scripts/validate-structure.sh [filename.html]

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if file is provided
if [ -z "$1" ]; then
    echo -e "${RED}Error: No file specified${NC}"
    echo "Usage: ./scripts/validate-structure.sh filename.html"
    exit 1
fi

FILE=$1

# Check if file exists
if [ ! -f "$FILE" ]; then
    echo -e "${RED}Error: File '$FILE' not found${NC}"
    exit 1
fi

echo "================================================"
echo "Validating: $FILE"
echo "================================================"
echo ""

ERRORS=0
WARNINGS=0

# Standard footer text
STANDARD_FOOTER='Open to senior UX roles. <a href="mailto:mattlelonek@gmail.com">Get in touch</a> or connect on <a href="https://www.linkedin.com/in/m-j-l/" target="_blank" rel="noopener">LinkedIn</a>.'

# Check 1: Breadcrumb exists
echo -n "✓ Checking breadcrumb exists... "
if grep -q 'class="breadcrumb"' "$FILE"; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL${NC}"
    echo "  → Missing breadcrumb navigation"
    echo "  → See PAGE_STRUCTURE.md §2"
    ((ERRORS++))
fi

# Check 2: Breadcrumb comes before hero
echo -n "✓ Checking breadcrumb position... "
BREADCRUMB_LINE=$(grep -n 'class="breadcrumb"' "$FILE" | head -1 | cut -d: -f1)
HERO_LINE=$(grep -n 'class="hero"' "$FILE" | head -1 | cut -d: -f1)

if [ ! -z "$BREADCRUMB_LINE" ] && [ ! -z "$HERO_LINE" ]; then
    if [ $BREADCRUMB_LINE -lt $HERO_LINE ]; then
        echo -e "${GREEN}PASS${NC}"
    else
        echo -e "${RED}FAIL${NC}"
        echo "  → Breadcrumb must come before hero section"
        echo "  → See PAGE_STRUCTURE.md §2"
        ((ERRORS++))
    fi
else
    echo -e "${YELLOW}SKIP${NC} (missing breadcrumb or hero)"
fi

# Check 3: Design system CSS is linked
echo -n "✓ Checking design system CSS... "
if grep -q 'href="/styles/design-system.css"' "$FILE"; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL${NC}"
    echo "  → Missing link to /styles/design-system.css"
    echo "  → See PAGE_STRUCTURE.md §1"
    ((ERRORS++))
fi

# Check 4: No inline styles
echo -n "✓ Checking for inline styles... "
if grep -q '<style>' "$FILE"; then
    echo -e "${RED}FAIL${NC}"
    echo "  → Found inline <style> tags - use design-system.css instead"
    echo "  → See PAGE_STRUCTURE.md §1"
    ((ERRORS++))
else
    echo -e "${GREEN}PASS${NC}"
fi

# Check 5: Footer matches standard
echo -n "✓ Checking footer standard... "
if grep -q "$STANDARD_FOOTER" "$FILE"; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL${NC}"
    echo "  → Footer does not match standard pattern"
    echo "  → See PAGE_STRUCTURE.md §8 for exact footer text"
    ((ERRORS++))
fi

# Check 6: External lightbox script (not inline)
echo -n "✓ Checking lightbox script... "
HAS_LIGHTBOX=$(grep -c 'id="lightbox"' "$FILE")

if [ $HAS_LIGHTBOX -gt 0 ]; then
    # Page has lightbox, check if script is external
    if grep -q 'src="/scripts/lightbox.js"' "$FILE"; then
        echo -e "${GREEN}PASS${NC}"
    else
        # Check if there's inline lightbox JavaScript
        if grep -q 'lightbox.*addEventListener\|const lightbox' "$FILE"; then
            echo -e "${RED}FAIL${NC}"
            echo "  → Found inline lightbox JavaScript - use /scripts/lightbox.js instead"
            echo "  → See PAGE_STRUCTURE.md §9"
            ((ERRORS++))
        else
            echo -e "${YELLOW}WARN${NC}"
            echo "  → Lightbox element found but no script reference"
            ((WARNINGS++))
        fi
    fi
else
    echo -e "${YELLOW}SKIP${NC} (no lightbox on page)"
fi

# Check 7: Breadcrumb uses correct separator
echo -n "✓ Checking breadcrumb separator... "
if grep -q 'class="breadcrumb"' "$FILE"; then
    # Extract breadcrumb section
    BREADCRUMB_CONTENT=$(sed -n '/<nav class="breadcrumb">/,/<\/nav>/p' "$FILE")

    if echo "$BREADCRUMB_CONTENT" | grep -q '<span>→</span>'; then
        echo -e "${GREEN}PASS${NC}"
    else
        echo -e "${YELLOW}WARN${NC}"
        echo "  → Breadcrumb should use arrow (→) separator"
        echo "  → See PAGE_STRUCTURE.md §2"
        ((WARNINGS++))
    fi
else
    echo -e "${YELLOW}SKIP${NC} (no breadcrumb)"
fi

# Check 8: Lightbox caption is <p> not <div>
echo -n "✓ Checking lightbox caption element... "
if grep -q 'class="lightbox__caption"' "$FILE"; then
    if grep -q '<p class="lightbox__caption"' "$FILE"; then
        echo -e "${GREEN}PASS${NC}"
    else
        echo -e "${RED}FAIL${NC}"
        echo "  → Lightbox caption should be <p> element, not <div>"
        echo "  → See PAGE_STRUCTURE.md §9"
        ((ERRORS++))
    fi
else
    echo -e "${YELLOW}SKIP${NC} (no lightbox)"
fi

# Check 9: Required fonts are linked
echo -n "✓ Checking font links... "
REQUIRED_FONTS=("Inter" "JetBrains+Mono" "Plus+Jakarta+Sans")
MISSING_FONTS=()

for font in "${REQUIRED_FONTS[@]}"; do
    if ! grep -q "$font" "$FILE"; then
        MISSING_FONTS+=("$font")
    fi
done

if [ ${#MISSING_FONTS[@]} -eq 0 ]; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${YELLOW}WARN${NC}"
    echo "  → Missing fonts: ${MISSING_FONTS[*]}"
    echo "  → See PAGE_STRUCTURE.md §1"
    ((WARNINGS++))
fi

# Check 10: Table of contents exists for long pages
echo -n "✓ Checking table of contents... "
SECTION_COUNT=$(grep -c 'class="section"' "$FILE")

if [ $SECTION_COUNT -ge 3 ]; then
    if grep -q 'class="toc"' "$FILE"; then
        echo -e "${GREEN}PASS${NC}"
    else
        echo -e "${YELLOW}WARN${NC}"
        echo "  → Page has $SECTION_COUNT sections but no table of contents"
        echo "  → Consider adding TOC for easier navigation"
        echo "  → See PAGE_STRUCTURE.md §6"
        ((WARNINGS++))
    fi
else
    echo -e "${YELLOW}SKIP${NC} (only $SECTION_COUNT sections)"
fi

# Summary
echo ""
echo "================================================"
echo "VALIDATION SUMMARY"
echo "================================================"

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed!${NC}"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠ $WARNINGS warning(s)${NC}"
    echo ""
    echo "Warnings don't block commits but should be reviewed."
    exit 0
else
    echo -e "${RED}✗ $ERRORS error(s), $WARNINGS warning(s)${NC}"
    echo ""
    echo "Errors must be fixed before committing."
    echo "See docs/PAGE_STRUCTURE.md for guidance."
    exit 1
fi
