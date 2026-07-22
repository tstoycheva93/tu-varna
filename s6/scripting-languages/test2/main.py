from calculator import Calculator

def main():
    calc = Calculator()

    print(calc.add(10, 5.5))
    print(calc.multiply(3.2, 2))
    print(calc.subtract(7.5, 3.5))
    print(calc.divide(10, 4))

    try:
        print(calc.add(10, "Hello"))
    except TypeError as e:
        print("Error:", e)

    try:
        print(calc.divide(10, 0))
    except ValueError as e:
        print("Error:", e)

if __name__ == "__main__":
    main()
