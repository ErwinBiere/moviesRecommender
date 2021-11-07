import csv as csv
import numpy as np
#1 Reading csv file using the csv reader function:
with open("userReviews.csv")as data:
	DataReader = csv.reader(data)
	header = next(DataReader)
	data = list(DataReader)
#Check headers of the csv file.
print(header)
#Output gives :
#0 movieName | 1 Metascore | 2 Author | 3 AuthorhRef | 4 Date | 5 Summary | 6 InteractionsYesCount | 7 InteractionTotalCount | 8 InteractionsThumbUp | 9 InteractionsThumbDown
#Define all variables used
X = []
Y = []
Z = []
moviechoice = 'ice-age-dawn-of-the-dinosaurs'
#2 Save contents of author column to variable X
print(len(data))
#The number of cells is 203514
#Trying to define x using data gives an list index out of range callback.
#This most likely means we have a nested list.
#define new list based on data
movieslist = data[:][0]
#Split the data by ;
for i in range (0,203514):
	movieslist = [data[i][0].split(";") for i in range (203514)
	

for i in range (0,203514):
	X += [movieslist[i][2]]

#3 Filter based on favorite movie assign to Y
for i in range (0,203514):
	if movies[i][0] == moviechoice: #checks moviename with chosen movie
		Y += [movies[i][2]] #adds the ith row, column 2 (author) to Y

#4 Save which movies have been watched by same author assign to Z
for j in range (0,len(Y)):
	author = Y[j] #adds all movies to a loop to check
	for i in range (0, 203514):
		if movieslist [i][2] == author: #checks if author is same as list Y
			Z += [movieslist[i][0]] #if same, add the movie to list Z
			
#5 write Z as proof of working to output file
np.savetxt("recommendationsbasedonreview.csv",Z,delimiter=",",fmt='% s')
