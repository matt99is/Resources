# Design System Reference

This document defines the visual language for Matt Lelonek's Resources site. **Read this before creating any HTML, CSS, or component code.**

## Core Principles

1. **Warm, not sterile** — Cream backgrounds (#FFFCF7), not stark white
2. **Terracotta as accent** — Use sparingly for links, CTAs, and emphasis
3. **Typography-first** — Let the type hierarchy do the heavy lifting
4. **Generous spacing** — Breathe. Don't cram.
5. **Consistent, not repetitive** — Same tokens, varied application

## Design Tokens

Always use CSS custom properties. Never hardcode values.

### Colours

| Token | Value | Usage |
|-------|-------|-------|
| `--bg-primary` | #FFFCF7 | Main background (warm cream) |
| `--bg-secondary` | #F8F5F0 | Cards, sidebar |
| `--bg-tertiary` | #F0EBE3 | Hover states, subtle borders |
| `--bg-code` | #2D2A26 | Code blocks (dark warm) |
| `--accent-primary` | #B8432F | Links, CTAs, emphasis (terracotta) |
| `--accent-hover` | #9A3626 | Hover states |
| `--accent-light` | #F5E6E3 | Subtle highlights |
| `--text-primary` | #1A1A1A | Headings, body text |
| `--text-secondary` | #4A4A4A | Secondary text |
| `--text-muted` | #6B6B6B | Captions, meta |

### Typography

| Element | Font | Size | Weight |
|---------|------|------|--------|
| H1 | Plus Jakarta Sans | --text-4xl (36px) | 700 |
| H2 | Plus Jakarta Sans | --text-3xl (30px) | 700 |
| H3 | Plus Jakarta Sans | --text-2xl (24px) | 700 |
| Body | Inter | --text-base (16px) | 400 |
| Caption | Inter | --text-sm (14px) | 400 |
| Overline | Inter | --text-xs (12px) | 600, uppercase |
| Metric value | JetBrains Mono | --text-3xl | 700 |
| Code | JetBrains Mono | --text-sm | 400 |

### Spacing Scale

Use the spacing tokens: `--space-1` (4px) through `--space-24` (96px).

Common patterns:
- Section padding: `--space-12` (48px)
- Card padding: `--space-6` (24px)
- Paragraph margin: `--space-4` (16px)
- Tight gaps: `--space-2` (8px)

## Do / Don't

### Do

- Use `--bg-primary` (#FFFCF7) as the main background, never pure white
- Apply terracotta sparingly — links, CTAs, section numbers, left borders on quotes
- Use `--font-mono` for all numeric data, metrics, and code
- Add generous vertical spacing between sections
- Keep body text max-width at `65ch` for readability
- Use the `.overline` class for section labels (e.g., "01 / The Problem")

### Don't

- Use terracotta for large background areas (use `--accent-light` instead)
- Mix multiple accent colours — terracotta is the only accent
- Use `--font-display` for body text — it's for headings and UI only
- Skip the left border on quotes and callouts — it's a key visual signature
- Use shadows heavily — this is a flat, warm design
- Hardcode any colour or spacing value

## Fonts

Include in `<head>`:

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;600;700&family=Plus+Jakarta+Sans:wght@500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/styles/design-system.css">
```

## Accessibility

- All text meets WCAG AA contrast (4.5:1 for body, 3:1 for large text)
- `--text-primary` on `--bg-primary`: 7.2:1 ✓
- `--accent-primary` on `--bg-primary`: 4.6:1 ✓
- Focus states use `--accent-primary` with visible outline
- Interactive elements have minimum 44×44px touch targets

## Data Visualisation Scale

For scores, rankings, and heatmaps:

| Score Range | Token | Colour |
|-------------|-------|--------|
| 1-2 (Poor) | --data-1 | #D32F2F (Red) |
| 3-4 | --data-2 | #F57C00 (Orange) |
| 5-6 | --data-3 | #FBC02D (Yellow) |
| 7-8 | --data-4 | #7CB342 (Light green) |
| 9-10 (Excellent) | --data-5 | #2E7D32 (Green) |

Use `.score-badge--N` classes where N is the score (1-10).
