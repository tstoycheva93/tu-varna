class Zebra (val isWild:Boolean, age:Int,gender:String):Animal(age,gender) {
    override fun mate(): String {
        return "$gender zebra aged $age is mating"
    }
    override fun isMammal():Boolean{
        return true
    }
     fun isWild():String{ //vmesto data class
        return ("Zebra is wild? - " + isWild)
    }
    fun run():String{
        return "$gender zebra aged $age is running"
    }
}