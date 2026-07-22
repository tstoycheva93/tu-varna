package accounts
class SavingsAccount (owner:String,
                      balance:Dollars,
                      private val annualInterestRate: Double):BankAccount(owner,balance
){

    fun depositMonthlyInterest() {
        val monthlyInterest = balance.amount *(annualInterestRate)
        val interestDollars = Dollars(monthlyInterest)
        deposit(interestDollars)
        println("Deposited monthly interest: $interestDollars")
    }

}