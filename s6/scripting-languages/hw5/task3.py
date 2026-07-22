def increasing_n(n):
    s = str(n)
    i = 0
    while i < len(s) - 1:
        if s[i] >= s[i + 1]:
            print("Не са в нарастващ ред!")
            return
        i = i + 1
    print("В нарастващ ред са!")

increasing_n(789)
increasing_n(44562)