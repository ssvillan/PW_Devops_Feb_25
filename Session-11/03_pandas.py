import pandas as pd

df=pd.read_csv('data.csv')
print(df.head())
print(df[df['price']<3000])
sort=df.sort_values(by="price", ascending=False)
print("\n Sorted data: ",sort)

