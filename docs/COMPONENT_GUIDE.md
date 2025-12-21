# Component Usage Guide

Complete reference for all design system components with usage examples and best practices.

## Table of Contents

1. [Page Structure](#page-structure)
2. [Typography](#typography)
3. [Buttons](#buttons)
4. [Cards](#cards)
5. [Metrics & Data](#metrics--data)
6. [Callouts & Quotes](#callouts--quotes)
7. [Images & Media](#images--media)
8. [Analysis Components](#analysis-components)
9. [Guide Components](#guide-components)
10. [Case Study Components](#case-study-components)

---

## Page Structure

### Hero Section
Used at the top of every page for title, subtitle, and metadata.

```html
<section class="hero">
  <div class="container">
    <p class="overline">Case Study</p>
    <h1>Page Title</h1>
    <p class="hero-subtitle">Subtitle describing the page</p>
    <div class="hero-meta">
      <span>December 2025</span>
      <span>•</span>
      <span>10 min read</span>
      <span class="tag">Tag1</span>
      <span class="tag">Tag2</span>
    </div>
  </div>
</section>
```

### Table of Contents
Add after hero section for navigation within long pages.

```html
<nav class="toc">
  <p class="toc-title">Contents</p>
  <ol>
    <li><a href="#section1">Section Title</a></li>
    <li><a href="#section2">Section Title</a></li>
  </ol>
</nav>
```

### Numbered Sections
Standard section structure with number + title + underline.

```html
<section id="section-id" class="section">
  <div class="section-header">
    <span class="section-number">01</span>
    <h2 class="section-title">Section Title</h2>
  </div>
  <!-- Content here -->
</section>
```

---

## Typography

### Headings
- `h1` - Page title (2rem - 2.75rem responsive)
- `h2` - Section titles (1.875rem)
- `h3` - Subsection titles (1.25rem)
- `h4-h6` - Additional hierarchy

### Overline Label
Use for categorization above titles.

```html
<p class="overline">Case Study</p>
```

### Tags
Small colored labels for categorization.

```html
<span class="tag">E-commerce</span>
<span class="tag">UX Research</span>
```

---

## Buttons

### Primary Button
Main call-to-action.

```html
<a href="#" class="btn btn--primary">Primary Action</a>
```

### Secondary Button
Alternative actions.

```html
<button class="btn btn--secondary">Secondary Action</button>
```

### Ghost Button
Minimal style for less prominent actions.

```html
<a href="#" class="btn btn--ghost">Tertiary Action</a>
```

---

## Cards

### Basic Card
Container for grouped content.

```html
<div class="card">
  <h3>Card Title</h3>
  <p>Card content here</p>
</div>
```

### Interactive Card
Adds hover effect for clickable cards.

```html
<a href="#" class="card card--interactive">
  <span class="overline">Label</span>
  <h3 class="card__title">Card Title</h3>
  <p class="card__description">Description text</p>
  <div class="card__meta">
    <span>Meta 1</span>
    <span>•</span>
    <span>Meta 2</span>
  </div>
</a>
```

### Card Grid
Display multiple cards in responsive grid.

```html
<div class="card-grid">
  <div class="card">...</div>
  <div class="card">...</div>
  <div class="card">...</div>
</div>
```

---

## Metrics & Data

### Metric Cards
**Use for:** Key statistics, executive summaries, KPIs

```html
<div class="metrics-highlight">
  <div class="metric-card">
    <div class="metric-value">44.6%</div>
    <div class="metric-label">Abandonment Rate</div>
  </div>
  <div class="metric-card">
    <div class="metric-value large">£57M</div>
    <div class="metric-label">Annual Opportunity</div>
  </div>
</div>
```

**When to use `.metric-value.large`:** For particularly important numbers (revenue, major KPIs).

### Score Badges
**Use for:** Ratings, scores, grades (1-10 scale)

```html
<span class="score-badge score-badge--1">1/10</span>
<span class="score-badge score-badge--5">5/10</span>
<span class="score-badge score-badge--10">10/10</span>
```

**Available variants:**
- `score-badge--1` through `score-badge--10` (color-coded)
- `score-badge--sm` (small variant)
- `score-badge--lg` (large variant)

**Color scale:**
- 1-2: Red (poor)
- 3-4: Orange (fair)
- 5-6: Yellow (average)
- 7-8: Light green (good)
- 9-10: Green (excellent)

---

## Callouts & Quotes

### Pull Quotes
**Use for:** Highlighting key user quotes or important insights

```html
<div class="pull-quote">
  <p>"User quote or important insight here."</p>
</div>
```

### User Quotes Grid
**Use for:** Multiple testimonials or user feedback

```html
<div class="user-quotes">
  <div class="user-quote">
    <p>"First user quote here."</p>
    <span class="user-quote-attribution">— Name, Source</span>
  </div>
  <div class="user-quote">
    <p>"Second user quote here."</p>
    <span class="user-quote-attribution">— Name, Source</span>
  </div>
</div>
```

### Callouts
**Use for:** Highlighting important information, insights, or outcomes

```html
<!-- Insight (purple) -->
<div class="callout callout--insight">
  <p class="callout-label">Key Insight</p>
  <p>Content here explaining the insight.</p>
</div>

<!-- Success (green) -->
<div class="callout callout--success">
  <p class="callout-label">Outcome</p>
  <p>Positive result or solution implemented.</p>
</div>

<!-- Warning (orange) -->
<div class="callout callout--warning">
  <p class="callout-label">Important Note</p>
  <p>Warning or caution information.</p>
</div>

<!-- Info (blue) -->
<div class="callout callout--info">
  <p class="callout-label">Additional Context</p>
  <p>Supplementary information.</p>
</div>
```

**When to use each:**
- `callout--insight`: Research findings, discoveries, key takeaways
- `callout--success`: Positive outcomes, solutions, fixes
- `callout--warning`: Pitfalls to avoid, important considerations
- `callout--info`: Additional context, background information

---

## Images & Media

### Content Images with Captions
**Always use this wrapper** for images in content.

```html
<div class="content-image">
  <img src="path/to/image.png" alt="Descriptive alt text" class="lightbox-trigger">
  <p class="image-caption">Caption describing the image</p>
</div>
```

**Important:** Add `class="lightbox-trigger"` to make images clickable for full-screen viewing.

### Hero Images
Large featured image after hero section.

```html
<div class="container">
  <div class="hero-image">
    <img src="path/to/image.png" alt="Alt text" class="lightbox-trigger">
  </div>
</div>
```

### Lightbox Structure
**Required once per page** at the end before closing `</body>` tag.

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
```

---

## Analysis Components

### Stat Cards
**Use for:** Executive summary statistics in analysis reports

```html
<div class="stat-card">
  <div class="stat-card__value">87.5%</div>
  <div class="stat-card__label">Average Score</div>
</div>
```

### Competitor Cards
**Use for:** Detailed competitor profiles in analysis reports

```html
<div class="competitor-card">
  <div class="competitor-card__header">
    <h3 class="competitor-card__name">Competitor Name</h3>
    <div>
      <span class="competitor-card__rank">#1</span>
      <span class="competitor-card__score">92/100</span>
    </div>
  </div>

  <div class="criteria-grid">
    <div class="criteria-item">
      <span class="criteria-item__name">Navigation</span>
      <span class="score-badge score-badge--9">9/10</span>
    </div>
    <!-- More criteria -->
  </div>
</div>
```

### Rankings Table
**Use for:** Competitive ranking overview

```html
<table class="ranking-table">
  <thead>
    <tr>
      <th>Rank</th>
      <th>Competitor</th>
      <th>Score</th>
      <th>Grade</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="ranking-table__rank">#1</td>
      <td>Company Name</td>
      <td>92/100</td>
      <td><span class="score-badge score-badge--9">A</span></td>
    </tr>
  </tbody>
</table>
```

### Chart Container
**Use for:** Plotly or other data visualizations

```html
<div class="chart-container">
  <h3 class="chart-container__title">Chart Title</h3>
  <div id="chart-element"></div>
</div>
```

**Plotly theme configuration:**
```javascript
const plotlyTheme = {
  layout: {
    font: { family: 'Inter, sans-serif', color: '#1A1A1A' },
    paper_bgcolor: '#FFFCF7',
    plot_bgcolor: '#F8F5F0',
    colorway: ['#B8432F', '#D4A59A', '#9A3626', '#F5E6E3']
  }
};
```

---

## Guide Components

### Principle Cards
**Use for:** Numbered principles, steps, or key points

```html
<div class="principle-card">
  <div class="principle-card__number">1</div>
  <div class="principle-card__content">
    <h3>Principle Title</h3>
    <p>Description of the principle.</p>
  </div>
</div>
```

### Prompt Blocks
**Use for:** Code snippets, prompts, or terminal commands

```html
<div class="prompt-block">
  <span class="prompt-block__label">Example Prompt</span>
  Your code or prompt content here
</div>
```

### Comparison Grid
**Use for:** Good vs. weak examples side-by-side

```html
<div class="comparison-grid">
  <div class="comparison-grid__item comparison-grid__item--good">
    <h4>✓ Good Example</h4>
    <p>Example of the right way to do something.</p>
  </div>
  <div class="comparison-grid__item comparison-grid__item--weak">
    <h4>✗ Weak Example</h4>
    <p>Example of what to avoid.</p>
  </div>
</div>
```

### Pitfall Warnings
**Use for:** Common mistakes or things to avoid

```html
<div class="pitfall-warning">
  <p class="pitfall-warning__title">⚠ Common Pitfall</p>
  <p>Description of what to avoid and why.</p>
</div>
```

### Checklist
**Use for:** Action items or validation lists

```html
<ul class="checklist">
  <li>First checklist item</li>
  <li>Second checklist item</li>
  <li>Third checklist item</li>
</ul>
```

---

## Case Study Components

### Process Flow
**Use for:** Showing multi-step processes

```html
<div class="process-flow">
  <div class="process-step">
    <span class="process-step-number">1</span>
    <span class="process-step-label">Research</span>
  </div>
  <span class="process-arrow">→</span>
  <div class="process-step">
    <span class="process-step-number">2</span>
    <span class="process-step-label">Design</span>
  </div>
  <span class="process-arrow">→</span>
  <div class="process-step">
    <span class="process-step-number">3</span>
    <span class="process-step-label">Test</span>
  </div>
</div>
```

### Variant Comparison
**Use for:** A/B testing results or design variations

```html
<div class="variant-comparison">
  <div class="variant-card">
    <p class="variant-card__label">Variant A</p>
    <h3 class="variant-card__title">Control</h3>
    <img src="variant-a.png" alt="Variant A" class="variant-card__image">
    <div class="variant-card__metrics">
      <div class="variant-metric">
        <div class="variant-metric__value">2.3%</div>
        <div class="variant-metric__label">Conversion</div>
      </div>
    </div>
  </div>

  <div class="variant-card variant-card--winner">
    <p class="variant-card__label">Variant B • Winner</p>
    <h3 class="variant-card__title">New Design</h3>
    <img src="variant-b.png" alt="Variant B" class="variant-card__image">
    <div class="variant-card__metrics">
      <div class="variant-metric">
        <div class="variant-metric__value">3.8%</div>
        <div class="variant-metric__label">Conversion</div>
      </div>
    </div>
  </div>
</div>
```

### Before/After Grid
**Use for:** Showing improvements or changes

```html
<div class="before-after-grid">
  <div class="before-after-item before-after-item--before">
    <p class="before-after-item__label">Before</p>
    <p>Description of the problem state.</p>
  </div>
  <div class="before-after-item before-after-item--after">
    <p class="before-after-item__label">After</p>
    <p>Description of the improved state.</p>
  </div>
</div>
```

### Feature Grid
**Use for:** Showcasing multiple features or capabilities

```html
<div class="feature-grid">
  <div class="feature-card">
    <div class="feature-card__icon">🎯</div>
    <h3 class="feature-card__title">Feature Title</h3>
    <p class="feature-card__description">Feature description here.</p>
  </div>
  <!-- More feature cards -->
</div>
```

### Decision List
**Use for:** Documenting key decisions and their rationale

```html
<ul class="decision-list">
  <li class="decision-item">
    <p class="decision-item__title">Decision Made</p>
    <p class="decision-item__rationale">Explanation of why this decision was made.</p>
  </li>
  <!-- More decisions -->
</ul>
```

### Results Showcase
**Use for:** Highlighting final results with metrics

```html
<div class="results-showcase">
  <h3 class="results-showcase__title">Results</h3>
  <div class="results-showcase__metrics">
    <div class="results-metric">
      <div class="results-metric__value">+47%</div>
      <div class="results-metric__label">Conversion Rate</div>
      <div class="results-metric__change">↑ 2.3% → 3.4%</div>
    </div>
    <!-- More metrics -->
  </div>
</div>
```

---

## Best Practices

### Layout Consistency
- Always wrap main content in `.container` for consistent max-width (1040px)
- Use `.section` for vertical spacing between major content blocks
- Use numbered sections with `.section-header` for case studies and guides

### Accessibility
- Always provide meaningful `alt` text for images
- Use semantic HTML (`<nav>`, `<section>`, `<header>`, `<footer>`)
- Ensure color contrast meets WCAG AA standards
- Add `aria-label` to icon buttons

### Responsive Design
- All components are mobile-responsive by default
- Grids automatically stack on mobile
- Test on mobile devices to verify layouts

### Performance
- Optimize images before uploading (compress PNGs/JPGs)
- Use external `lightbox.js` script (don't inline JavaScript)
- Link to `design-system.css` (don't inline CSS)

### Component Selection
**Ask yourself:**
- Am I showing data/metrics? → Use `metric-card` or `stat-card`
- Am I highlighting a quote? → Use `pull-quote` or `user-quote`
- Am I showing a finding or insight? → Use `callout--insight`
- Am I showing a positive outcome? → Use `callout--success`
- Am I comparing options? → Use `comparison-grid` or `variant-comparison`
- Am I showing a process? → Use `process-flow`

---

## Template Files

Use these starting points for new pages:

- **Case Studies**: `/templates/case-study-template.html`
- **Guides**: `/templates/guide-template.html`
- **Analysis Reports**: `/templates/analysis-report-template.html`

All templates include:
- Standard head section with fonts and design system
- Hero structure
- Table of contents
- Numbered sections
- Footer
- Lightbox structure and script
