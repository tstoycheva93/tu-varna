package com.example.test3_prac2.data

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes

data class Course(
    @StringRes val stringResourceId:Int,
    @DrawableRes val imageResourceId:Int,
    var count:Int=300
)
