def clear_console():
    print("\n" * 100)
word = input("Word: ")
n=10
toPrint = [" _ "] * len(word)
print("Your 10 guesses begin!")
while n>0:
    ch = input("Letter: ")[0]
    fail=True
    for i in range(len(word)):
        if ch == word[i]:
            fail=False
            toPrint[i]=word[i]
    print("".join(toPrint))
    if "".join(toPrint)==word:
        print("Good job!")
        break
    if fail:
        n-=1
    print("You have ",n, " guesses left.")
if n<=0:
    print("You failed! :( The word was ", word, ".")
