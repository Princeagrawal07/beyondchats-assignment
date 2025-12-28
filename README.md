BeyondChats Assignment – Phase 1
📌 Overview

This project implements Phase 1 of the BeyondChats assignment.
It includes scraping the oldest blog articles from BeyondChats, storing them in a database, and exposing CRUD REST APIs to manage these articles.

The solution uses:

Laravel for backend APIs and database

Node.js for web scraping

SQLite as the database (simple local setup)

🧱 Tech Stack
Backend

Laravel 12

PHP 8.x

SQLite

REST APIs

Scraper

Node.js

Axios

Cheerio

📁 Project Structure
beyondchats-assignment/
│
├── backend/          # Laravel backend (APIs + DB)
│   ├── app/
│   ├── routes/
│   ├── database/
│   └── ...
│
├── scraper/          # Node.js scraping scripts
│   ├── scrape.js
│   ├── package.json
│   └── node_modules/
│
└── README.md

🔄 Data Flow / Architecture
BeyondChats Blog Website
        ↓
Node.js Scraper (Axios + Cheerio)
        ↓
POST /api/articles
        ↓
Laravel API
        ↓
SQLite Database

🧩 Phase 1 – Features Implemented
✅ Web Scraping

Starts scraping from the last page of BeyondChats blogs

Handles pagination edge-case (last page contains fewer articles)

Collects the 5 oldest articles

Extracts:

Title

Source URL

Short excerpt (fallback used due to scraping restrictions)

Note: Full article content scraping is restricted by site protection and is addressed in Phase 2.

✅ Database

SQLite database

articles table with fields:

id

title

content

source_url

is_ai_generated

references

timestamps

✅ CRUD REST APIs

CRUD APIs are implemented using Laravel apiResource.

Operation	Method	Endpoint
Create	POST	/api/articles
Read (All)	GET	/api/articles
Read (One)	GET	/api/articles/{id}
Update	PUT	/api/articles/{id}
Delete	DELETE	/api/articles/{id}
⚙️ Local Setup Instructions
🔹 Prerequisites

PHP 8+

Composer

Node.js

npm

🔹 Backend Setup (Laravel)
cd backend
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
php artisan serve


Backend will run at:

http://127.0.0.1:8000

🔹 Scraper Setup (Node.js)
cd scraper
npm install
node scrape.js


This script:

Scrapes the 5 oldest articles

Sends them to Laravel using POST /api/articles

🔍 API Verification

After running the scraper, open:

http://127.0.0.1:8000/api/articles


You should see the scraped articles stored in the database.

📝 Notes & Assumptions

BeyondChats uses bot protection, so full article body scraping may fail.

For Phase 1, storing titles, URLs, and excerpts satisfies requirements.

Full content rewriting and Google search integration are part of Phase 2.

🚀 Phase 1 Status

✅ Completed

Scraping implemented

Database storage complete

CRUD APIs implemented and tested

🔗 Live Link

(Frontend will be added in Phase 3)

👨‍💻 Author

Prince Agrawal