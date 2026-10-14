# QISNet 2027 — Workshop Website

Homepage of the **1st International Workshop on Quantum Intelligence, Security, and Networking (QISNet 2027)**,
held in conjunction with the 36th International Conference on Computer Communications and Networks (ICCCN 2027), Rome, Italy.

The site is a static, single-page site (Bootstrap 5 "TheEvent" theme, adapted from the RelSciFM @ KDD 2026 layout).
No build step is required. 

## Deploy on GitHub Pages

1. Copy **everything in this folder** into the root of your `<user>.github.io/<repo>` repository (or the `docs/` folder, if you prefer that Pages source).
2. Commit and push. In the repository settings, enable **Pages → Deploy from a branch** (branch `main`, folder `/` or `/docs`).
3. The site is served from `index.html`; all assets are referenced with relative paths, so it works at any sub-path.

## Headshots

`assets/img/people/` contains a square, face-centered headshot for every chair and TPC member (the cards render them as
140 px circles). To replace one, drop a new image over the same filename (see `PHOTOS.md` for the slug ↔ person list).
`download_photos.ps1` / `download_photos.sh` re-fetch the official headshots from the sources listed in `PHOTOS.md` if you
ever want to refresh them.

## Things to update as the workshop firms up

| What | Where |
|---|---|
| Important dates (currently TBA) | `index.html` → `#cfp` section, and `tools/cfp-source.html` (then regenerate the PDF) |
| Workshop date / venue | `index.html` → hero "Where" / "When" blocks and `#schedule` |
| Submission link | `index.html` → `#cfp` section: replace the disabled "Submission Site — Opening Soon" span with an `<a>` button |
| ICCCN 2027 link | Header button (`https://icccn.org/icccn27/`) — verify once the official ICCCN 2027 site is live |
| Sponsors, awards, keynotes, program | The placeholder cards in `#sponsors`, `#awards`, `#speakers`, `#schedule` — the original RelSciFM markup for sponsor logos, award cards, speaker cards and schedule rows is fully supported by `assets/css/main.css` |
| TPC list | `#organizers` section (cards) and `tools/cfp-source.html` |

## Regenerating the Call for Papers PDF

`QISNet2027_Call_for_Papers.pdf` is rendered from `tools/cfp-source.html`. After editing that file, print it to PDF from a browser
(Letter size, background graphics on), or with headless Chromium:

```
chromium --headless --print-to-pdf=QISNet2027_Call_for_Papers.pdf tools/cfp-source.html
```

## Layout

```
index.html                       main page
QISNet2027_Call_for_Papers.pdf   CFP (linked from the hero and the Call for Papers section)
favicon.png, apple-touch-icon.png
assets/css/main.css              theme (from the template)
assets/css/brand.css             QISNet brand layer (fonts, hero, placeholder cards, organizer tweaks)
assets/img/brand/                QISNet logos (horizontal, vertical, icon) — monochrome SVG
assets/img/hero-rome.jpg         hero background
assets/img/people/               organizer / TPC headshots (square, face-centered)
assets/vendor/                   Bootstrap 5, Bootstrap Icons, AOS, GLightbox, Swiper
assets/fonts/                    Google Sans (OFL)
tools/cfp-source.html            source of the CFP PDF
download_photos.ps1 / .sh        optional: re-fetch headshots from their official sources
PHOTOS.md                        headshot & homepage list
```

Theme credit: [TheEvent](https://bootstrapmade.com/theevent-conference-event-bootstrap-template/) by BootstrapMade (free license requires keeping the footer credit).
