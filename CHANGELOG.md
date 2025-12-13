# Changelog

All notable changes to the Resources project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [1.1.0] - 2025-12-12

### Added
- **UX Analysis Reports Section**
  - New purple-themed "Analysis" content type
  - Integrated 2 existing analysis reports (Basket Pages, Product Pages)
  - Auto-updating from UXMaturityAnalysis tool
  - Interactive reports with charts, filters, and screenshots
  - `/ux-analysis/` folder structure for organized storage

- **Visual Enhancements**
  - Purple tag styling for analysis reports (#f3e8ff bg, #7c3aed text)
  - Section counts for all document types
  - Improved card layout consistency

- **New Images**
  - Replaced all case study images with higher quality versions
  - ACE Device: 4 new screenshots (Hero, Onboarding, Features, PinHome)
  - Minibasket: 2 updated images (Hero, Annotated Features)

- **Interactive Prototype Link**
  - Added Figma prototype link to Minibasket case study
  - Direct access to Variant C interaction pattern

- **Favicon**
  - Added llama SVG favicon across all pages
  - Proper icon display in browser tabs

### Changed
- **Index Page Redesign**
  - Transformed from personal portfolio to document directory
  - Removed personal branding (name/role)
  - New "Resources" title with descriptive subtitle
  - 2-column grid layout on desktop
  - Added document metadata (dates, reading times, counts)
  - Simplified footer with centered contact links

- **Responsive Improvements**
  - Mobile-first responsive design throughout
  - Consistent breakpoints (768px) across all pages
  - Optimized padding and spacing for mobile
  - Images scale properly on all screen sizes

- **Layout Fixes**
  - ACE Device: Fixed image sizing and alignment issues
  - Minibasket: Standardized image containers
  - Both case studies: Consistent hero image structure
  - Removed inline styles for cleaner CSS

### Fixed
- Publication dates corrected from 2024 to 2025
- Navigation links between case studies properly connected
- Blockquote max-width constraints for proper centering
- Image filename consistency (underscores vs spaces)
- 404 page redirect path

---

## [1.0.0] - 2025-12-12

### Added
- **Initial Release**
  - Index page with directory structure
  - 2 Case Studies:
    - ACE Device (Enterprise design)
    - Minibasket Redesign (E-commerce optimization)
  - 1 Guide:
    - Figma Make Workflow (AI-assisted prototyping)

- **Core Features**
  - Netlify deployment configuration
  - Custom 404 error page
  - Security headers
  - SEO meta tags
  - Responsive design

- **Visual Design**
  - Clean, minimal interface
  - Inter font family
  - Color-coded content types
  - Consistent spacing and typography

- **Content Structure**
  - Case study template with hero sections
  - Section-based layout
  - Image galleries
  - Navigation between documents

### Technical
- Static HTML/CSS (no dependencies)
- Optimized for Netlify
- Mobile-responsive
- Fast loading times

---

## Future Roadmap

### Planned
- [ ] Add more case studies
- [ ] Create guides section with multiple documents
- [ ] Implement search functionality
- [ ] Add filtering by tags/categories
- [ ] RSS feed for updates
- [ ] Dark mode support

### Under Consideration
- [ ] Blog section for shorter posts
- [ ] Interactive demos/prototypes
- [ ] Video walkthroughs
- [ ] Downloadable resources (PDFs, templates)
- [ ] Comments or feedback system

---

## Integration Notes

### UXMaturityAnalysis
The project integrates with the [UXMaturityAnalysis tool](https://github.com/matt99is/UXMaturityAnalysis):
- Reports automatically save to `/ux-analysis/`
- Index page auto-updates with new reports
- Purple theme maintains visual consistency
- No manual index editing required

### Adding Content
When adding new content manually:
1. Create HTML file following template structure
2. Add to `/images/` folder if needed
3. Update index.html with new card
4. Increment section count
5. Commit and push (Netlify auto-deploys)

---

## Credits

Built with assistance from Claude Code and Claude Sonnet 4.5.
