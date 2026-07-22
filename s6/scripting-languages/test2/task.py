class Task:
    @staticmethod
    def add(a, b):
        return float(a) + float(b)

    @staticmethod
    def subtract(a, b):
        return float(a) - float(b)

    @staticmethod
    def multiply(a, b):
        return float(a) * float(b)

    @staticmethod
    def divide(a, b):
        a = float(a)
        b = float(b)
        if b == 0.0:
            raise ValueError("Cannot divide by zero.")
        return a / b
