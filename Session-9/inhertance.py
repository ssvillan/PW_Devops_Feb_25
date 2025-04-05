class Animal:
    def __init__(self,name):
           self.name=name
    def speak(self):
        print(f"{self.name} makes a sound.")
class Dog(Animal):
    def speak(self):
        print(f"{self.name} says Woof!")
class Cat(Animal):
    def speak(self):
        print(f"{self.name} says Meow!")
dog1= Dog("Buddy")
cat1=Cat("Mimi")


dog1.speak()
cat1.speak()