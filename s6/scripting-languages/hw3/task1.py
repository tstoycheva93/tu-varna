sum=int(input("x + y = "))
diff=int(input("yx - xy = "))

for x in range(10):
    y=sum-x
    if 0<=y<=9 and ((y*10+x)-(x*10+y)==diff):
        print (x*10+y)