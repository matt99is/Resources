# Scripts Documentation

Utility scripts for the Resources site.

---

## validate-structure

Validates HTML pages against design system standards.

### Available Versions

- **Bash**: `validate-structure.sh` (Linux, macOS, Git Bash on Windows)
- **PowerShell**: `validate-structure.ps1` (Windows)

### Usage

**Bash:**
```bash
./scripts/validate-structure.sh your-page.html
```

**PowerShell:**
```powershell
.\scripts\validate-structure.ps1 your-page.html
```

### What It Checks

The validation script performs 10 checks:

1. ✓ **Breadcrumb exists** - Every page must have breadcrumb navigation
2. ✓ **Breadcrumb position** - Must come before hero section
3. ✓ **Design system CSS** - Must link to `/styles/design-system.css`
4. ✓ **No inline styles** - No `<style>` tags (use external CSS)
5. ✓ **Footer standard** - Must match exact standard footer text
6. ✓ **Lightbox script** - Must use external `/scripts/lightbox.js` (not inline)
7. ✓ **Breadcrumb separator** - Should use arrow `→` not `/` or `>`
8. ✓ **Lightbox caption** - Must be `<p>` element, not `<div>`
9. ✓ **Font links** - Must include Inter, JetBrains Mono, Plus Jakarta Sans
10. ✓ **Table of contents** - Pages with 3+ sections should have TOC

### Exit Codes

- `0` - All checks passed (or only warnings)
- `1` - Validation errors found (must fix before committing)

### Output Types

**PASS** (Green) - Check passed ✓
**FAIL** (Red) - Error that must be fixed
**WARN** (Yellow) - Warning that should be reviewed
**SKIP** (Yellow) - Check not applicable to this page

### Examples

**All checks pass:**
```bash
$ ./scripts/validate-structure.sh basket-optimisation-case-study.html
================================================
Validating: basket-optimisation-case-study.html
================================================

✓ Checking breadcrumb exists... PASS
✓ Checking breadcrumb position... PASS
✓ Checking design system CSS... PASS
✓ Checking for inline styles... PASS
✓ Checking footer standard... PASS
✓ Checking lightbox script... PASS
✓ Checking breadcrumb separator... PASS
✓ Checking lightbox caption element... PASS
✓ Checking font links... PASS
✓ Checking table of contents... PASS

================================================
VALIDATION SUMMARY
================================================
✓ All checks passed!
```

**Validation errors:**
```bash
$ ./scripts/validate-structure.sh broken-page.html
================================================
Validating: broken-page.html
================================================

✓ Checking breadcrumb exists... FAIL
  → Missing breadcrumb navigation
  → See PAGE_STRUCTURE.md §2
✓ Checking breadcrumb position... SKIP (missing breadcrumb or hero)
✓ Checking design system CSS... PASS
✓ Checking for inline styles... FAIL
  → Found inline <style> tags - use design-system.css instead
  → See PAGE_STRUCTURE.md §1
✓ Checking footer standard... FAIL
  → Footer does not match standard pattern
  → See PAGE_STRUCTURE.md §8 for exact footer text

================================================
VALIDATION SUMMARY
================================================
✗ 3 error(s), 0 warning(s)

Errors must be fixed before committing.
See docs/PAGE_STRUCTURE.md for guidance.
```

---

## Pre-commit Hook

Automatically validates HTML files before each commit.

### How It Works

1. Hook runs when you execute `git commit`
2. Checks all staged `.html` files
3. Skips templates and UX analysis reports
4. Blocks commit if validation fails
5. Allows commit if all checks pass

### Location

`.git/hooks/pre-commit`

### Bypass (Not Recommended)

If you need to commit despite validation errors:

```bash
git commit --no-verify
```

⚠️ **Warning:** Only use `--no-verify` if you're certain the errors are false positives.

### Disabling the Hook

To temporarily disable:

```bash
# Rename the hook
mv .git/hooks/pre-commit .git/hooks/pre-commit.disabled

# Re-enable later
mv .git/hooks/pre-commit.disabled .git/hooks/pre-commit
```

To permanently remove:

```bash
rm .git/hooks/pre-commit
```

---

## lightbox.js

Reusable lightbox functionality for image viewing.

### Usage

**In your HTML:**

```html
<!-- At the end of body, before </body> -->
<div class="lightbox" id="lightbox">
  <div class="lightbox__content">
    <button class="lightbox__close" aria-label="Close lightbox">&times;</button>
    <img class="lightbox__image" src="" alt="">
    <p class="lightbox__caption"></p>
  </div>
</div>

<script src="/scripts/lightbox.js"></script>
```

**On images you want to be clickable:**

```html
<img src="path/to/image.png" alt="Description" class="lightbox-trigger">
```

### Features

- Click image to view full-screen
- Click outside image to close
- Press ESC key to close
- Click X button to close
- Shows image caption from alt text
- Prevents body scroll while open
- Fully keyboard accessible

### Requirements

- Lightbox HTML structure must have `id="lightbox"`
- Images must have `class="lightbox-trigger"`
- Design system CSS must be loaded (provides `.lightbox` styles)

---

## Adding New Scripts

When adding new utility scripts:

1. Create both `.sh` (Bash) and `.ps1` (PowerShell) versions if applicable
2. Make Bash scripts executable: `chmod +x scripts/script-name.sh`
3. Document usage in this README
4. Include examples and exit codes
5. Follow existing naming conventions
6. Add error handling and helpful error messages

---

## Troubleshooting

### "Permission denied" on Bash script

**Fix:**
```bash
chmod +x scripts/validate-structure.sh
```

### Pre-commit hook not running

**Check if hook is executable:**
```bash
ls -la .git/hooks/pre-commit
```

**Make it executable:**
```bash
chmod +x .git/hooks/pre-commit
```

### Validation script not found in pre-commit

**Check you're in project root:**
```bash
pwd  # Should show .../Resources
```

**Verify script exists:**
```bash
ls scripts/validate-structure.sh
```

### PowerShell execution policy error

**Run as administrator:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

## Development

### Testing Validation Script

Test against existing pages:

```bash
# Should pass
./scripts/validate-structure.sh basket-optimisation-case-study.html
./scripts/validate-structure.sh ace-device-case-study.html
./scripts/validate-structure.sh figma-make-workflow.html

# Templates should also pass
./scripts/validate-structure.sh templates/case-study-template.html
```

### Testing Pre-commit Hook

```bash
# Stage an HTML file
git add some-page.html

# Try to commit (will run validation)
git commit -m "Test commit"

# Hook will block if validation fails
```

### Modifying Validation Rules

Edit `scripts/validate-structure.sh` and `scripts/validate-structure.ps1`.

Keep both versions in sync with identical checks.

**After modifying:**

1. Test on all existing HTML files
2. Update this README if adding/removing checks
3. Update `docs/PAGE_STRUCTURE.md` if changing requirements
4. Commit both script versions together
