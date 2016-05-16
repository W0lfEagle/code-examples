import nltk
from nltk.corpus import brown

news_sents = brown.sents(categories="news")
patterns = [(r'.*ing$', 'VBG'), (r'.*ed$', 'VBD'), (r'.*es$', 'VBZ'), (r'.*ould$', 'MD'), (r'.*\'s$', 'NN$'), (r'.*s$', 'NNS'), (r'^-?[0-9]+(.[0-9]+)?$', 'CD'), (r'.*', 'NN')]
regexp_tagger = nltk.RegexpTagger(patterns)
news_tagged_sents = brown.tagged_sents(categories='news')
print "Without including closed caption words the score is:"
print regexp_tagger.evaluate(news_tagged_sents)

closed_patterns = [(r'\ba\b|\bA\b|\ban\b|\bAn\b|\bthe\b|\bThe\b', 'AT'), (r'.*ing$', 'VBG'), (r'.*ed$', 'VBD'), (r'.*es$', 'VBZ'), (r'.*ould$', 'MD'), (r'.*\'s$', 'NN$'), (r'.*s$', 'NNS'), (r'^-?[0-9]+(.[0-9]+)?$', 'CD'), (r'.*', 'NN')]
regexp_closed_tagger = nltk.RegexpTagger(closed_patterns)
print "Including the articles 'a','an' and 'the' the gives a score of:"
print regexp_closed_tagger.evaluate(news_tagged_sents)

closed_patterns = [(r'\bat\b|\bAt\b|\bby\b|\bBy\b|\bfor\b|\bFor\b|\bin\b|\bIn\b', 'IN'), (r'\ba\b|\bA\b|\ban\b|\bAn\b|\bthe\b|\bThe\b', 'AT'), (r'.*ing$', 'VBG'), (r'.*ed$', 'VBD'), (r'.*es$', 'VBZ'), (r'.*ould$', 'MD'), (r'.*\'s$', 'NN$'), (r'.*s$', 'NNS'), (r'^-?[0-9]+(.[0-9]+)?$', 'CD'), (r'.*', 'NN')]
regexp_closed_tagger = nltk.RegexpTagger(closed_patterns)
print "Including the prepositions 'at', 'by', 'for' and 'in' gives a score of:"
print regexp_closed_tagger.evaluate(news_tagged_sents)

closed_patterns = [(r'\band\b|\bAnd\b|\bbut\b|\bBut\b|\bor\b|\bOr\b', 'CC'), (r'\bat\b|\bAt\b|\bby\b|\bBy\b|\bfor\b|\bFor\b|\bin\b|\bIn\b', 'IN'), (r'\ba\b|\bA\b|\ban\b|\bAn\b|\bthe\b|\bThe\b', 'AT'), (r'.*ing$', 'VBG'), (r'.*ed$', 'VBD'), (r'.*es$', 'VBZ'), (r'.*ould$', 'MD'), (r'.*\'s$', 'NN$'), (r'.*s$', 'NNS'), (r'^-?[0-9]+(.[0-9]+)?$', 'CD'), (r'.*', 'NN')]
regexp_closed_tagger = nltk.RegexpTagger(closed_patterns)
print "Including the conjunctions 'and', 'but' and 'or' gives a score of:"
print regexp_closed_tagger.evaluate(news_tagged_sents)

closed_patterns = [(r'\bit\b|\bIt\b|\bhe\b|\bHe\b|\bshe\b|\bShe\b|\byou\b|\byou\b', 'PPS'), (r'\band\b|\bAnd\b|\bbut\b|\bBut\b|\bor\b|\bOr\b', 'CC'), (r'\bat\b|\bAt\b|\bby\b|\bBy\b|\bfor\b|\bFor\b|\bin\b|\bIn\b', 'IN'), (r'\ba\b|\bA\b|\ban\b|\bAn\b|\bthe\b|\bThe\b', 'AT'), (r'.*ing$', 'VBG'), (r'.*ed$', 'VBD'), (r'.*es$', 'VBZ'), (r'.*ould$', 'MD'), (r'.*\'s$', 'NN$'), (r'.*s$', 'NNS'), (r'^-?[0-9]+(.[0-9]+)?$', 'CD'), (r'.*', 'NN')]
regexp_closed_tagger = nltk.RegexpTagger(closed_patterns)
print "Including the pronouns 'it', 'he', 'she' and 'you' gives a score of:"
print regexp_closed_tagger.evaluate(news_tagged_sents)

