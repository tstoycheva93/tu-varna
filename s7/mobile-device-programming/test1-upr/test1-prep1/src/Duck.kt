class Duck(age:Int, val beakColor:String="Yellow",gender:String): Animal(age=age,gender=gender) {
    override fun isMammal():Boolean{
        return false
    }
    override fun mate(): String {
        return "$gender duck aged $age is mating"
    }
    fun beak():String{
        return "$beakColor beak for this duck"
    }
    fun swim():String{
        return "$beakColor beak duck is swimming"
    }
}