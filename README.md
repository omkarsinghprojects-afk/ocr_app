# OCR Form Scanner — Cloud Edition

Scan application forms from any phone or browser.  
Upload PDF, PNG, JPG → extracts all fields → saves to SQLite → download as Excel.

Powered by **Claude AI (Anthropic)** — no local GPU needed, deploy anywhere for free.

---

## Deploy on Render (free tier, ~5 min)

### Step 1 — Push to GitHub
1. Create a new repo on github.com (e.g. `ocr-form-scanner`)
2. Upload all these files into it:
   - `app.py`
   - `requirements.txt`
   - `render.yaml`
   - `build.sh`
   - `templates/index.html`

### Step 2 — Connect to Render
1. Go to [render.com](https://render.com) and sign up (free)
2. Click **New → Web Service**
3. Connect your GitHub repo
4. Render auto-detects `render.yaml` — click **Apply**

### Step 3 — Set environment variables
In the Render dashboard under **Environment**:

| Key | Value |
|-----|-------|
| `ANTHROPIC_API_KEY` | Your key from [console.anthropic.com](https://console.anthropic.com) |
| `APP_PASSWORD` | Any password you want (e.g. `mysecret123`) |

### Step 4 — Deploy
Click **Deploy**. In ~3 minutes your app is live at:
```
https://ocr-form-scanner.onrender.com
```
Share this URL with anyone — works on any phone, any browser.

---

## Get your Anthropic API key
1. Go to [console.anthropic.com](https://console.anthropic.com)
2. Sign up / log in
3. Go to **API Keys** → **Create Key**
4. Copy and paste it into Render's environment variables

**Cost:** Claude charges per image processed (~$0.002–0.005 per form page).  
For low-volume use (100s of forms/month), cost is negligible.

---

## Run locally (optional)

```bash
pip install -r requirements.txt
export ANTHROPIC_API_KEY=your_key_here
export APP_PASSWORD=ocr1234
python app.py
```
Open http://localhost:8000

---

## Supported formats

PDF, PNG, JPG, JPEG, TIFF, TIF, BMP, WEBP

---

## Files

| File | Purpose |
|------|---------|
| `app.py` | FastAPI backend — OCR via Claude API |
| `templates/index.html` | Mobile web frontend |
| `requirements.txt` | Python dependencies |
| `render.yaml` | Render deployment config |
| `build.sh` | Build script (installs poppler for PDF support) |
| `ocr_results.db` | SQLite database (auto-created on first run) |
| `uploads/` | Temp folder for processing (auto-cleaned) |

> **Note:** On Render's free tier the SQLite database resets when the service restarts.
> For permanent storage, upgrade to Render's paid tier with a persistent disk,
> or swap SQLite for a free PostgreSQL database (Render offers one free per account).
