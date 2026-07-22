package com.example.test3_practice.data

import com.example.test3_practice.R


object PlaceSource {
    fun getPlaces():List<Place>{
        return listOf(
            Place(R.string.place1,R.drawable.background),
            Place(R.string.place2,R.drawable.background),
            Place(R.string.place3,R.drawable.background),
            Place(R.string.place4,R.drawable.background),
            Place(R.string.place5,R.drawable.background),
            Place(R.string.place6,R.drawable.background),
            Place(R.string.place7,R.drawable.background),
            Place(R.string.place8,R.drawable.background),
            Place(R.string.place9,R.drawable.background),
            Place(R.string.place10,R.drawable.background),
        )
    }
}