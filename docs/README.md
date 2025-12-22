# Documentation Index

Complete guide to creating and maintaining pages in the Resources site.

---

## Quick Start (For New Pages)

**Follow this exact order:**

1. **Read**: [`PAGE_STRUCTURE.md`](PAGE_STRUCTURE.md) - Mandatory page structure and layout
2. **Copy**: Start from a template in `/templates/` directory
3. **Reference**: Use [`COMPONENT_GUIDE.md`](COMPONENT_GUIDE.md) for component usage

**Don't skip step 1.** The page structure document defines non-negotiable patterns that ensure consistency.

---

## Documentation Files

### 1. PAGE_STRUCTURE.md ⭐ **Start Here**
**Purpose:** Defines the mandatory structure for all HTML pages

**What's inside:**
- Exact page order: breadcrumb → hero → toc → sections → footer → lightbox
- Required meta tags and links
- Breadcrumb navigation pattern
- Footer standard (no variations allowed)
- Lightbox implementation
- Complete page structure example
- Verification checklist
- Common mistakes to avoid

**When to use:** Before creating any new HTML page

---

### 2. COMPONENT_GUIDE.md
**Purpose:** Complete reference for all design system components with usage examples

**What's inside:**
- 10 categories of components with code examples
- When to use each component
- Best practices for layout, accessibility, and responsive design
- Metrics, cards, callouts, quotes
- Analysis components (stat-card, competitor-card, charts)
- Guide components (principle-card, prompt-block, checklist)
- Case study components (variant-comparison, before-after, feature-grid)

**When to use:** When adding content to a page and choosing components

---

### 3. DESIGN_SYSTEM.md
**Purpose:** Visual language reference - colors, typography, spacing

**What's inside:**
- Core design principles (warm not sterile, terracotta accent, typography-first)
- Design token reference table
- Typography scale (fonts, sizes, weights)
- Spacing scale patterns
- Do/Don't guidelines
- Color accessibility ratios
- Data visualization color scale

**When to use:**
- When writing custom CSS (use tokens, never hardcode)
- When checking if a design decision aligns with system
- When choosing colors for data visualization

---

### 4. VOICE.md + VOICE_EXAMPLES.md
**Purpose:** Writing style and content guidelines

**What's inside:**
- Tone principles: Direct, evidence-based, technical, unembellished
- Language patterns (active voice, specific verbs, plain language)
- Structure guidelines
- Common mistakes to avoid
- Before/after examples in VOICE_EXAMPLES.md

**When to use:** When writing case study content, headlines, or body copy

---

### 5. UXMATURITY_INTEGRATION.md
**Purpose:** UX Maturity Analysis report publishing and index updating

**What's inside:**
- How UXMaturityAnalysis project publishes reports to Resources
- Automated script for updating index.html
- Directory structure and naming conventions
- Configuration and troubleshooting
- Manual update procedures

**When to use:**
- When publishing new UX analysis reports
- When the index needs updating with new reports
- When troubleshooting integration issues
- When setting up the integration for the first time

---

## Templates

All templates are located in `/templates/` directory:

| Template | Use For | Includes |
|----------|---------|----------|
| `case-study-template.html` | Project case studies | Breadcrumb, hero, TOC, numbered sections, metrics, quotes, footer, lightbox |
| `guide-template.html` | How-to guides and tutorials | Breadcrumb, hero, TOC, principles, prompts, comparisons, footer, lightbox |
| `analysis-report-template.html` | UX analysis reports | Breadcrumb, hero, TOC, stats, charts, competitor cards, footer |

**All templates now include:**
- ✓ Breadcrumb navigation
- ✓ Standard footer (no customization)
- ✓ External lightbox script
- ✓ Proper font and design system links

---

## File Organization

```
Resources/
├── docs/
│   ├── README.md (you are here)
│   ├── PAGE_STRUCTURE.md (mandatory page structure)
│   ├── COMPONENT_GUIDE.md (component reference)
│   ├── DESIGN_SYSTEM.md (visual language)
│   ├── VOICE.md (writing style)
│   ├── VOICE_EXAMPLES.md (writing examples)
│   └── COMPONENTS.md.archive (outdated - superseded by COMPONENT_GUIDE.md)
├── templates/
│   ├── case-study-template.html
│   ├── guide-template.html
│   └── analysis-report-template.html
├── styles/
│   └── design-system.css (DO NOT edit without reading DESIGN_SYSTEM.md)
└── scripts/
    └── lightbox.js (reusable lightbox functionality)
```

---

## Workflow: Creating a New Page

### Step 1: Choose Template
- Case study? → `case-study-template.html`
- Guide/tutorial? → `guide-template.html`
- UX analysis? → `analysis-report-template.html`

### Step 2: Read Documentation
1. Read `PAGE_STRUCTURE.md` (10 min) - understand mandatory structure
2. Skim `COMPONENT_GUIDE.md` - know what components are available
3. Check `VOICE.md` - align on writing style

### Step 3: Copy & Customize Template
```bash
cp templates/case-study-template.html your-new-page.html
```

Replace placeholders:
- `[TITLE]` - Page title
- `[DESCRIPTION]` - Meta description (120-160 chars)
- `[SUBTITLE]` - Hero subtitle
- `[PAGE TITLE]` - Breadcrumb current page
- Section titles, content, images

### Step 4: Add Components
Reference `COMPONENT_GUIDE.md` for:
- Metrics: Use `metric-card`
- Quotes: Use `pull-quote` or `user-quote`
- Insights: Use `callout--insight`
- Comparisons: Use `comparison-grid`
- Data: Use `score-badge`, `stat-card`

### Step 5: Verify Structure
Use the checklist in `PAGE_STRUCTURE.md`:
- [ ] Breadcrumb is first element after `<body>`
- [ ] Breadcrumb uses correct pattern: Home → Current Page
- [ ] Hero section has overline, title, subtitle, meta
- [ ] Images have `class="lightbox-trigger"` and descriptive alt text
- [ ] Table of contents links match section IDs
- [ ] Sections use numbered `.section-header` pattern
- [ ] Footer is exactly the standard footer (no modifications)
- [ ] Lightbox script is external (`/scripts/lightbox.js`), not inline
- [ ] Design system CSS is linked, not inline

### Step 6: Preview & Test
- Open in browser
- Click images (lightbox should work)
- Check mobile responsive
- Verify all links work
- Test keyboard navigation (Tab, ESC key for lightbox)

---

## Common Mistakes (And How to Avoid Them)

| Mistake | Fix | Reference |
|---------|-----|-----------|
| Custom footer per page | Use standard footer exactly | `PAGE_STRUCTURE.md` §8 |
| Inline CSS or JavaScript | Link to external files | `PAGE_STRUCTURE.md` §1, §9 |
| Missing breadcrumb | Add before hero section | `PAGE_STRUCTURE.md` §2 |
| Hardcoded colors/spacing | Use CSS custom properties | `DESIGN_SYSTEM.md` |
| Wrong breadcrumb separator | Use `→` not `/` or `>` | `PAGE_STRUCTURE.md` §2 |
| Lightbox caption as `<div>` | Use `<p>` element | `PAGE_STRUCTURE.md` §9 |
| Generic alt text | Write descriptive alt text | `COMPONENT_GUIDE.md` §7 |
| No `lightbox-trigger` class | Add to make images clickable | `PAGE_STRUCTURE.md` §4 |

---

## Design System Rules

### Never Do This ❌
- Hardcode color values (`#B8432F`)
- Hardcode spacing values (`24px`)
- Create custom footer text
- Inline CSS in `<style>` tags
- Inline JavaScript in `<script>` tags
- Use different breadcrumb patterns
- Skip the breadcrumb
- Use terracotta for large backgrounds

### Always Do This ✅
- Use CSS custom properties (`var(--accent-primary)`)
- Use spacing tokens (`var(--space-6)`)
- Use exact standard footer
- Link to `/styles/design-system.css`
- Link to `/scripts/lightbox.js`
- Include breadcrumb before hero
- Use terracotta sparingly (links, accents, section numbers)

---

## Validation

Before committing any HTML file, run:

```bash
# Check page structure (optional validation script)
./scripts/validate-structure.sh your-page.html
```

The validation script checks:
- Breadcrumb exists and comes first
- Footer matches standard pattern
- No inline styles or scripts
- Design system CSS is linked
- Lightbox script is external

---

## Need Help?

**For structure questions:** Read `PAGE_STRUCTURE.md`
**For component questions:** Search `COMPONENT_GUIDE.md`
**For design questions:** Check `DESIGN_SYSTEM.md`
**For writing questions:** Review `VOICE.md`

**Still stuck?** Look at existing pages:
- `basket-optimisation-case-study.html` - Reference implementation
- `figma-make-workflow.html` - Guide example
- All follow `PAGE_STRUCTURE.md` exactly

---

## Changelog

**December 2024**
- Created comprehensive documentation system
- Established mandatory page structure standard
- Migrated all pages to design system
- Archived outdated COMPONENTS.md (superseded by COMPONENT_GUIDE.md)
- Added templates with breadcrumbs and standard footer
