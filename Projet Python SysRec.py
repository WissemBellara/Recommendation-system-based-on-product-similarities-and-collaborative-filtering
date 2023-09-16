""" Ce Travail est realisé par : 
            Wissem Bellara 2LNBI 2
            Adem Neji 2LNBI 2 """

                        #Importation
import nltk
import math
from nltk.corpus import stopwords ; 
import mysql.connector
from nltk.stem.snowball import FrenchStemmer
import numpy as np 
from scipy import spatial
#==========================================SYS REC BASEE SUR LE CONTENU =========================================================================
                    #Connexion A La Base 
connexion=mysql.connector.connect(host="localhost", user="root", password="" , database="sysrec1")
curseur=connexion.cursor()
                    #Similarité
def SimilariteCosinus(id_prod1,id_prod2):
    return(1-spatial.distance.cosine(MatBin[id_prod1],MatBin[id_prod2]))

    
def OccurenceStem (m,dic):
    nbocc=0
    for j in range(len(dic)):
        for i in dic[j+1] :
            if i==m:
                nbocc+=1
                break
    return (nbocc)   
def fqc (m,arr):
    nbocc=0
    for i in arr :
        if i==m:
            nbocc+=1
    return (nbocc/len(arr))
def MatFreq (diction):
   MatFQC=np.zeros((len(diction),len(ListeTotalMots)))
   for i in range(len(diction)):
      j=0
      for m in ListeTotalMots:

          MatFQC[i][j]=fqc(m,diction[i+1])* math.log(len(diction)/OccurenceStem(m,diction))
          j+=1    
   return MatFQC




                    #Extraction Des Produits

curseur.execute('select * from produit')
produits=curseur.fetchall()
ListeTotalMots=set()

                    #Configuration de la dictionnaire francais
StopList=list(stopwords.words('french'))
StopList.extend([".",",","'",":","!","/"])

                    #Extraction des descriptions des produits
dictProduits={}

for p in produits:
        id_pd=p[0]
        Desc=p[3]
        Mots=nltk.word_tokenize(Desc)
        #print("Les Mots Tokenizé pour le produit ", id_pd, "sont : " , Mots)
                    #Avoir Les Racines des Mots
        stem=FrenchStemmer()
        MotsStems=[]
        for m in Mots:
            MotsStems.append(stem.stem(m))
        #print("Les Stems Sont : " , MotsStems)
                    #Nettoyage
        ListFinalMots=[]
        for m in MotsStems:
            if m not in StopList:
                ListFinalMots.append(m)
        ListUniqueMots=set(ListFinalMots)
        for m in ListUniqueMots:
            ListeTotalMots.add(m)
        dictProduits[id_pd]=ListFinalMots
    
                    #Remplir Matrice Binaire
#print("Le Dictionnaire des Produits : " , dictProduits) 
MatBin=np.zeros((len(dictProduits),len(ListeTotalMots)))     
ListeTotalMots=list(ListeTotalMots)
curseur.close()
for i in range(len(dictProduits)):
      j=0
      for m in ListeTotalMots:
          if m in dictProduits[i+1]:
              MatBin[i][j]=1
          j+=1
#print("La Matrice Binaire : " ,MatBin.shape, MatBin)
#print ("La Matrice de Frequence : " , MatFreq(dictProduits))
                #Matrice Similarité
matriceSimilarite=np.zeros((len(dictProduits),len(dictProduits)))
for i in range (len(dictProduits)):
    for j in range (len (dictProduits)):
        matriceSimilarite[i][j]=SimilariteCosinus(i,j)
#print("Sim = \n" , matriceSimilarite)

                #Definition du produit qui ressemble le plus
def maxsim (diction):
    Arrpdt=[]
    for i in range(len(diction)):
        MaxSimilarite=[]
        maxNt=1
        for k in range(3):
            indice=0
            notemax=0
            for j in range(len(diction)):
                if (matriceSimilarite[i][j]<maxNt) and (matriceSimilarite[i][j]>notemax):
                    notemax=matriceSimilarite[i][j]
                    indice=j
            maxNt=notemax
            if (indice==0):
                MaxSimilarite.insert(k,(-1))
            else:
                MaxSimilarite.insert(k,(indice+1))
        Arrpdt.append(MaxSimilarite)
    return Arrpdt
print("Les Produits qui se ressemblent le plus sont : (-1 signifie pas de similarité) : \n",maxsim(dictProduits))
#======================================SYS REC : FILTRAGE COLLABORATIF=====================================================================
                
connexionFC=mysql.connector.connect(host="localhost", user="root", password="" , database="sysrec1")
curseurFC=connexionFC.cursor()
curseurFC.execute('select * from notes')
notes=curseurFC.fetchall()
#print("NOTES = " , notes)
                                #Nombre D'utilisateurs
utilisateurs= set()
for i in range(len(notes)):
    utilisateurs.add(notes[i][0])


                                #Initialisation MatricesNotes
import numpy
NbUser=len (utilisateurs)
NbArticles=len(dictProduits)
matriceNotes=numpy.zeros((NbUser,NbArticles))
                                #Remplir MatriceNotes
for i in notes:
    x=(i[0]-1)
    y=(i[1]-1)
    z=(i[2])
    if (z==None):
        z=0
    matriceNotes[x][y]=z
print ("Matrice Notes Avant Prediction (Avec Transformation De NULL Vers 0) : \n" , matriceNotes)

                                #SimilariteCosinus
from scipy import spatial
def SimilariteCosinus(i,j):
    return(1-spatial.distance.cosine(matriceNotes[i],matriceNotes[j] ))
    
                                #MatriceSimilarite
matriceSimilarite=numpy.zeros((NbUser,NbUser))
for u1 in range(NbUser):
    for u2 in range(NbUser):
        matriceSimilarite[u1][u2]=SimilariteCosinus(u1,u2)
#print(matriceSimilarite)
                                #PredictionNote D'un User et Produit
def prediction_note(User,Product):
    UserRecherche=User
    PdtRecherche=Product
    Voisin1=-1
    SimV1=-1
    i=0
    for sim in matriceSimilarite[UserRecherche-1]:
        if sim>SimV1 and sim<1:
            SimV1=sim
            Voisin1=i
        i+=1
    Voisin2=-1
    SimV2=-1
    i=0
    for sim in matriceSimilarite[UserRecherche-1]:
        if sim>SimV2 and sim<1 and sim<SimV1:
            SimV2=sim
            Voisin2=i
        i+=1
    NotePredite= (SimV1*matriceNotes[Voisin1][PdtRecherche-1]+SimV2*matriceNotes[Voisin2][PdtRecherche-1])/(SimV1+SimV2)
    return NotePredite


                        #Remplissage de MatriceNotes
for k in range(NbUser):
    for l in range(NbArticles):
        if(matriceNotes[k][l])==0:
            #print(k+1,l+1,'de valeur ', matriceNotes[k][l])
            #print("La note prédite de User", UserRecherche+1, "art ", PdtRecherche+1, "est ", NotePredite)
            matriceNotes[k][l]=prediction_note(k,l)
print ("Matrice Notes apres prediction : \n" ,matriceNotes)
                        #Top Similarité
def TOPS (mat):
    Arrpdt=[]
    for i in range(len(mat)):
        MaxSimilarite=[]
        maxNt=1
        for k in range(3):
            indice=-2
            notemax=0
            for j in range(len(mat)):
                if (matriceSimilarite[i][j]<maxNt) and (matriceSimilarite[i][j]>notemax):
                    notemax=matriceSimilarite[i][j]
                    indice=j
            maxNt=notemax
            MaxSimilarite.insert(k,(indice+1))
        Arrpdt.append(MaxSimilarite)
    return Arrpdt
                        #Affichage Top Similarité
PlusSim=TOPS(matriceNotes)
#print("Liste Des Utilisateurs qui se ressemblent : " ,PlusSim)