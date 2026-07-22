data class Fish(private val sizeInFt:Int,
                private val canEat:Boolean,
                override val age:Int,
                override val gender:String) :Animal(age, gender) {
    override fun mate(): String {
        return "$gender fish aged $age is mating"
    }
    override fun isMammal():Boolean{
        return false
    }
    internal fun swim():String{
        return "$gender fish aged $age is swimming"
    }

} //data class za da ima toString - zatova sa override age,gender i v Animal sa open