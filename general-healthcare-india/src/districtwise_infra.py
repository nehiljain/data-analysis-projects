import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


		

x = pd.read_csv('../data/raw-data/District_Wise_Rural_HealthCare_Infrastructure.csv');

print x;	
#print x.head();

#print x[:3]  //getting just the top 3 rows
states = set(x['States/Union Territory']);

#print set(states);

#print x.shape;

grouped = x.groupby('States/Union Territory');



print grouped.shape
print grouped.sum()
print grouped.mean()

#print x.loc['States/Union Territory':]

#print x.head();

#print x[0:].describe();

#print x['States/Union Territory'];

#header=['States/Union Territory',]



#print "\n Starting new data-frame";

#print df1.head();





