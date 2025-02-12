x = input('Enter character and I will reverse it: ')
s = ''
ls = []
for y in x:
    ls.insert(0, y)
for z in ls:
    s = s + z
print(s)
