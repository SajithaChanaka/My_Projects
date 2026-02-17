# React Demo App

Small React application built with Vite. The app demonstrates a simple login flow, list page with search, and a detail page backed by a public REST API.

## Features

- Login page with phone number validation that accepts the demo number +254712345678
- Main page showing a searchable list of posts loaded from JSONPlaceholder
- Detail page displaying full information for a selected post
- Login state persisted in localStorage
- Basic loading and error handling for API requests

## Tech Stack

- React with functional components and Hooks
- React Router for client-side routing
- Context API for authentication state management
- Vite for bundling and dev server
- Jest-style unit tests using Vitest and React Testing Library

## Getting Started

Install dependencies:

```bash
npm install
```

Run the development server:

```bash
npm run dev
```

Run the linter:

```bash
npm run lint
```

Run the tests:

```bash
npm test
```

## Usage

1. Open the app in the browser (default http://localhost:5173).
2. On the login page, enter the phone number `+254712345678`.
3. After a successful login you will be redirected to the main posts page.
4. Use the search field to filter posts by title.
5. Click a post to see its detail view, then use the back button to return to the list.
