# Page Structure Standard

This document defines the **mandatory structure** for all HTML pages in the Resources site. Follow this structure exactly to ensure consistency across case studies, guides, and analysis reports.

## Standard Page Order

Every page must follow this exact order:

1. **Breadcrumb** (Required)
2. **Hero** (Required)
3. **Hero Image** (Optional)
4. **Table of Contents** (Required for long pages)
5. **Numbered Sections** (Required)
6. **Footer** (Required)
7. **Lightbox** (Required if page has images)
8. **Copy Script** (Required for guides with code/prompt blocks)

---

## 1. Document Head

### Required Meta Tags and Links

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="[DESCRIPTION - 120-160 characters]">
  <meta name="author" content="Matt Lelonek">
  <title>[PAGE TITLE] | Matt Lelonek</title>
  <link rel="icon" type="image/svg+xml" href="/favicon.svg">

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;600;700&family=Plus+Jakarta+Sans:wght@500;600;700&display=swap" rel="stylesheet">

  <!-- Design System -->
  <link rel="stylesheet" href="/styles/design-system.css">
</head>
<body>
```

**Critical:**
- Always link to `/styles/design-system.css` (never inline CSS)
- Always include the three font families in the Google Fonts link
- Never skip the meta description

---

## 2. Breadcrumb Navigation

### Required Structure

```html
<!-- Breadcrumb -->
<div class="container">
  <nav class="breadcrumb">
    <a href="index.html">Home</a>
    <span>→</span>
    <span>[Current Page Title]</span>
  </nav>
</div>
```

**Rules:**
- ✅ Must be the **first element** after `<body>`
- ✅ Always starts with "Home" → current page
- ✅ Use arrow (`→`) as separator, not `/` or `>`
- ✅ Current page is plain `<span>`, not a link
- ✅ Wrap in semantic `<nav>` element with `class="breadcrumb"`
- ✅ Wrap in `<div class="container">` for consistent width

**Examples:**
```html
<!-- Case Study -->
<span>Basket Optimisation</span>

<!-- Guide -->
<span>Figma Make Workflow</span>

<!-- Analysis Report -->
<span>Product Page Analysis</span>
```

---

## 3. Hero Section

### Required Structure

```html
<!-- Hero -->
<section class="hero">
  <div class="container">
    <p class="overline">[Page Type]</p>
    <h1>[Page Title]</h1>
    <p class="hero-subtitle">[Subtitle - 1-2 sentences max]</p>
    <div class="hero-meta">
      <span>[Meta 1]</span>
      <span>•</span>
      <span>[Meta 2]</span>
      <span>•</span>
      <span>[Meta 3]</span>
    </div>
  </div>
</section>
```

**Overline Options:**
- Case Study: `<p class="overline">Case Study</p>`
- Guide: `<p class="overline">Guide</p>`
- Analysis: `<p class="overline">UX Analysis Report</p>`

**Meta Pattern:**
- Use bullet separator (`•`) between items
- Common meta: Date, Timeline, Methods, Competitors, Read time
- Keep to 3-5 items maximum

---

## 4. Hero Image (Optional)

If the page has a featured image, place it immediately after the hero section:

```html
<!-- Hero Image -->
<div class="container">
  <div class="hero-image">
    <img src="images/[filename].png" alt="[Descriptive alt text]" class="lightbox-trigger">
  </div>
</div>
```

**Rules:**
- ✅ Always add `class="lightbox-trigger"` to make image clickable
- ✅ Use descriptive alt text, not generic "hero image"
- ✅ Place images in `/images/` directory
- ✅ Optimize images before upload (compress PNGs/JPGs)

---

## 5. Main Content Container

```html
<!-- Main Content -->
<main class="container">
```

All content sections go inside this container.

---

## 6. Table of Contents

### Required for Long Pages

```html
<!-- Table of Contents -->
<nav class="toc">
  <p class="toc-title">Contents</p>
  <ol>
    <li><a href="#section1">[Section 1 Title]</a></li>
    <li><a href="#section2">[Section 2 Title]</a></li>
    <li><a href="#section3">[Section 3 Title]</a></li>
  </ol>
</nav>
```

**When to use:**
- ✅ Pages with 3+ main sections
- ✅ All case studies and guides
- ✅ Analysis reports

**Rules:**
- Use ordered list (`<ol>`) for automatic numbering
- Link anchors match section IDs
- Keep titles concise (3-5 words)

---

## 7. Numbered Sections

### Standard Section Pattern

```html
<!-- Section 01: [Title] -->
<section id="section-id" class="section">
  <div class="section-header">
    <span class="section-number">01</span>
    <h2 class="section-title">[Section Title]</h2>
  </div>

  <p>[Content paragraphs here]</p>

  <!-- Components as needed -->

</section>
```

**Rules:**
- ✅ Always include section number (01, 02, 03...)
- ✅ Use semantic `<section>` element with unique `id`
- ✅ Wrap number + title in `.section-header`
- ✅ Use `.section-title` for consistency

---

## 8. Footer

### Required Structure (Exact Match)

```html
<!-- Footer -->
<footer class="site-footer">
  <div class="container">
    <p>Open to senior UX roles. <a href="mailto:mattlelonek@gmail.com">Get in touch</a> or connect on <a href="https://www.linkedin.com/in/m-j-l/" target="_blank" rel="noopener">LinkedIn</a>.</p>
  </div>
</footer>
```

**Rules:**
- ✅ **Identical footer on every page** - no variations
- ✅ Use `class="site-footer"` on `<footer>` element
- ✅ Wrap content in `<div class="container">`
- ✅ Include `target="_blank" rel="noopener"` on external links
- ✅ Footer goes **after** `</main>` closing tag

**Do NOT:**
- ❌ Create custom footers for different pages
- ❌ Add "Back to Home" links
- ❌ Add version numbers or timestamps
- ❌ Change the footer text

---

## 9. Lightbox (Required for Image Pages)

### Required Structure

```html
<!-- Lightbox -->
<div class="lightbox" id="lightbox">
  <div class="lightbox__content">
    <button class="lightbox__close" aria-label="Close lightbox">&times;</button>
    <img class="lightbox__image" src="" alt="">
    <p class="lightbox__caption"></p>
  </div>
</div>

<!-- Lightbox Script -->
<script src="/scripts/lightbox.js"></script>

</body>
</html>
```

**Rules:**
- ✅ Always use external script: `/scripts/lightbox.js`
- ✅ **Never inline the JavaScript** - use external file
- ✅ Place before closing `</body>` tag
- ✅ Use `<p>` for caption, not `<div>`

---

## 10. Copy-to-Clipboard Script (Required for Guide Pages)

### When to Include

Add this script to pages with code blocks (`<pre>`) or prompt blocks (`.prompt-block`):
- Guides with copyable prompts or templates
- Documentation with code examples
- Any page where users need to copy content

### Required Structure

```html
<!-- Copy Code Script -->
<script src="/scripts/copy-code.js"></script>

</body>
</html>
```

**Rules:**
- ✅ Place after lightbox script (if present), before closing `</body>` tag
- ✅ Script automatically adds "Copy" button to all `<pre>` and `.prompt-block` elements
- ✅ Button appears on hover and shows "Copied!" feedback

**Note:** See COMPONENT_GUIDE.md for when to use `<pre><code>` vs `.prompt-block`.

---

## Complete Page Structure Example

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Meta tags, fonts, design system -->
</head>
<body>

  <!-- Breadcrumb -->
  <div class="container">
    <nav class="breadcrumb">
      <a href="index.html">Home</a>
      <span>→</span>
      <span>Page Title</span>
    </nav>
  </div>

  <!-- Hero -->
  <section class="hero">
    <div class="container">
      <p class="overline">Case Study</p>
      <h1>Page Title</h1>
      <p class="hero-subtitle">Subtitle</p>
      <div class="hero-meta">
        <span>Meta</span>
      </div>
    </div>
  </section>

  <!-- Hero Image (optional) -->
  <div class="container">
    <div class="hero-image">
      <img src="images/hero.png" alt="Description" class="lightbox-trigger">
    </div>
  </div>

  <!-- Main Content -->
  <main class="container">

    <!-- Table of Contents -->
    <nav class="toc">
      <p class="toc-title">Contents</p>
      <ol>
        <li><a href="#section1">Section 1</a></li>
        <li><a href="#section2">Section 2</a></li>
      </ol>
    </nav>

    <!-- Section 01 -->
    <section id="section1" class="section">
      <div class="section-header">
        <span class="section-number">01</span>
        <h2 class="section-title">Section Title</h2>
      </div>
      <p>Content here</p>
    </section>

    <!-- More sections... -->

  </main>

  <!-- Footer -->
  <footer class="site-footer">
    <div class="container">
      <p>Open to senior UX roles. <a href="mailto:mattlelonek@gmail.com">Get in touch</a> or connect on <a href="https://www.linkedin.com/in/m-j-l/" target="_blank" rel="noopener">LinkedIn</a>.</p>
    </div>
  </footer>

  <!-- Lightbox -->
  <div class="lightbox" id="lightbox">
    <div class="lightbox__content">
      <button class="lightbox__close" aria-label="Close lightbox">&times;</button>
      <img class="lightbox__image" src="" alt="">
      <p class="lightbox__caption"></p>
    </div>
  </div>

  <!-- Lightbox Script -->
  <script src="/scripts/lightbox.js"></script>

  <!-- Copy Code Script (for guides with code/prompt blocks) -->
  <script src="/scripts/copy-code.js"></script>

</body>
</html>
```

---

## Quick Checklist

Before publishing any page, verify:

- [ ] Breadcrumb is first element after `<body>`
- [ ] Breadcrumb uses correct pattern: Home → Current Page
- [ ] Hero section has overline, title, subtitle, meta
- [ ] Images have `class="lightbox-trigger"` and descriptive alt text
- [ ] Table of contents links match section IDs
- [ ] Sections use numbered `.section-header` pattern
- [ ] Footer is **exactly** the standard footer (no modifications)
- [ ] Lightbox script is external (`/scripts/lightbox.js`), not inline
- [ ] Copy script included for guides with code/prompt blocks (`/scripts/copy-code.js`)
- [ ] Design system CSS is linked (`/styles/design-system.css`), not inline

---

## Template Files

Use these starting points for new pages:

- **Case Studies**: `/templates/case-study-template.html`
- **Guides**: `/templates/guide-template.html`
- **Analysis Reports**: `/templates/analysis-report-template.html`

All templates now include the correct breadcrumb, footer, lightbox structure, and copy-code script.

---

## Common Mistakes to Avoid

❌ **Wrong:** Custom footer for each page
✅ **Right:** Identical standard footer everywhere

❌ **Wrong:** Inline JavaScript or CSS
✅ **Right:** External `/scripts/lightbox.js` and `/styles/design-system.css`

❌ **Wrong:** Breadcrumb after hero
✅ **Right:** Breadcrumb first, then hero

❌ **Wrong:** Using `/` or `>` as breadcrumb separator
✅ **Right:** Arrow `→` as separator

❌ **Wrong:** Lightbox caption as `<div>`
✅ **Right:** Lightbox caption as `<p>`

❌ **Wrong:** Missing `<nav>` wrapper on breadcrumb
✅ **Right:** Breadcrumb wrapped in `<nav class="breadcrumb">`
