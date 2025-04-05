class BankAccount:
    def __init__(self,owner,balance):
            self.owner=owner
            self.__balance=balance  # private Variable
    def deposit(self,amount):
        self.__balance +=amount
    def withdraw(self, amount):
        if amount <=self.__balance:
            self.__balance -=amount
        else:
            print("Insufficient Balance!")
    def get_balance(self):
            return self.__balance

#using the class
acc=BankAccount("Nikunj Soni",1000)
acc.deposit(200)
acc.withdraw(100)

print("Balanace",acc.get_balance())