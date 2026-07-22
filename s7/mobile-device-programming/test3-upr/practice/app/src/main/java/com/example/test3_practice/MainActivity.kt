package com.example.test3_practice

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.material3.Card
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.snapshots.SnapshotStateList
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.test3_practice.data.Place
import com.example.test3_practice.data.PlaceSource
import com.example.test3_practice.ui.theme.Test3_practiceTheme
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            Test3_practiceTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    PlaceApp(
                        modifier = Modifier.padding(innerPadding)
                    )
                }
            }
        }
    }
}

@Composable
fun PlaceApp(modifier: Modifier=Modifier){
    val data=remember{mutableStateListOf<Place>()}
    PlaceAsync(data)
    PlaceList(
        modifier=modifier,
        places=data
    )
}

fun PlaceAsync(data: SnapshotStateList<Place>) {
    CoroutineScope(Dispatchers.Default).launch {
        while(true){
            delay(100)
            PlaceAdd(data)
            }
    }

    CoroutineScope(Dispatchers.Default).launch {
        while(true){
            delay(200)
            PlaceUpdate(data)
        }
    }

    CoroutineScope(Dispatchers.Default).launch {
        while(true){
            delay(300)
            PlaceDelete(data)
        }
    }

}

suspend fun PlaceAdd(data: SnapshotStateList<Place>) {
    data.add(PlaceSource.getPlaces().random())
}

suspend fun PlaceUpdate(data: SnapshotStateList<Place>) {
    if (data.isNotEmpty()) {
        val index = data.indices.random()
        val place = data[index]
        data.remove(place)
        place.count -= 10
        data.add(index, place)
    }
}

suspend fun PlaceDelete(data: SnapshotStateList<Place>) {
    if (data.isNotEmpty()) {
        data.remove(data.random())
    }
}
@Composable
fun PlaceList(modifier: Modifier=Modifier, places: List<Place>) {
    LazyVerticalGrid(
columns= GridCells.Fixed(3)
    ) {
        items(places){
            place->PlaceCard(
                modifier=Modifier.padding(8.dp),
                place=place
            )
        }
    }

}

@Composable
fun PlaceCard(modifier: Modifier=Modifier, place: Place){
Card(modifier=modifier){
    Image(
        painter= painterResource(place.imageResourceId),
        contentDescription=stringResource(place.stringResourceId),
        modifier=Modifier.height(196.dp).fillMaxWidth(),
        contentScale= ContentScale.Crop
    )
    Row(modifier=Modifier.padding(16.dp)){
        Text(
            text="Count:${place.count}",
            style= MaterialTheme.typography.headlineSmall
        )
        Spacer(Modifier.width(10.dp))
        Text(
            text=stringResource(place.stringResourceId),
            style=MaterialTheme.typography.headlineSmall
        )
    }


}
}

@Composable
@Preview
fun PlaceCardPreview(){
    Test3_practiceTheme {
        PlaceCard(
            place=PlaceSource.getPlaces()[0]
        )
    }
}