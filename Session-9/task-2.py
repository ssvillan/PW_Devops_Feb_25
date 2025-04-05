from abc import ABC, abstractmethod

##### Step 1: Abstract class
class PaymentMethod(ABC):
    
    @abstractmethod
    def pay(self, amount):
        pass

##### Step 2: Child classes with specific implementations

class UPI(PaymentMethod):
    def pay(self, amount):
        print(f"Paying ₹{amount} using UPI.")

class CreditCard(PaymentMethod):
    def pay(self, amount):
        print(f"Paying ₹{amount} using Credit Card.")

class PayPal(PaymentMethod):
    def pay(self, amount):
        print(f"Paying ₹{amount} using PayPal.")

##### Step 3: Using the classes
payment1 = UPI()
payment2 = CreditCard()
payment3 = PayPal()

payment1.pay(200)
payment2.pay(1500)
payment3.pay(900)
