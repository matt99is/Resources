# Component Patterns

HTML patterns for each content type. Copy and adapt when building new pages.

## Case Study Components

### Hero Section

```html
<header class="hero">
  <div class="container">
    <span class="overline hero__overline">Case Study</span>
    <h1 class="hero__title">Basket Page Optimisation</h1>
    <p class="hero__subtitle">Reducing £57M in abandoned baskets through research-driven redesign</p>
    
    <div class="meta-row">
      <div class="meta-item">
        <span class="meta-item__label">Role</span>
        <span class="meta-item__value">UX Designer</span>
      </div>
      <div class="meta-item">
        <span class="meta-item__label">Timeline</span>
        <span class="meta-item__value">Q3-Q4 2024</span>
      </div>
      <div class="meta-item">
        <span class="meta-item__label">Status</span>
        <span class="meta-item__value">In Development</span>
      </div>
    </div>
  </div>
</header>
```

### Section with Number

```html
<section class="section">
  <div class="container">
    <div class="section-number">
      <span class="section-number__num">01</span>
      <h2 class="section-number__title">The Problem</h2>
    </div>
    
    <p>Content goes here...</p>
  </div>
</section>
```

### Metrics Grid

```html
<div class="metrics-grid">
  <div class="metric">
    <span class="metric__value">£57M</span>
    <span class="metric__label">Abandoned baskets annually</span>
  </div>
  <div class="metric">
    <span class="metric__value">52.5%</span>
    <span class="metric__label">Basket abandonment rate</span>
  </div>
  <div class="metric">
    <span class="metric__value">-2.4</span>
    <span class="metric__label">Baymard net score (POOR)</span>
  </div>
</div>
```

### Before/After Comparison

```html
<div class="comparison-box">
  <div class="comparison-box__side comparison-box__side--before">
    <span class="comparison-box__label">Before</span>
    <p>Checkout CTA buried below fold. Users couldn't find it.</p>
  </div>
  <div class="comparison-box__side comparison-box__side--after">
    <span class="comparison-box__label">After</span>
    <p>Checkout CTA prominent at top. Users ranked it #1 priority.</p>
  </div>
</div>
```

### Pull Quote

```html
<blockquote class="pull-quote">
  "No two participants organized features identically — our current IA confuses everyone."
  <span class="pull-quote__attribution">— Card sorting analysis finding</span>
</blockquote>
```

## Guide Components

### Table of Contents

```html
<nav class="toc card">
  <h2 class="toc__title">Contents</h2>
  <ol class="toc__list">
    <li><a href="#section-1">Getting Started</a></li>
    <li><a href="#section-2">Core Concepts</a></li>
    <li><a href="#section-3">Advanced Usage</a></li>
  </ol>
</nav>
```

### Callout Boxes

```html
<!-- Tip -->
<div class="callout callout--tip">
  <span class="callout__label">Tip</span>
  <p>Start with AI-generated wireframes, then refine into functional prototypes.</p>
</div>

<!-- Warning -->
<div class="callout callout--warning">
  <span class="callout__label">Warning</span>
  <p>Don't hardcode values — always use design tokens.</p>
</div>

<!-- Info -->
<div class="callout callout--info">
  <span class="callout__label">Note</span>
  <p>This approach requires engineering buy-in early in the process.</p>
</div>
```

### Code Block

```html
<pre><code>const getScoreColor = (score) => {
  if (score <= 2) return 'var(--data-1)';
  if (score <= 4) return 'var(--data-2)';
  if (score <= 6) return 'var(--data-3)';
  if (score <= 8) return 'var(--data-4)';
  return 'var(--data-5)';
};</code></pre>
```

## Data Visualisation Components

### Score Badge

```html
<span class="score-badge score-badge--8">8</span>
<span class="score-badge score-badge--3">3</span>
```

### Data Table

```html
<table class="data-table">
  <thead>
    <tr>
      <th>Feature</th>
      <th>Avg Rank</th>
      <th>Priority</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Checkout CTA</td>
      <td><span class="score-badge score-badge--1">1.6</span></td>
      <td>Critical</td>
    </tr>
    <tr>
      <td>Basket Totals</td>
      <td><span class="score-badge score-badge--2">2.2</span></td>
      <td>High</td>
    </tr>
  </tbody>
</table>
```

## Button Patterns

```html
<!-- Primary action -->
<a href="#" class="btn btn--primary">View Prototype</a>

<!-- Secondary action -->
<a href="#" class="btn btn--secondary">Download PDF</a>

<!-- Ghost/text link style -->
<a href="#" class="btn btn--ghost">Learn more →</a>
```

## Card Patterns

```html
<!-- Static card -->
<div class="card">
  <h3>Card Title</h3>
  <p>Card content goes here.</p>
</div>

<!-- Interactive/clickable card -->
<a href="#" class="card card--interactive">
  <span class="overline">Case Study</span>
  <h3>Minibasket Modal</h3>
  <p>4.4% AOV increase through modal optimisation</p>
</a>
```

## Page Structure Template

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Page Title | Matt Lelonek</title>
  
  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;600;700&family=Plus+Jakarta+Sans:wght@500;600;700&display=swap" rel="stylesheet">
  
  <!-- Design System -->
  <link rel="stylesheet" href="/styles/design-system.css">
</head>
<body>
  <header class="hero">
    <!-- Hero content -->
  </header>
  
  <main>
    <section class="section">
      <div class="container">
        <!-- Section content -->
      </div>
    </section>
  </main>
  
  <footer class="section">
    <div class="container">
      <!-- Footer content -->
    </div>
  </footer>
</body>
</html>
```
