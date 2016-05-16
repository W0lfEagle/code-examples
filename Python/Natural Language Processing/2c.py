from bs4 import BeautifulSoup
import urllib
import re
import nltk
import time
from nltk.corpus import names
import random
nltkNames = ([(name, 'male') for name in names.words('male.txt')] + [(name, 'female') for name in names.words('female.txt')])
random.shuffle(nltkNames)

pageFile = urllib.urlopen("http://www.independent.co.uk/news/uk/home-news/baby-names-top-100-most-popular-boys-and-girls-names-10459074.html")
pageHtml = pageFile.read()
pageFile.close()

soup = BeautifulSoup(pageHtml)

articleBody = soup.find("div", {"itemprop":"articleBody"}) # get the div containing the name lists

nameList = articleBody.find_all("p")

girlList = []
boyList = []

for i in range(2, 102): # skip first 2 'p' elements and set girl list to next 100
    girlList.append(nameList[i])

for i in range(104, 204):
    boyList.append(nameList[i])

for i in range(0, len(girlList)):
    words = re.sub("[^\w]", " ", str(girlList[i])).split() # use regular expression to split the tag into words
    girlList[i] = words[2] # words[0] = p tag, words[1] = rank number, words[2] = name

for i in range(0, len(boyList)):
    words = re.sub("[^\w]", " ", str(boyList[i])).split()
    boyList[i] = words[2]

top100Names = ([(name, 'male') for name in boyList] + [(name, 'female') for name in girlList])
random.shuffle(top100Names) 

def more_gender_features(name):
    features = {}
    features["first_letter"] = name[0].lower()
    features["last_letter"] = name[-1].lower()
    features["last_two"] = name[-2:].lower()
    features["first_two"] = name[:2].lower()
    # for letter in 'abcdefghijklmnopqrstuvwxyz':
    #     features["count(%s)" % letter] = name.lower().count(letter)
    #     features["has(%s)" % letter] = (letter in name.lower())
    # features["length"] = len(name)
    return features

featuresets = [(more_gender_features(n), g) for (n,g) in nltkNames]
featuresetsTest = [(more_gender_features(n), g) for (n,g) in top100Names]
train_set, test_set = featuresets[500:], featuresetsTest # train classifier on the nltk name list and test with top 100 name list

start_time = time.time()
classifier = nltk.NaiveBayesClassifier.train(train_set)
print 'Naive Bayes Accuracy = '
print nltk.classify.accuracy(classifier, test_set)
print "%s seconds" % (time.time() - start_time)

count = 0
nltkNamesOnly = []
unmatchedNames = []

for (n,g) in nltkNames:
    nltkNamesOnly.append(n)

for (n,g) in top100Names:
    if n in nltkNamesOnly:
        count += 1
        # print "found " + n
    else:
        # print "didn't find " + n
        unmatchedNames.append(n)
print str(count) + " names out of the top 100 girl and boy names are also in the NLTK names corpus"
print "The " + str(len(unmatchedNames)) + " names that were not found are as follows "
for name in unmatchedNames:
    print name