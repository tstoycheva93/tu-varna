package bg.tu_varna.sit.ks.test2

import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.Button
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import bg.tu_varna.sit.ks.test2.ui.theme.Test2Theme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            Test2Theme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    Form(
                        modifier = Modifier.padding(innerPadding)
                    )
                }
            }
        }
    }
}

@Composable
fun Form( modifier: Modifier = Modifier) {
    var name by remember { mutableStateOf("") }
    var facultyNum by remember { mutableStateOf("") }
    var specialty by remember { mutableStateOf("") }
    var marks by remember { mutableStateOf("") }

    var isNotValidName by remember { mutableStateOf(false) }
    var isNotValidFacultyNum by remember { mutableStateOf(false) }
    var isNotValidSpecialty by remember { mutableStateOf(false) }
    var isNotValidMarks by remember { mutableStateOf(false) }

    var hasError=false
    var error by remember { mutableStateOf("") }

    val context = LocalContext.current
    val errorTag = "22621693"

    Column(
        modifier = modifier
            .fillMaxSize()
            .padding(24.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            text = stringResource(R.string.title, name),
            textAlign=TextAlign.Center,
            color=Color.Magenta,
            fontSize=48.sp,
            lineHeight = 48.sp
            ) //title
        Spacer(modifier = Modifier.height(16.dp))
        Text(
            modifier = modifier,
            text="$error",
            textAlign=TextAlign.Center,
            color=Color.Red,
            fontSize=18.sp
        ) //error
        OutlinedTextField(
            value=name,
            onValueChange = {
                name=it
                isNotValidName=name.isEmpty() || name.length<3
            },
            label={
                Text(stringResource(R.string.nameLabel))
            },
            placeholder={
                Text(stringResource(R.string.namePlace))
            },
            keyboardOptions = KeyboardOptions.Default,
            singleLine = true,
            isError=isNotValidName
        ) //name
        Spacer(modifier = Modifier.height(16.dp))
        OutlinedTextField(
            value=facultyNum,
            onValueChange = {
                facultyNum=it
                isNotValidFacultyNum=facultyNum.isEmpty() || facultyNum.length!=8
            },
            label={
                Text(stringResource(R.string.facLabel))
            },
            placeholder={
                Text(stringResource(R.string.facPlace))
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number
            ),
            singleLine = true,
            isError=isNotValidFacultyNum
        ) //num
        Spacer(modifier = Modifier.height(16.dp))
        OutlinedTextField(
            value=specialty,
            onValueChange = {
                specialty=it
                isNotValidSpecialty=specialty.isEmpty() || specialty.length<3
            },
            label={
                Text(stringResource(R.string.specLabel))
            },
            placeholder={
                Text(stringResource(R.string.specPlace))
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Ascii
            ),
            singleLine = true,
            isError=isNotValidSpecialty

        ) //spec
        Spacer(modifier = Modifier.height(16.dp))
        OutlinedTextField(
            value=marks,
            onValueChange = {
                marks=it
                isNotValidMarks=marks.isEmpty() || !(marks.toInt()>=0 && marks.toInt()<=100)
            },
            label={
                Text(stringResource(R.string.marksLabel))
            },
            placeholder={
                Text(stringResource(R.string.marksPlace))
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number
            ),
            singleLine = true
        ) //marks
        Spacer(modifier = Modifier.height(16.dp))
        Button(onClick = {
            if (isNotValidName){
                hasError=true
                Log.e(errorTag, context.getString(R.string.invalid_name))
                Toast.makeText(context, context.getString(R.string.invalid_name),Toast.LENGTH_LONG).show()
            }
            if (isNotValidFacultyNum){
                hasError=true
                Log.e(errorTag, context.getString(R.string.invalid_num))
                Toast.makeText(context,context.getString(R.string.invalid_num),Toast.LENGTH_LONG).show()
            }
            if (isNotValidSpecialty){
                hasError=true
                Log.e(errorTag, context.getString(R.string.invalid_spec))
                Toast.makeText(context,context.getString(R.string.invalid_spec),Toast.LENGTH_LONG).show()
            }
            if (isNotValidMarks){
                hasError=true
                Log.e(errorTag, context.getString(R.string.invalid_marks))
                Toast.makeText(context,context.getString(R.string.invalid_marks),Toast.LENGTH_LONG).show()
            }
            if(hasError){
                error= context.getString(R.string.error)
                Log.e(errorTag, context.getString(R.string.error))
            }
            else {
                Log.e(errorTag, context.getString(R.string.success))
                error= context.getString(R.string.success)
                name=""
                facultyNum=""
                specialty=""
                marks=""

            }
        }
        ) {
            Text(stringResource(R.string.btn))
        }



    }
}



@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    Test2Theme {
        Form()
    }
}

