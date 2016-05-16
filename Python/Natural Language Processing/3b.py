import nltk
from nltk.corpus import PlaintextCorpusReader
corpus_root = 'C:\MEGA\University of London\Year 3\CO3354 Introduction to natural language processing\Coursework 2\corpus'
books = PlaintextCorpusReader(corpus_root, '.*\.txt')

print "\nloading text ...\n"
chapter = books.sents('Decline ch1.txt')

grammar = "EM: {<EMP><NNP>+}" #"emperor" + One or more Proper Nouns
cp = nltk.RegexpParser(grammar)

emperors = []


def traverse(t):
    try:
        t.node
    except AttributeError:
        return
    else:
        if t.node == 'EM': 
            # print t
            emperors.append(t)
        else:
            for child in t:
                traverse(child)

default_tagger = nltk.data.load(nltk.tag._POS_TAGGER) #will assign default tags and find the proper nouns
model = {'emperor': 'EMP', 'Emperor': 'EMP'} # custom tag for the word 'emperor'
tagger = nltk.tag.UnigramTagger(model=model, backoff=default_tagger) #use custom tagger and fall back to default

print "\nprocessing text ...\n"
for i in range(len(chapter)):
    tagged = tagger.tag(chapter[i])
    traverse(cp.parse(tagged))

print "The named emperors in chapter 1 are:"
seen = [] #store the already printed trees and check for repetition
for i in range(len(emperors)):
    if emperors[i] not in seen:
        print emperors[i]
        seen.append(emperors[i])


#Second experiment - comparing to a list of roman emperors
#No context means no way to know if the names are actually refering to an emperor
emplist = ["Aemilianus","Antoninus","Augustus","Aurelian","Balbinus","Caracalla","Carinus","Carus","Claudius","Clodius","Commodus","Constantine","Constantius","Decius","Diadumenianus","Didius","Diocletian","Domitian","Elagabal","Florianus","Gaius","Caligula","Galba","Galerius","Gallienus","Geta","Gordian","Hadrian","Licinius","Lucius","Macrinus","Marcus","Maxentius","Maximian","Maximin","Maximinus","Nero","Nerva","Numerianus","Otho","Pertinax","Pescennius","Philip","Probus","Pupienus","Quintillus","Septimius","Severus","Tacitus","Tiberius","Titus","Trajan","Trebonianus","Valerian","Vespasian","Vitellius","Volusianus"]

names = 0
named = []

for s in range(len(chapter)):
    for w in range(len(chapter[s])):
        if chapter[s][w] in emplist:
            names += 1
            if chapter[s][w] not in named:
                named.append(chapter[s][w])
            # print chapter[s][w]

print "The name of a roman emperor appears {} times in chapter 1.".format(names)
print "{} unique emperor names appear in chapter 1 and are listed below".format(len(named))

for i in range(len(named)):
    print named[i]