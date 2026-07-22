package com.example.test3_prac2.data

import com.example.test3_prac2.R

object DataSource {
    fun getCourses():List<Course>{
        return listOf(
            Course(R.string.biology,R.drawable.biology),
            Course(R.string.business,R.drawable.business),
            Course(R.string.culinary,R.drawable.culinary),
            Course(R.string.design,R.drawable.design),
            Course(R.string.ecology,R.drawable.ecology),
            Course(R.string.engineering,R.drawable.engineering),
            Course(R.string.fashion,R.drawable.fashion),
            Course(R.string.finance,R.drawable.finance),
            Course(R.string.film,R.drawable.film),
            Course(R.string.gaming,R.drawable.gaming),
            Course(R.string.geology,R.drawable.geology),
            Course(R.string.automotive,R.drawable.automotive),
            Course(R.string.drawing,R.drawable.drawing),
            Course(R.string.history,R.drawable.history),
            Course(R.string.journalism,R.drawable.journalism),
            Course(R.string.law,R.drawable.law),
            Course(R.string.lifestyle,R.drawable.lifestyle),
            Course(R.string.music,R.drawable.music),
            Course(R.string.painting,R.drawable.painting),
            Course(R.string.photography,R.drawable.photography),
            Course(R.string.physics,R.drawable.physics),
            Course(R.string.tech,R.drawable.tech)
        )
    }
}