open class Animal (open val age:Int, open val gender:String) {
    open fun isMammal():Boolean {
        return true
    }
    open fun mate():String {
        return "Animal $gender age $age is mating"
    }
}