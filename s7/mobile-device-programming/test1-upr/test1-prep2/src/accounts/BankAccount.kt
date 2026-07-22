package accounts

open class BankAccount (val owner:String,
                        var balance:Dollars
) {
    open fun deposit(amount:Dollars){
        balance+=amount
        println("Deposited $amount, balance of $owner is now $balance")
    }

    open fun withdrawal(amount:Dollars){
        if (amount <= balance) {
            balance -= amount
            println("Withdrew $amount, balance of $owner is now $balance")
        } else {
            println("Invalid withdrawal amount or insufficient funds.")
        }
    }
}