number=input()
largest=0
smallest=9

for i in number:
    if int(i)>largest:
        largest=int(i)
    if int(i)<smallest:
        smallest=int(i)

print("Largest digit is",largest, "and smallest is",smallest)