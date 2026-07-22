package com.example.test3_practice.data

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes

data class Place(
    @StringRes var stringResourceId:Int,
    @DrawableRes var imageResourceId:Int,
    var count:Int=300
    )
