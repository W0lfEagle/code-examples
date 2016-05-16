import nltk
from nltk.corpus import names
import random
names = ([(name, 'male') for name in names.words('male.txt')] + [(name, 'female') for name in names.words('female.txt')])
random.shuffle(names)
def gender_features(word):
    return {'last_letter': word[-1]}
featuresets = [(gender_features(n), g) for (n,g) in names]
train_set, test_set = featuresets[500:], featuresets[:500]
classifier = nltk.NaiveBayesClassifier.train(train_set)
classifier.classify(gender_features('Wilf'))
print 'Accuracy = '
print nltk.classify.accuracy(classifier, test_set)
classifier.show_most_informative_features(5)

def more_gender_features(name):
    features = {}
    features["first_letter"] = name[0].lower()
    features["last_letter"] = name[-1].lower()
    features["last_two"] = name[-2:].lower()
    features["first_two"] = name[:2].lower()
    # The following features make little if any difference
    # for letter in 'abcdefghijklmnopqrstuvwxyz':
    #     features["count(%s)" % letter] = name.lower().count(letter)
    #     features["has(%s)" % letter] = (letter in name.lower())
    # features["length"] = len(name)
    return features

featuresets2 = [(more_gender_features(n), g) for (n,g) in names]
train_set2, test_set2 = featuresets2[500:], featuresets2[:500]
classifier2 = nltk.NaiveBayesClassifier.train(train_set2)
print 'Accuracy = '
print nltk.classify.accuracy(classifier2, test_set2)
classifier2.show_most_informative_features(20)
