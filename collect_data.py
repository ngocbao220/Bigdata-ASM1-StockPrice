from vnstock import Vnstock
from collections import defaultdict

DATA_PATH='./data'
SYMBOL_PATH='./data/symbol.txt'

symbols = []
with open(SYMBOL_PATH, 'r', encoding='utf-8') as f:
    for line in f:
        symbol = line.strip()
        symbols.append(symbol)

for s in symbols:
    print(f"LOAD STOCK: {s} DONE")
    stock = Vnstock().stock(symbol=s, source="VCI")
    df = stock.quote.history(start='2015-01-01', end='2025-01-01', interval='1D')

    df.to_csv(f'./data/stock/{s}.csv', index=False)