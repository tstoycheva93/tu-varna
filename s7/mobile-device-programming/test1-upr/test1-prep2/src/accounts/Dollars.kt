package accounts
@JvmInline

value class Dollars(val amount: Double) {
    init {
        require(amount >= 0) { "Dollar amount cannot be negative." }
    }

    operator fun plus(other: Dollars): Dollars = Dollars(this.amount + other.amount)
    operator fun minus(other: Dollars): Dollars = Dollars(this.amount - other.amount)
    operator fun compareTo(other: Dollars): Int = this.amount.compareTo(other.amount)
    operator fun times(multiplier: Double): Dollars = Dollars(this.amount * multiplier)

    override fun toString(): String = "$${"%.2f".format(amount)}"

}