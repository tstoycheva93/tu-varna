import accounts.BankAccount
import accounts.Check
import accounts.CheckingAccount
import accounts.Dollars
import accounts.SavingsAccount

fun main() {
    var amount = Dollars(5000.0)
    var bankAccount = BankAccount("Tedi",amount)
    bankAccount.deposit(Dollars(1000.0))
    bankAccount.withdrawal(Dollars(400.0))

    val check1= Check("Hrisi", "John", Dollars(100.0))
    val check2= Check("John", "Hrisi", Dollars(200.0))

    val checkingAccount = CheckingAccount(Dollars(50.0),"Hrisi",Dollars(500.0))
    checkingAccount.processCheck(check1)
    checkingAccount.processCheck(check2)
    checkingAccount.withdrawal(Dollars(650.0))

    val savingsAccount = SavingsAccount("Mimi", Dollars(500.0), 0.15)
    savingsAccount.depositMonthlyInterest()
    savingsAccount.withdrawal(Dollars(100.0))

}