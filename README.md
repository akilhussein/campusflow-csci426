# CampusFlow — CSCI426 Advanced Web Programming, Phase 1

CampusFlow is a responsive, **frontend-only React student portal** that combines course tracking, assignments, deadlines and grade analytics in one workspace. Built as an original academic prototype for Fall 2026–2027.

**Live production demo:** https://campusflow-csci426.vercel.app/

**Project report:** [docs/CampusFlow_Phase1_Report.pdf](docs/CampusFlow_Phase1_Report.pdf)

## Functional routes

| Route | Purpose |
| --- | --- |
| `/` | Dashboard: course count, upcoming deadlines, average grades and completed tasks |
| `/courses` | Search courses; create a new course |
| `/courses/:id` | Dynamic course details: update grade/progress, view related tasks |
| `/planner` | Create, prioritize, complete, filter and delete tasks |
| `/performance` | Grade breakdown and completion metrics |
| `/about` | About the solution and its features |
| `/contact` | Validated contact-form demonstration (no server submission) |

## Technology

React 19 · React Router 7 · Vite 6 · Lucide React icons · CSS3 · `localStorage` · Git · Vercel.

## Features

- Responsive layouts for desktop, tablet and mobile, with a collapsible mobile menu.
- Dark and light themes, saved in the browser.
- React state management with persistent courses and tasks in `localStorage`.
- Searchable courses, forms with validation, interactive grade and progress sliders.
- Planner with linked course, due date, priority, completion and deletion.
- Dynamic course pages and deep-link support on Vercel through `vercel.json`.

## Local setup

Requires Node.js 20.19+ or 22.12+ and npm.

```bash
npm install
npm run dev
```

Open the Vite URL (usually `http://localhost:5173`).

## Production build

```bash
npm run build
npm run preview
```

The Vercel production build for deployment `dpl_FcSpZr4fGFoRwVgJMjv85gKmaDye` succeeded on November 10, 2026 using `npm install` and `vite build`: 1,590 modules transformed; the deployed output was generated successfully.

## Version control & GitHub

This distribution contains a **real local `.git` history**, with distinct commits for the project skeleton, React screens and configuration. The production deployment was made from source files through Vercel's API; this does **not** automatically create or update a GitHub repository.

To publish to your own GitHub account, install [GitHub CLI](https://cli.github.com/), sign in and run the bundled script **inside the project folder**:

Windows PowerShell:

```powershell
./publish-to-github.ps1
```

macOS/Linux:

```bash
bash publish-to-github.sh
```

The script creates `12032486-sketch/campusflow-csci426` as a public repository (or pushes to it if it already exists and is accessible), preserving the commit history. Only run it in an account you control.

## Real production screenshots (November 10, 2026)

The screenshots below are genuine browser captures of the deployed CampusFlow app, taken in Chrome at desktop (1440 px) and mobile (390 px) viewport widths. They are served as static assets directly from the same Vercel production website. The project has a screenshot download helper (`download-screenshots.ps1` / `download-screenshots.sh`) which saves the corresponding image files under `docs/screenshots/` before GitHub publication.

**Desktop dashboard**  \n![Desktop dashboard](https://campusflow-csci426.vercel.app/screenshots/dashboard-desktop.jpg)

**Course management**  \n![Course management](https://campusflow-csci426.vercel.app/screenshots/courses-desktop.jpg)

**Study planner**  \n![Study planner](https://campusflow-csci426.vercel.app/screenshots/planner-desktop.jpg)

**Performance analytics**  \n![Performance analytics](https://campusflow-csci426.vercel.app/screenshots/performance-desktop.jpg)

**Mobile dashboard**  \n![Mobile dashboard](https://campusflow-csci426.vercel.app/screenshots/dashboard-mobile.jpg)

**Mobile navigation menu**  \n![Mobile navigation menu](https://campusflow-csci426.vercel.app/screenshots/mobile-menu.jpg)

These images were captured from the actual application, not fabricated mockups. To fetch image files locally, run the included screenshot download script or open the URLs above.

## Live browser quality assurance

**17 of 17 automated browser checks passed** against the live production site on November 10, 2026 using Google Chrome (headless). The checks covered home HTTP 200, page rendering, courses, creating a course, a dynamic course URL, progress slider, browser data persistence, planner task creation/completion/filtering, the performance and about pages, local contact-form confirmation, mobile navigation, and JavaScript console errors (zero).

- [Production QA results JSON](https://campusflow-csci426.vercel.app/qa-result.json)
- Local record: [`docs/browser-qa-results.json`](docs/browser-qa-results.json)
- Interactive browser checks passed, but this prototype is not a security-reviewed or backend-powered multi-user product.

## Suggested demo/acceptance checks

1. Open each navigation link and refresh a dynamic course URL.
2. Add a course; open its details; adjust grade/progress.
3. Add a task, choose its course, priority and due date.
4. Toggle completion, filter and delete tasks; refresh to confirm persistence.
5. Try the contact form with invalid/valid inputs.
6. Check responsiveness at 390px, 768px and 1440px, and toggle the theme.

## Project boundaries

CampusFlow stores information in each visitor's **own browser**. There are no accounts, server database, shared data or email transmission. Sample courses and scores are illustrative. Clearing browser storage deletes edits. This design intentionally satisfies the Phase 1 frontend requirement rather than pretending to offer production-grade multi-user security.

## Attribution

UI icons: [Lucide](https://lucide.dev/). Fonts: DM Sans and Outfit via Google Fonts. Other code and CSS were written for this project. Study, understand and demonstrate the implementation before presenting it.
