# OfficeAlly Bulk (Android)

Android app (Kotlin, WebView) that reads eligibility transaction pages from your own logged-in Office Ally account and exports them to CSV.

## Features
- In-app login (shared WebView session)
- Parallel hidden windows (1 to 8)
- Split CSV files (N rows per file) + auto-save
- Auto retry, duplicate skip, results survive app restart
- CSV saved to `Downloads/OfficeAlly/`

## Build the APK
**Option A: GitHub Actions (no Android Studio needed)**
1. Push this project to a GitHub repo (project files at the repo root).
2. Open the **Actions** tab, run **Build APK** (it also runs on every push).
3. Open the finished run and download the **OfficeAlly-Bulk-APK** artifact (zip containing `app-debug.apk`).
4. Copy the APK to the phone, allow "install unknown apps", install.

**Option B: Android Studio**
Open this folder, wait for Gradle sync, press Run. Requires Android 10+ (minSdk 29).

## Notes
- Keep the app open and screen on while scraping (the app keeps the screen awake during a run).
- Start with 3 windows; more windows use more RAM and may make the site slow or block you.
- **Privacy:** exports contain patient information. Keep files local, never commit them, follow your HIPAA/organization policies, and use only accounts you are authorized to access.
