# Indic Transliteration API

A simple Flask-based REST API to transliterate Roman script into native Indian scripts using the AI4Bharat Transliteration model.

---

## 🚀 API Endpoint

### POST /transliterate
**Request:**
```json
{
  "text": "mera bharat",
  "lang_code": "hi"
}
