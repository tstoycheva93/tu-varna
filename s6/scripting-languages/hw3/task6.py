def increasing_n(n):
    str_n=str(n)
    for i in range(len(str_n)-1):
        if int(str_n[i])>=int(str_n[i+1]):
            return False
    return True

print("Are the digits increasing?",increasing_n(int(input("Enter a number: "))))
