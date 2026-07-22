package accounts

data class Check(
    val payer: String,
    val payee: String,
    val amount: Dollars
)