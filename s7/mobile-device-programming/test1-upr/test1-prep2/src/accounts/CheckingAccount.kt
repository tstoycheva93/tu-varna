package accounts

class CheckingAccount(private val insufficientFundsFee:Dollars,
                      owner:String,
                      balance:Dollars) :BankAccount(owner,balance) {
    fun processCheck(checkToProcess:Check){
        if (checkToProcess.payee == owner) {
            println("Processed check from ${checkToProcess.payer} for ${checkToProcess.amount}.")
            deposit(checkToProcess.amount)
        } else if (checkToProcess.payer==owner){
            println("Processed check to ${checkToProcess.payee} for ${checkToProcess.amount}.")
            withdrawal(checkToProcess.amount)
        }
    }
    override fun withdrawal(amount: Dollars) {
        if (amount <= balance) {
            balance -= amount
            println("Withdrew $amount of $owner New balance: $balance")
        } else {
            balance -= insufficientFundsFee
            println("Insufficient funds. Charged fee of $insufficientFundsFee. New balance: $balance")
        }
    }

}