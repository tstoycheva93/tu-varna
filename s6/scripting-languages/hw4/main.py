class Time:
    def __init__(self, hour=0, minute=0, second=0):
        self.set_time(hour, minute, second)

    def set_time(self, hour, minute, second):
        self.hour = hour if 0 <= hour <= 23 else 0
        self.minute = minute if 0 <= minute <= 59 else 0
        self.second = second if 0 <= second <= 59 else 0

    def get_time(self):
        return self.hour, self.minute, self.second

    def format_time(self):
        period = "AM" if self.hour < 12 else "PM"
        hour_format = self.hour if 1 <= self.hour <= 12 else (self.hour % 12) or 12
        return f"{hour_format:02}:{self.minute:02}:{self.second:02} {period}"

    def display_time(self):
        print(self.format_time())

t1 = Time(17, 22, 14)
t1.display_time()

t2 = Time(11, 11, 1)
print(t2.format_time())

t3 = Time(28, 96, 225)
t3.display_time()
