# UX Maturity Analysis Integration

This document explains how the UXMaturityAnalysis project publishes reports to the Resources project and updates the index page.

---

## Overview

The **UXMaturityAnalysis** project generates competitive UX maturity reports and publishes them to the **Resources** project in the `ux-analysis/` directory. An automated script updates `index.html` to include new reports in the "Analysis Reports" section.

### Project Structure

```
Projects/
├── UXMaturityAnalysis/          # Report generation project
│   ├── scripts/
│   │   └── update_resources_index.py   # Index update script
│   ├── resources_integration_config.json  # Configuration
│   └── output/                  # Generated reports
│
└── Resources/                   # Portfolio/docs site (this project)
    ├── index.html              # Homepage with report links
    ├── ux-analysis/            # Published reports directory
    │   ├── 2025-11-24_basket_pages/
    │   │   └── 2025-11-24_basket_pages_report.html
    │   └── 2025-11-21_product_pages/
    │       └── 2025-11-21_product_pages_report.html
    └── docs/
        └── UXMATURITY_INTEGRATION.md (this file)
```

---

## Publishing Workflow

### 1. Generate Report in UXMaturityAnalysis

```bash
cd Projects/UXMaturityAnalysis

# Run analysis
python main.py

# Reports are generated in output/
```

### 2. Copy Report to Resources

The generated report needs to be copied to `Resources/ux-analysis/`:

```bash
# Example structure
Resources/ux-analysis/YYYY-MM-DD_page_type/
├── YYYY-MM-DD_page_type_report.html  # Main report
├── competitor1/                       # Competitor directories
│   └── screenshots/
├── competitor2/
│   └── screenshots/
└── ...
```

**Directory naming convention:** `YYYY-MM-DD_page_type`
- `YYYY-MM-DD`: Analysis date
- `page_type`: Type of pages analyzed (e.g., `basket_pages`, `product_pages`, `checkout_flow`)

### 3. Update Resources Index

From the UXMaturityAnalysis project, run:

```bash
python scripts/update_resources_index.py
```

**What this does:**
1. Scans `Resources/ux-analysis/` for report directories
2. Extracts metadata (date, page type, competitor count)
3. Generates HTML cards following Resources design system
4. Updates the "Analysis Reports" section in `Resources/index.html`
5. Preserves existing structure and formatting

**Output:**
```
==> Updating Resources index with UX Analysis reports...

Resources path: C:\Projects\Resources
UX Analysis dir: C:\Projects\Resources\ux-analysis

Found 2 report(s):
  * Basket Pages UX Analysis (Nov 2025) - 16 competitors
  * Product Pages UX Analysis (Nov 2025) - 2 competitors

[+] Updated existing Analysis Reports section
[+] Successfully updated C:\Projects\Resources\index.html
    Added 2 report(s) to index

SUCCESS: Index updated!
```

### 4. Review and Commit

```bash
cd ../Resources

# Review changes
git diff index.html

# Commit if everything looks good
git add index.html
git add ux-analysis/YYYY-MM-DD_page_type/  # If new report
git commit -m "Add [Page Type] UX Analysis report (YYYY-MM-DD)"
git push
```

---

## HTML Structure Generated

The script generates HTML following the Resources design system defined in `docs/PAGE_STRUCTURE.md`:

```html
<!-- Analysis Reports -->
<section class="section" id="analysis">
  <h2 class="overline mb-4">Analysis Reports</h2>

  <div class="card-grid">
    <a href="ux-analysis/2025-11-24_basket_pages/2025-11-24_basket_pages_report.html" class="card card--interactive">
      <span class="overline">Analysis</span>
      <h3 class="card__title">Basket Pages UX Analysis</h3>
      <p class="card__description">Competitive UX maturity analysis across 16 competitors.</p>
      <div class="card__meta">
        <span>16 Competitors</span>
        <span>•</span>
        <span>E-commerce</span>
      </div>
    </a>

    <!-- More reports... -->
  </div>
</section>
```

**Key design system elements:**
- `card card--interactive` - Interactive card component
- `overline` - Category label
- `card__title` - Card title
- `card__description` - Description text
- `card__meta` - Metadata with bullet (`•`) separators

---

## Configuration

### UXMaturityAnalysis Config

**File:** `UXMaturityAnalysis/resources_integration_config.json`

```json
{
  "resources_project_path": "../Resources",
  "output_subfolder": "ux-analysis",
  "index_section_title": "Analysis Reports",
  "update_index": true
}
```

**Options:**
- `resources_project_path` - Relative path to Resources project
- `output_subfolder` - Subdirectory for reports (`ux-analysis`)
- `index_section_title` - Section heading in index.html
- `update_index` - Whether to update index (true/false)

---

## Script Behavior

### Metadata Extraction

The script automatically extracts:
- **Date**: From directory name `YYYY-MM-DD`
- **Page Type**: From directory name, converted to title case
- **Competitor Count**: Number of subdirectories (excluding hidden/special)
- **Report Path**: Relative path from Resources root

### Section Insertion Logic

1. **If Analysis Reports section exists**: Replaces entire section
2. **If section doesn't exist**: Inserts after "Guides & Resources" section
3. **Fallback**: Inserts before `</main>` if guides section not found

### Report Sorting

Reports are sorted by date (newest first) automatically.

---

## Validation

After updating the index, validate the HTML structure:

```bash
cd ../Resources

# Run validation script
./scripts/validate-structure.sh index.html
```

**The validation checks:**
- Design system CSS is linked
- No inline styles
- Footer matches standard
- Proper HTML structure

---

## Troubleshooting

### Script Can't Find Resources Project

**Error:**
```
ERROR: Resources path not found: C:\Projects\Resources
```

**Fix:**
Update `resources_integration_config.json`:
```json
{
  "resources_project_path": "../Resources"  // Adjust path
}
```

### No Reports Found

**Error:**
```
WARNING: No reports found. Run an analysis first!
```

**Check:**
1. Reports exist in `Resources/ux-analysis/`
2. Directory naming follows `YYYY-MM-DD_page_type` convention
3. Each directory contains `*_report.html` file

### Wrong HTML Structure Generated

**Problem:** Generated HTML doesn't match design system

**Fix:**
1. Check `docs/PAGE_STRUCTURE.md` for current pattern
2. Update `update_resources_index.py` in UXMaturityAnalysis
3. Ensure script uses correct classes:
   - `card card--interactive` (not `doc-card`)
   - `overline` (not `tag`)
   - `card__title`, `card__description`, `card__meta`

### Encoding Errors on Windows

**Error:**
```
UnicodeEncodeError: 'charmap' codec can't encode character...
```

**Already Fixed:** Script now uses ASCII-safe output (no emojis)

---

## Manual Updates

If you need to manually add a report to index.html:

### 1. Add Report Card

Insert in the `card-grid` div within the Analysis Reports section:

```html
<a href="ux-analysis/YYYY-MM-DD_page_type/YYYY-MM-DD_page_type_report.html" class="card card--interactive">
  <span class="overline">Analysis</span>
  <h3 class="card__title">[Page Type] UX Analysis</h3>
  <p class="card__description">Competitive UX maturity analysis across [N] competitors.</p>
  <div class="card__meta">
    <span>[N] Competitors</span>
    <span>•</span>
    <span>E-commerce</span>
  </div>
</a>
```

### 2. Maintain Sort Order

Reports should be sorted by date (newest first). Place new reports at the top of the `card-grid`.

### 3. Validate

```bash
./scripts/validate-structure.sh index.html
```

---

## Best Practices

### Before Publishing

- [ ] Generate report in UXMaturityAnalysis
- [ ] Review report HTML for quality
- [ ] Copy entire report directory to `Resources/ux-analysis/`
- [ ] Follow naming convention: `YYYY-MM-DD_page_type`
- [ ] Include all assets (screenshots, images)

### When Running Script

- [ ] Run from UXMaturityAnalysis project root
- [ ] Review script output for errors
- [ ] Check report count matches expectations
- [ ] Note which reports were added/updated

### After Updating Index

- [ ] Review changes with `git diff index.html`
- [ ] Validate HTML structure
- [ ] Test links to reports work
- [ ] Check responsive layout (mobile, tablet, desktop)
- [ ] Commit with descriptive message
- [ ] Push to remote repository

### Maintenance

- [ ] Keep script synchronized with design system changes
- [ ] Update config if project paths change
- [ ] Document any custom modifications
- [ ] Test script after major design system updates

---

## Design System Compliance

The integration script follows all Resources design system standards:

✅ Uses external CSS (`/styles/design-system.css`)
✅ Uses design system components (`card`, `overline`, `card__meta`)
✅ Uses bullet separator (`•`) for metadata
✅ Maintains semantic HTML structure
✅ No inline styles or custom CSS
✅ Follows `PAGE_STRUCTURE.md` patterns
✅ Compatible with validation scripts

---

## Future Enhancements

Potential improvements to the integration:

1. **Automated Copy**: Script copies reports from UXMaturityAnalysis output to Resources
2. **Git Integration**: Automatically commit and push changes
3. **Date Formatting**: Add more date format options
4. **Category Tags**: Support multiple category tags beyond "E-commerce"
5. **Report Screenshots**: Auto-generate preview images for cards
6. **Netlify Deploy**: Trigger automatic deployment after update
7. **Changelog**: Maintain changelog of report publications
8. **Archive**: Move old reports to archive section after X months

---

## Related Documentation

- **Resources Design System**: `docs/DESIGN_SYSTEM.md`
- **Page Structure Standards**: `docs/PAGE_STRUCTURE.md`
- **Component Guide**: `docs/COMPONENT_GUIDE.md`
- **Validation Scripts**: `scripts/README.md`

---

## Support

If you encounter issues with the integration:

1. Check this documentation first
2. Review UXMaturityAnalysis documentation
3. Validate HTML with `./scripts/validate-structure.sh`
4. Check git status and diffs
5. Test the integration script manually

**Common issues are documented in the Troubleshooting section above.**
