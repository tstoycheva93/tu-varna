from task import Task

class Calculator:
    def add(self, a, b):
        self._validate_inputs(a, b)
        return Task.add(a, b)

    def subtract(self, a, b):
        self._validate_inputs(a, b)
        return Task.subtract(a, b)

    def multiply(self, a, b):
        self._validate_inputs(a, b)
        return Task.multiply(a, b)

    def divide(self, a, b):
        self._validate_inputs(a, b)
        return Task.divide(a, b)

    @staticmethod
    def _validate_inputs(a, b):
        if not isinstance(a, (int, float)) or not isinstance(b, (int, float)):
            raise TypeError("Only numbers must be entered.")
