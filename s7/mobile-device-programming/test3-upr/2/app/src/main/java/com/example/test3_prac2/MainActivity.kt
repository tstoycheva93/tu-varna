package com.example.test3_prac2

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.snapshots.SnapshotStateList
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.test3_prac2.data.Course
import com.example.test3_prac2.data.DataSource
import com.example.test3_prac2.ui.theme.Test3_Prac2Theme
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            Test3_Prac2Theme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    CourseApp(
                        modifier = Modifier.padding(innerPadding)
                    )
                }
            }
        }
    }
}

@Composable
fun CourseApp(modifier:Modifier=Modifier){
    val data=remember{mutableStateListOf<Course>()}
    CourseAsync(data)
    CourseList(
        modifier=modifier,
        courses=data
    )
}

fun CourseAsync(data: SnapshotStateList<Course>) {
    CoroutineScope(Dispatchers.Default).launch {
        while(true){
            val randomDelay = (1000L..3000L).random()
            delay(randomDelay)
            CourseUpdate(data)
        }
    }

    CoroutineScope(Dispatchers.Default).launch {
        while(true){
            val randomDelay = (1000L..3000L).random()
            delay(randomDelay)
            CourseAdd(data)
        }
    }


}

@Composable
fun CourseList(modifier:Modifier=Modifier, courses:List<Course>){
    LazyVerticalGrid(
        columns= GridCells.Fixed(2)) {
        items(courses){
            course->
            CourseCard(modifier=modifier, course=course)
        }
    }

}

@Composable
fun CourseCard(modifier: Modifier = Modifier, course: Course) {
    Card(
        modifier = modifier,
        shape = RoundedCornerShape(16.dp)
    ) {
        Row(
            modifier = modifier,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Image(
                painter = painterResource(course.imageResourceId),
                contentDescription = stringResource(course.stringResourceId),
                modifier = Modifier.size(65.dp).clip(RoundedCornerShape(12.dp)),
                contentScale = ContentScale.Crop
            )
            Spacer(modifier = Modifier.width(12.dp))
            Column {
                Text(
                    text = stringResource(course.stringResourceId),
                    style = MaterialTheme.typography.bodyMedium
                )
                Spacer(modifier = Modifier.height(8.dp))
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        painter = painterResource(R.drawable.ic_grain),
                        contentDescription = null,
                        modifier = Modifier.size(16.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = course.count.toString()
                    )
                }
            }
        }
    }
}

suspend fun CourseUpdate(data: SnapshotStateList<Course>) {
    if (data.isNotEmpty()){
    val course=data.random()
    val count=course.count
    data.remove(course)
    val decrease=(1..count).random()
    course.count -= decrease
        if (course.count==0) {course.count=300}
    data.add(course)
}
}

suspend fun CourseAdd(data: SnapshotStateList<Course>) {
    data.add(DataSource.getCourses().random())
}


@Preview
@Composable
fun CourseCardPreview() {
    Test3_Prac2Theme {
CourseCard(
    course= DataSource.getCourses()[0]
)
    }
}