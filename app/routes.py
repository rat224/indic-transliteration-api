from flask import Blueprint, request, jsonify
from app.transliterator import get_transliteration

api = Blueprint('api', __name__)

@api.route('/transliterate', methods=['POST'])
def transliterate():
    data = request.get_json()
    text = data.get('text')
    lang_code = data.get('lang_code')

    if not text or not lang_code:
        return jsonify({"error": "Missing 'text' or 'lang_code'"}), 400

    result = get_transliteration(text, lang_code)
    return jsonify({"result": result})
