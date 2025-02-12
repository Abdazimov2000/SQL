x = input('Enter character and I will count the number of vowels: ').lower()
t = ['a', 'e', 'i', 'o', 'u']
ls = []
for l in x:
    if l in t:
        ls.append(l)
print(len(ls))
