# CampusFlow — Student Portal

A responsive, frontend-only student portal built for **CSCI426 Advanced Web Programming — Phase 1**.

## Features
- Dashboard with course and task metrics
- Searchable course directory and dynamic course details (`/courses/:id`)
- Add courses; adjust progress and grades
- Add, complete, filter, and delete study tasks
- Grade and task-completion analytics
- About and validated Contact demo pages
- Mobile-friendly navigation and light/dark theme
- LocalStorage persistence (no backend required)

## Tech stack
React 19, React Router 7, Vite 6, Lucide React, CSS3, browser LocalStorage.

## Setup
Requires Node.js 20.19+ or 22.12+.

```bash
npm install
npm run dev
```

Open the local URL displayed by Vite (normally `http://localhost:5173`).

## Production build

```bash
npm run build
npm run preview
```

## Deployment
Import this repository into Vercel, choose **Vite** framework, build command `npm run build`, output directory `dist`. Add a rewrite to `index.html` for React Router refresh support (provided in `vercel.json`). Netlify configuration is also included.

## Pages
1. `/` — Home dashboard
2. `/courses` — Course catalog
3. `/courses/:id` — Dynamic course details
4. `/planner` — Study planner
5. `/performance` — Performance
6. `/about` — About
7. `/contact` — Contact

## Screenshots
Add actual screenshots from your running deployment to `docs/screenshots/` before final submission. Suggested: dashboard desktop, course details, planner, mobile navigation.

## Data note
All edits are stored only in the current browser's LocalStorage. This is an intentional Phase 1 frontend demo, not a production multi-user system. The contact form does not transmit messages. Seeded course names, grades, and instructors are illustrative demo data.

## Version control
Use Git and create meaningful commits as you develop. Do not fabricate commit history. Example:

```bash
git init
git add .
git commit -m "Initialize CampusFlow React frontend"
```

## Academic integrity
Original project implementation. Icons by Lucide; fonts by Google Fonts. Customize and understand the code before presenting it.
