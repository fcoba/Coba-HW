#First, I am going to import os (operating system), cvs (comma seperated values). 
#These are the python packages which will allow me to read my data etc. 

import os 
import csv 

#Next, I will assign variables as empty lists. 
Date = []
Revenue = []

#This is a command which allows python to read the csv file and skip listing the header
#of the file. Also, I now appended the values of each row into the set of my previously
#defined variables called "Data" and "Revenue". 
Budget_Data1 = csv.reader(open('budget_data_1.csv'), delimiter=",")
next(Budget_Data1, None) 
for row in Budget_Data1:
    Date.append(row[0])
    Revenue.append(int(row[1])) 

Budget_Data2 = csv.reader(open('budget_data_2.csv'), delimiter=",")
next(Budget_Data2, None) 
for row in Budget_Data2:
    Date.append(row[0])
    Revenue.append(int(row[1]))

#This is the total number of revenue for both data sets. 
total_Revenue = 'Total revenue in both datasets is $' + str(sum(Revenue))
print(total_Revenue)

#Next, I will count the total number of months. 
number_of_months = 'The number of months in both datasets is ' + str(len(Date))
print(number_of_months) 

#Then to calculate the average change in revenue, I first find the total change in revenue. 
total_change_in_Revenue = 0
for i in range(1,len(Revenue)):
    total_change_in_Revenue = total_change_in_Revenue + (Revenue[i]-Revenue[i-1])

average_change_in_revenue = 'The average change in revenue is $' + str(round(total_change_in_Revenue/(len(Revenue)-1), 2))
print(average_change_in_revenue)

#Maximum/min value in revenue (i.e. greatest increase)
greatest_increase_in_revenue = 'The greatest increase in Revenue is ($' + str(max(Revenue))+ ') on ' + str(Date[Revenue.index(max(Revenue))])
print(greatest_increase_in_revenue)

greatest_decrease_in_revenue = 'The greatest decrease in Revenue is ($' + str(min(Revenue))+ ') on ' + str(Date[Revenue.index(min(Revenue))])
print(greatest_decrease_in_revenue)

Data_File = open('Budget_Data_Results.txt', "w")
Data_File.write(total_Revenue + "\n")
Data_File.write(number_of_months + "\n")
Data_File.write(average_change_in_revenue + "\n")
Data_File.write(greatest_increase_in_revenue + "\n")
Data_File.write(greatest_decrease_in_revenue + "\n")
Data_File.close()

