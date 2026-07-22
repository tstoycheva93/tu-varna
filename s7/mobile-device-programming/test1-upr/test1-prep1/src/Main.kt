fun main() {
    val duck=Duck(2,"yellow","male") //duck:Animal=Duck() izpolzva samo fun na Animal
    println(duck.mate())
    println(duck.beak())
    println(duck.swim())
    println("Is mammal - " + duck.isMammal())

    val fish=Fish(1,true,3,"female")
    println(fish.mate())
    println("Is mammal - " + fish.isMammal())
    println(fish)
    println(fish.swim())

    val zebra=Zebra(true,4,"female")
    println(zebra.mate())
    println(zebra.run())
    println(zebra.isWild())
    println("Is mammal - " + zebra.isMammal())

}