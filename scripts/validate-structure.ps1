# validate-structure.ps1
# Validates HTML page structure against design system standards
# Usage: .\scripts\validate-structure.ps1 filename.html

param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)

# Check if file exists
if (-not (Test-Path $FilePath)) {
    Write-Host "Error: File '$FilePath' not found" -ForegroundColor Red
    exit 1
}

Write-Host "================================================" -ForegroundColor Cyan
Write-Host "Validating: $FilePath" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

$Errors = 0
$Warnings = 0
$Content = Get-Content $FilePath -Raw

# Standard footer text
$StandardFooter = 'Open to senior UX roles. <a href="mailto:mattlelonek@gmail.com">Get in touch</a> or connect on <a href="https://www.linkedin.com/in/m-j-l/" target="_blank" rel="noopener">LinkedIn</a>.'

# Check 1: Breadcrumb exists
Write-Host "✓ Checking breadcrumb exists... " -NoNewline
if ($Content -match 'class="breadcrumb"') {
    Write-Host "PASS" -ForegroundColor Green
} else {
    Write-Host "FAIL" -ForegroundColor Red
    Write-Host "  → Missing breadcrumb navigation" -ForegroundColor Red
    Write-Host "  → See PAGE_STRUCTURE.md §2" -ForegroundColor Yellow
    $Errors++
}

# Check 2: Breadcrumb comes before hero
Write-Host "✓ Checking breadcrumb position... " -NoNewline
$Lines = Get-Content $FilePath
$BreadcrumbLine = ($Lines | Select-String -Pattern 'class="breadcrumb"' | Select-Object -First 1).LineNumber
$HeroLine = ($Lines | Select-String -Pattern 'class="hero"' | Select-Object -First 1).LineNumber

if ($BreadcrumbLine -and $HeroLine) {
    if ($BreadcrumbLine -lt $HeroLine) {
        Write-Host "PASS" -ForegroundColor Green
    } else {
        Write-Host "FAIL" -ForegroundColor Red
        Write-Host "  → Breadcrumb must come before hero section" -ForegroundColor Red
        Write-Host "  → See PAGE_STRUCTURE.md §2" -ForegroundColor Yellow
        $Errors++
    }
} else {
    Write-Host "SKIP (missing breadcrumb or hero)" -ForegroundColor Yellow
}

# Check 3: Design system CSS is linked
Write-Host "✓ Checking design system CSS... " -NoNewline
if ($Content -match 'href="/styles/design-system\.css"') {
    Write-Host "PASS" -ForegroundColor Green
} else {
    Write-Host "FAIL" -ForegroundColor Red
    Write-Host "  → Missing link to /styles/design-system.css" -ForegroundColor Red
    Write-Host "  → See PAGE_STRUCTURE.md §1" -ForegroundColor Yellow
    $Errors++
}

# Check 4: No inline styles
Write-Host "✓ Checking for inline styles... " -NoNewline
if ($Content -match '<style>') {
    Write-Host "FAIL" -ForegroundColor Red
    Write-Host "  → Found inline <style> tags - use design-system.css instead" -ForegroundColor Red
    Write-Host "  → See PAGE_STRUCTURE.md §1" -ForegroundColor Yellow
    $Errors++
} else {
    Write-Host "PASS" -ForegroundColor Green
}

# Check 5: Footer matches standard
Write-Host "✓ Checking footer standard... " -NoNewline
if ($Content -match [regex]::Escape($StandardFooter)) {
    Write-Host "PASS" -ForegroundColor Green
} else {
    Write-Host "FAIL" -ForegroundColor Red
    Write-Host "  → Footer does not match standard pattern" -ForegroundColor Red
    Write-Host "  → See PAGE_STRUCTURE.md §8 for exact footer text" -ForegroundColor Yellow
    $Errors++
}

# Check 6: External lightbox script (not inline)
Write-Host "✓ Checking lightbox script... " -NoNewline
$HasLightbox = ([regex]::Matches($Content, 'id="lightbox"')).Count -gt 0

if ($HasLightbox) {
    if ($Content -match 'src="/scripts/lightbox\.js"') {
        Write-Host "PASS" -ForegroundColor Green
    } else {
        if ($Content -match 'lightbox.*addEventListener|const lightbox') {
            Write-Host "FAIL" -ForegroundColor Red
            Write-Host "  → Found inline lightbox JavaScript - use /scripts/lightbox.js instead" -ForegroundColor Red
            Write-Host "  → See PAGE_STRUCTURE.md §9" -ForegroundColor Yellow
            $Errors++
        } else {
            Write-Host "WARN" -ForegroundColor Yellow
            Write-Host "  → Lightbox element found but no script reference" -ForegroundColor Yellow
            $Warnings++
        }
    }
} else {
    Write-Host "SKIP (no lightbox on page)" -ForegroundColor Yellow
}

# Check 7: Breadcrumb uses correct separator
Write-Host "✓ Checking breadcrumb separator... " -NoNewline
if ($Content -match 'class="breadcrumb"') {
    if ($Content -match '<span>→</span>') {
        Write-Host "PASS" -ForegroundColor Green
    } else {
        Write-Host "WARN" -ForegroundColor Yellow
        Write-Host "  → Breadcrumb should use arrow (→) separator" -ForegroundColor Yellow
        Write-Host "  → See PAGE_STRUCTURE.md §2" -ForegroundColor Yellow
        $Warnings++
    }
} else {
    Write-Host "SKIP (no breadcrumb)" -ForegroundColor Yellow
}

# Check 8: Lightbox caption is <p> not <div>
Write-Host "✓ Checking lightbox caption element... " -NoNewline
if ($Content -match 'class="lightbox__caption"') {
    if ($Content -match '<p class="lightbox__caption"') {
        Write-Host "PASS" -ForegroundColor Green
    } else {
        Write-Host "FAIL" -ForegroundColor Red
        Write-Host "  → Lightbox caption should be <p> element, not <div>" -ForegroundColor Red
        Write-Host "  → See PAGE_STRUCTURE.md §9" -ForegroundColor Yellow
        $Errors++
    }
} else {
    Write-Host "SKIP (no lightbox)" -ForegroundColor Yellow
}

# Check 9: Required fonts are linked
Write-Host "✓ Checking font links... " -NoNewline
$RequiredFonts = @("Inter", "JetBrains\+Mono", "Plus\+Jakarta\+Sans")
$MissingFonts = @()

foreach ($font in $RequiredFonts) {
    if ($Content -notmatch $font) {
        $MissingFonts += $font -replace '\\\+', '+'
    }
}

if ($MissingFonts.Count -eq 0) {
    Write-Host "PASS" -ForegroundColor Green
} else {
    Write-Host "WARN" -ForegroundColor Yellow
    Write-Host "  → Missing fonts: $($MissingFonts -join ', ')" -ForegroundColor Yellow
    Write-Host "  → See PAGE_STRUCTURE.md §1" -ForegroundColor Yellow
    $Warnings++
}

# Check 10: Table of contents exists for long pages
Write-Host "✓ Checking table of contents... " -NoNewline
$SectionCount = ([regex]::Matches($Content, 'class="section"')).Count

if ($SectionCount -ge 3) {
    if ($Content -match 'class="toc"') {
        Write-Host "PASS" -ForegroundColor Green
    } else {
        Write-Host "WARN" -ForegroundColor Yellow
        Write-Host "  → Page has $SectionCount sections but no table of contents" -ForegroundColor Yellow
        Write-Host "  → Consider adding TOC for easier navigation" -ForegroundColor Yellow
        Write-Host "  → See PAGE_STRUCTURE.md §6" -ForegroundColor Yellow
        $Warnings++
    }
} else {
    Write-Host "SKIP (only $SectionCount sections)" -ForegroundColor Yellow
}

# Summary
Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "VALIDATION SUMMARY" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan

if ($Errors -eq 0 -and $Warnings -eq 0) {
    Write-Host "✓ All checks passed!" -ForegroundColor Green
    exit 0
} elseif ($Errors -eq 0) {
    Write-Host "⚠ $Warnings warning(s)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Warnings don't block commits but should be reviewed."
    exit 0
} else {
    Write-Host "✗ $Errors error(s), $Warnings warning(s)" -ForegroundColor Red
    Write-Host ""
    Write-Host "Errors must be fixed before committing."
    Write-Host "See docs/PAGE_STRUCTURE.md for guidance."
    exit 1
}
