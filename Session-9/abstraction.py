from abc import ABC,abstractmethod

class Car(ABC):
    @abstractmethod
    def start_engine(self):
        pass
class Tesla(Car):
    def start_engine(self):
        print("Starting Tesla engine Silently....")
class Tata(Car):
    def start_engine(self):
        print("Starting TATA engine Silently....")
my_car1=Tesla()
my_car1.start_engine()


my_car2=Tata()
my_car2.start_engine()


