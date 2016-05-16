import nltk
from nltk.corpus import treebank

grammar = "NP: {<DT>?<PP\$>?<POS>?<VBG|VBN>?<JJ.*>*<NN.*>+}"
cp = nltk.RegexpParser(grammar)

wsj = treebank.tagged_sents()

npChunkList = []

def traverse(t):
    try:
        t.node
    except AttributeError:
        return
    else:
        if t.node == 'NP': 
            npChunkList.append(t)
        else:
            for child in t:
                traverse(child)

def traverseOne(t):
    try:
        t.node
    except AttributeError:
        return
    else:
        if t.node == 'NP': 
            print t
        else:
            for child in t:
                traverseOne(child)

print "\nThe noun phrase chunks from the first sentence are:"
traverseOne(cp.parse(wsj[0]))

for i in range(0, len(wsj)):
    result = cp.parse(wsj[i])
    traverse(result)

#Sort the list of noun phrase chunks by length
npChunkList.sort(lambda x,y: cmp(len(y), len(x)))

print "\nThe 10 longest chunks from the Wall Street Journal Corpus are:"
#print the 10 longest
for i in range(10):
    print i+1
    print npChunkList[i]
    print ""




# traverse(result)
# result.draw()
# nltk.app.chunkparser()
