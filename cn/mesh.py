import pandas as pd
import seaborn as sns
from pylab import savefig

df = pd.read_csv('mesh.tr', sep=' ', names=["Mode", "Time", "Source", "Dest", "Size"], usecols =[0,1,2,3,5])
df['Packetloss'] = 0
df['Packetrecv'] = 0
prevpl = 0
prevpr = 0
for index, row in df.iterrows():
    if(row['Mode'] == 'd'):
        prevpl += 1
    elif(row['Mode'] == 'r' and row['Dest'] == 3):
        prevpr += 1
    df.at[index,'Packetloss'] = prevpl
    df.at[index,'Packetrecv'] = prevpr
df['PDR'] = df['Packetrecv']/(df['Packetrecv'] + df['Packetloss'])
df['PLR'] = df['Packetloss']/(df['Packetrecv'] + df['Packetloss'])
df['Throughput(Kbps)'] = (df['Packetrecv'] * df['Size'] * 8)/(1000 * df['Time'])
df = df.groupby(['Time'],as_index=False).last()
df = df.dropna()
print(df)

svm = sns.lineplot(data=df, x="Time", y="Throughput(Kbps)")
svm = sns.lineplot(data=df, x="Time", y="PDR", color="green")
svm = sns.lineplot(data=df, x="Time", y="PLR", color="red")
figure = svm.get_figure()
figure.savefig('mesh.png', dpi=400)
