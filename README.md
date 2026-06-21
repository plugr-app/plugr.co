# plugr.co — marketing website

Static HTML/CSS site for [plugr.co](https://plugr.co). Hosting-agnostic — works on Netlify, Cloudflare Pages, Vercel, GitHub Pages, or any static host.

## Status — all pages built

| Page | Path | Purpose |
|------|------|---------|
| Home | `/` (`index.html`) | Hero, value props, feature deep-dives, pricing teaser, FAQ teaser |
| Features | `/features.html` | Long-form feature deep-dive across all six major areas + secondary grid |
| Pricing | `/pricing.html` | 4-tier cards, full compare matrix, pricing FAQ |
| Download | `/download.html` | Download CTA, what-happens-next, system requirements, install FAQ |
| About | `/about.html` | Josh's story + the philosophy behind Plugr |
| Changelog | `/changelog.html` | Release notes template (1.0.0 placeholder) |
| 404 | `/404.html` | Custom not-found page |
| Help center | `/support/` | Quick-link grid to support sections |
| Getting started | `/support/getting-started.html` | 7-step onboarding walkthrough |
| FAQ | `/support/faq.html` | 18 questions across 5 categories + FAQPage schema |
| Troubleshooting | `/support/troubleshooting.html` | Solutions to common issues |
| Contact | `/support/contact.html` | Four contact email cards + bug report tips |
| Terms of Service | `/legal/terms.html` | 10-section ToS |
| Privacy Policy | `/legal/privacy.html` | What data Plugr collects, what it doesn't |
| Refund Policy | `/legal/refund.html` | 14-day no-questions-asked refund |
| EULA | `/legal/eula.html` | Software license agreement |
| Sitemap | `/sitemap.xml` | All 15 pages for search engines |
| Robots | `/robots.txt` | Permissive — index everything |

Shared:
- `/styles/main.css` — full design system in one stylesheet
- `/assets/logos/` — brand mark in three variants (default colored, white-wordmark for dark themes, icon-only)
- `/assets/icons/` — DAW logos (Ableton, Logic Pro, FL Studio)
- `/assets/screenshots/` — placeholder boxes; drop in real screenshots later

## TODO before going live

You'll need to do these before the site is fully production-ready:

1. **Real screenshots.** Every `<img src="/assets/screenshots/...">` is a placeholder with a graceful fallback box. Take real screenshots of Plugr at 2× resolution (~2160×1400 PNG) and drop them in `assets/screenshots/`:
   - `library-hero.png` — homepage hero
   - `updates.png`, `projects.png`, `deals.png` — homepage deep-dive sections
   - `library-grid.png`, `tags.png`, `updates-detail.png`, `projects-detail.png`, `deals-detail.png`, `tools.png` — features page

2. **Contact emails.** The site uses `hello@plugr.co`, `support@plugr.co`, `billing@plugr.co`, and `press@plugr.co`. Set those up at your domain registrar's email forwarding, or create real mailboxes if you prefer. All four can forward to the same inbox.

3. **Download URL.** The `Download Plugr` button on `download.html` currently alerts the user that a download URL needs to be configured. Replace the `#download` href + JS handler with a real DMG link (GitHub Releases, your own server, etc.).

4. **Buy URLs.** The pricing-page Buy buttons currently `alert()` with a placeholder. When you set up LemonSqueezy or Paddle, replace each `data-buy="X"` button's behavior with a real checkout URL (or use their JS overlay checkout).

5. **Favicon set.** `/assets/logos/plugr-icon.png` is the favicon source. You'll want to generate the full favicon set (16×16, 32×32, 180×180 apple-touch, etc.) from it. Tools like [realfavicongenerator.net](https://realfavicongenerator.net) automate this; drop the resulting files in `/assets/` and add the corresponding `<link rel>` tags to every page's `<head>`.

7. **Analytics (optional).** No analytics installed. If you want traffic data, add Plausible / Fathom / Umami (privacy-respecting, no cookie banner needed) or GA4. The privacy policy already mentions Plausible/Fathom by name — change it if you go with something else.

8. **Lawyer review.** The legal pages (Terms, Privacy, Refund, EULA) are a solid starting point but **should be reviewed by a lawyer before public launch**. They're written conservatively and reflect typical SaaS practices, but every business is different. Particular things to double-check:
   - Your legal name / entity (currently shows as "Josh Isaacs" — fine for sole proprietor, but update if you incorporate)
   - State / jurisdiction (currently Colorado — adjust if relevant)
   - The specific merchant of record (currently "LemonSqueezy or Paddle" — pick one and update)
   - Any local consumer protection requirements that apply where most of your customers live

9. **Domain DNS.** Point `plugr.co` at your chosen host. Cloudflare Pages or Netlify give you SSL automatically.

## Local preview

```bash
cd website
python3 -m http.server 8000
```

Then open <http://localhost:8000> in your browser.

Or, if you have Node installed: `npx serve .`

## Deployment

### Cloudflare Pages (recommended — free, fast, great DX)

1. Create a Cloudflare account.
2. Pages → Create project → Direct upload.
3. Drag the `website/` folder in.
4. Add `plugr.co` as a custom domain.
5. Done. Every future update is a re-upload, or wire it to a Git repo for auto-deploy on push.

### Netlify (also free, drag-and-drop)

1. netlify.com → drag `website/` folder onto the dashboard.
2. Settings → Domain management → Add custom domain → `plugr.co`.
3. Follow their DNS instructions.

### GitHub Pages

1. Push `website/` contents to a repo's root or to a `docs/` folder.
2. Settings → Pages → enable from main branch.
3. Add a `CNAME` file containing `plugr.co`.
4. Configure DNS at your registrar.

## Design system reference

Everything reuses tokens from `styles/main.css`:

- **Brand gradient:** purple `#a85cff` → indigo `#6a6aff` → blue `#3aa6ff` (`var(--brand-gradient)`)
- **Surfaces:** `--bg-0` deepest, `--bg-1` cards, `--bg-2` hover, `--bg-3` pressed
- **Text:** `--text` primary, `--text-2` body, `--muted` secondary, `--muted-2` tertiary
- **Accents:** `--accent-strong` (links + CTAs), `--good`, `--warn`, `--bad`
- **Layout:** `--maxw-narrow` 720px, `--maxw` 1080px, `--maxw-wide` 1280px
- **Radius:** `--radius` 10px, `--radius-lg` 16px, `--radius-xl` 24px

Light theme tokens are defined too, but currently only kick in if you add `class="respect-os"` to the `<html>` element. Default is dark to match the app's brand.

## SEO

Every page has:
- Unique `<title>` and `<meta name="description">`
- `<link rel="canonical">` to the absolute URL
- Open Graph + Twitter Card tags
- JSON-LD structured data where applicable (homepage has SoftwareApplication; FAQ page has FAQPage)

Once everything's wired up, submit `https://plugr.co/sitemap.xml` to [Google Search Console](https://search.google.com/search-console) and [Bing Webmaster Tools](https://www.bing.com/webmasters).

## Editing copy later

The site is plain HTML — open any `.html` file in a text editor, find the text you want to change, save. No build step. If you want a friendlier editor:

- **Decap CMS** (formerly Netlify CMS, free, git-backed) gives you an admin UI at `/admin/` for editing content. ~30 min to set up — happy to wire it in when you're ready.
- **VS Code** with a Live Preview extension lets you see your changes instantly as you type.

## File map

```
website/
├── index.html
├── features.html
├── pricing.html
├── download.html
├── about.html
├── changelog.html
├── 404.html
├── robots.txt
├── sitemap.xml
├── README.md
├── styles/
│   └── main.css
├── support/
│   ├── index.html
│   ├── getting-started.html
│   ├── faq.html
│   ├── troubleshooting.html
│   └── contact.html
├── legal/
│   ├── terms.html
│   ├── privacy.html
│   ├── refund.html
│   └── eula.html
└── assets/
    ├── logos/
    │   ├── plugr-logo.png
    │   ├── plugr-logo-dark.png
    │   └── plugr-icon.png
    ├── icons/
    │   ├── daw-ableton.png
    │   ├── daw-logic.png
    │   └── daw-flstudio.png
    └── screenshots/    (you add these)
```
