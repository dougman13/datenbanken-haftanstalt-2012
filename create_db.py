import random
import string
from datetime import date
from calendar import monthrange


firstnames = list()
lastnames = list()

def import_names():
    f = open('./names.txt')
    for line in f:
        firstname, lastname = line.strip().split(' ')
        firstnames.append(firstname)
        lastnames.append(lastname)

def random_firstname():
    return random.choice(firstnames)

def random_lastname():
    return random.choice(lastnames)

def random_name():
    return random_firstname() + ' ' + random_lastname()

def random_date():
    year = random.randint(1900, 2011)
    month = random.randint(1, 12)
    return date(year, month, random.randint(*monthrange(year, month)))

def random_upperchar():
    return random.choice(string.ascii_uppercase)

def random_zellentyp():
    return random.choice(('Einzelzelle', 'Gruppenzelle'))

def random_id():
    return random.randint(1, 1000)


import_names()

class SQL(object):
    @classmethod
    def none2null(self, value):
        if value is None:
            return u"NULL"
        return '"'+value+'"'

    @classmethod
    def insert_person(self, firstname, lastname, birthday, traktid, zellenid, sozialmassnahme, fortbildungsmassnahme, taetigkeit):
        return u"INSERT INTO person VALUES ('%s', '%s', to_date('%s', 'yyyy-mm-dd'), %s, %s, %s, %s, %s);" % \
            (firstname, lastname, birthday, self.none2null(traktid), self.none2null(zellenid), self.none2null(sozialmassnahme), self.none2null(fortbildungsmassnahme), self.none2null(taetigkeit))

    @classmethod
    def insert_trakt(self, traktid):
        return u"INSERT INTO trakt (T_ID) VALUES ('%s');" % (traktid)

    @classmethod
    def insert_zelle(self, trakt, zellenid, typ):
        return u"INSERT INTO zelle (Z_Nr, T_ID, Typ) VALUES (%s, '%s', '%s');" % (zellenid, trakt, typ)

    @classmethod
    def insert_behandlung(self, medikation, krankheit, arztvn, arztnn, arztgb, haeftlingvn, haeftlingnn, haeftlinggb):
        return u"INSERT INTO behandlung VALUES ('%s', '%s', '%s', '%s', to_date('%s', 'yyyy-mm-dd'), '%s', '%s', to_date('%s', 'yyyy-mm-ss'));" % (medikation, krankheit, arztvn, arztnn, arztgb, haeftlingvn, haeftlingnn, haeftlinggb)

    @classmethod
    def insert_urteil(self, urteilsdatum, delikt, jahre, haeftlingvn, haeftlingnn, haeftlinggb):
        return u"INSERT INTO urteil VALUES (to_date('%s', 'yyyy-mm-dd'), '%s', %s, '%s', '%s', to_date('%s', 'yyyy-mm-ss'));" % (urteilsdatum, delikt, jahre, haeftlingvn, haeftlingnn, haeftlinggb)

print SQL.insert_person(random_firstname(), random_lastname(), random_date(), None, None, None, None, None)
print SQL.insert_trakt(random_upperchar())
print SQL.insert_zelle(random_upperchar(), random_id(), random_zellentyp())
