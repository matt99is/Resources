# Resources

A curated collection of UX case studies, prototyping guides, and competitive analysis reports.

[![Netlify Status](https://img.shields.io/badge/netlify-deployed-success)](https://www.netlify.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## Overview

This repository hosts a professional UX resources hub featuring:

- **Case Studies** - Real-world UX projects with detailed process and outcomes
- **Guides** - Technical documentation and workflow references
- **UX Analysis Reports** - Competitive intelligence and maturity assessments

Built as a static site optimized for Netlify deployment.

---

## Structure

```
Resources/
├── index.html                    # Main directory page
├── ace-device-case-study.html   # Enterprise device design case study
├── minibasket-case-study.html   # E-commerce optimization case study
├── figma-make-workflow.html     # AI-assisted prototyping guide
├── ux-analysis/                 # UX maturity analysis reports
│   ├── YYYY-MM-DD_page_type/    # Individual analysis folders
│   └── ...                      # Screenshots, data, HTML reports
├── images/                      # Case study images
├── favicon.svg                  # Site icon
├── 404.html                     # Custom error page
└── netlify.toml                 # Deployment configuration
```

---

## Content

### Case Studies (3)

**ACE Device - Unified Tool for Store Colleagues**
- Ground-up enterprise device design
- Design system development
- User research with store colleagues
- *Keywords: Enterprise, Design System, UX Research*

**Minibasket Redesign - Increasing AOV**
- E-commerce optimization
- A/B testing with 4 variants
- £2 AOV lift across platforms
- *Keywords: E-commerce, A/B Testing, Prototyping*

**Basket Optimisation - Tackling 45% Abandonment Rate**
- Research-driven basket page redesign
- Baymard audit with 6 violations identified
- Comprehensive user research and testing
- Hi-fi React prototype with A/B variants
- *Keywords: E-commerce, UX Research, Baymard Audit*

### Guides (1)

**Figma Make Workflow**
- AI-assisted prototyping with Figma Make
- Claude Code integration
- React project workflow
- *Keywords: AI Tools, Prototyping, Documentation*

### UX Analysis Reports (2)

**Basket Pages UX Analysis**
- 16 competitor analysis
- Interactive charts and filters
- Desktop & mobile evaluation
- *Keywords: Competitive Analysis, E-commerce*

**Product Pages UX Analysis**
- 2 competitor deep-dive
- UX maturity scoring
- Research-backed criteria
- *Keywords: UX Research, Competitive Intelligence*

---

## Features

### Visual Design
- Clean, minimal interface
- Responsive layout (mobile-first)
- Consistent typography and spacing
- Color-coded content types:
  - 🟢 Green: Case Studies
  - 🔵 Blue: Guides
  - 🟣 Purple: Analysis Reports

### User Experience
- Fast loading static HTML
- Optimized images
- Clear navigation
- Reading time estimates
- Document metadata (date, tags, counts)

### Technical
- No dependencies (vanilla HTML/CSS)
- SEO optimized with meta tags
- Security headers via Netlify
- Custom 404 page
- SVG favicon for scalability

---

## Deployment

### Prerequisites
- Netlify account
- GitHub repository connected

### Deploy to Netlify

1. **Connect Repository**
   ```
   New site → Import from Git → Select: matt99is/Resources
   ```

2. **Build Settings**
   - Build command: (leave empty)
   - Publish directory: `/`
   - No build process needed (static site)

3. **Deploy**
   - Click "Deploy site"
   - Site live in < 1 minute

### Configuration

The `netlify.toml` file includes:
- Custom 404 redirects
- Security headers (X-Frame-Options, CSP)
- Cache control for static assets

---

## Maintenance

### Adding New Case Studies

1. Create HTML file following existing structure
2. Add meta tags (title, description, author)
3. Include favicon link
4. Add images to `/images/`
5. Update `index.html` with new card
6. Increment section count

### Adding New UX Analysis Reports

Reports are automatically added via the [UXMaturityAnalysis](https://github.com/matt99is/UXMaturityAnalysis) tool:

```bash
cd UXMaturityAnalysis
python main.py --config competitors.json
```

The script will:
- Generate the analysis report
- Save to `/ux-analysis/YYYY-MM-DD_page_type/`
- Automatically update `index.html`
- Increment the report count

### Updating Content

1. Edit HTML files directly
2. Commit changes to `main` branch
3. Netlify auto-deploys on push

---

## Integration

### UX Maturity Analysis

This project integrates with the [UXMaturityAnalysis tool](https://github.com/matt99is/UXMaturityAnalysis) to automatically publish competitive analysis reports.

**Configuration:** The analysis tool is configured via `UXMaturityAnalysis/resources_integration_config.json` to output directly to this repository.

**Workflow:**
1. Run UX analysis from the UXMaturityAnalysis repo
2. Reports save to `Resources/ux-analysis/`
3. Index page automatically updated
4. Commit and deploy

---

## Local Development

### Viewing Locally

```bash
# Simple Python server
python3 -m http.server 8000

# Or use any static server
npx serve
```

Navigate to `http://localhost:8000`

### File Structure
- All HTML files are self-contained
- CSS is embedded in `<style>` tags
- No build process required
- Images referenced relatively

---

## Credits

**Author:** Matt Lelonek
**Contact:** [mattlelonek@gmail.com](mailto:mattlelonek@gmail.com)
**LinkedIn:** [linkedin.com/in/m-j-l](https://www.linkedin.com/in/m-j-l/)

**Built with:**
- Vanilla HTML/CSS
- Inter font family (Google Fonts)
- Claude Code for development assistance

---

## License

MIT License - Feel free to use this structure for your own portfolio.

---

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history and updates.
