from ai4bharat.transliteration import XlitEngine

# Cache models per language
engine_cache = {}

def get_transliteration(text, lang_code):
    if lang_code not in engine_cache:
        engine_cache[lang_code] = XlitEngine(lang_code=lang_code, beam_width=10)
    
    engine = engine_cache[lang_code]
    words = engine.translit_sentence(text)
    return ' '.join(words)
