
ФАЙЛОВЕ
ЗАПИС И ЧЕТЕНЕ НА МАСИВИ С ЧИСЛА В/ОТ ТЕКСТОВ И ДВОИЧЕН ФАЙЛ
Файлов вход/изход в C++
Включете заглавния файл <fstream>
Той дефинира класовете ifstream, ofstream и fstream,
съответно входен, изходен и входно/изходен поток.
• избор на входен (inStream) и изходен (ofStream) поток и дефинирането им:
ifstream inStream;
ofstream outStream;
Потоците се свързват с файлове посредством файлов указател (напр. fp)
ifstream fp;
ofstream fp;
• свързване на всеки поток към файл с външно файлово име
 и използване на функцията fail()
за проверка коректността на отварянето на файла:
inStream.open("infile.txt");
if (inStream.fail())
{cout << "Файлът не може да се отвори" <<endl;
exit(1);}
outStream.open("outfile.txt");
if (outStream.fail())
{cout << "Файлът не може да се отвори" << endl;
exit(1);}
• използване на потока inStream за въвеждане на данни от файла infile.txt,
по същия начин както се въвеждат данни от клавиатурата чрез cin:
inStream >> variable1 >> variable2;
• използване на потока outStream за извеждане на данни във файла outfile.txt,
по същия начин както се извеждат данни на екрана чрез cout:
outStream << variable1 << variable2 << endl;
• затваряне на файловете и асоциираните с тях потоци чрез функцията close():
inStream.close();
outStream.close();

Файлови потоци:
ofstream име;  //  файл само за запис
ifstream име;  //  файл само за четене
fstream име;  //  файл за четене и запис
fp - logical file variable
fp.open(filename,mode);	//file open
functions:
fp.is_open();	//true if open successfully
fp.good();		//the same
fp.bad();		//true if unsuccessfylly
fp.fail();		//the same
fp.eof();		//true if reaching end of fail
fp.tellg();		//return count of bytes till file pointer
fp.seekg(pos,flag);	//moves file pointer in pos positions
according flag:beg,end,current
mode - flag ios:: (status)
in -reading,
out -writing over,
app - appends to the end,
trunc- delete and open for writing,
ate - writing and moves pointer to the end,
nocreate - if exist -open, no creates file,
noreplace - creates and opens if not exist
binary- binary file,
beg,cur,end - position begin, current, end
fp.close()	//file closed

Reading/writing in text file:
fp<<expression;  //writing
fp>>variable;	//reading

Reading/writing in binary file:
fp.write(var,size);
fp.read(var,size);


//Задача 11.3 - стр.129:
// Създайте файл infile.txt съдържащ 3 цели числа.
// Прочетете трите числа от файла, сумирайте ги
// и запишете сумата и подходящ текст във файл outfile.txt
// Изведете съдържанието на outfile.txt

#include <fstream>
#include <iostream>
using namespace std;
int main()
{
	int chislo1, chislo2, chislo3;
	cout << "\n Enter 3 numbers:\n";
	cin >> chislo1 >> chislo2 >> chislo3;

	ofstream fp;
	cout << "\n create file infile.txt \n";
	fp.open("infile.txt");
	if (fp.fail())
	{
		cout << "File is not open" << endl;
		exit(1);
	}
	cout << "\n Save numbers in file \n";
	fp << chislo1 << ' ' << chislo2 << '\t' << chislo3 << '\n';
	fp.close();

	cout << "\n Now clear numbers \n";
	chislo1 = chislo2 = chislo3 = 0;

	ifstream fp1;
	ofstream fp2;
	fp1.open("infile.txt");// 3-te chisla
	if (fp1.fail())
	{
		cout << "File is not open" << endl;
		exit(1);
	}
	fp2.open("outfile.txt");//ste zapishem sumata
	if (fp2.fail())
	{
		cout << "File is not open" << endl;
		exit(1);
	}
	cout << "\n Start reading numbers from file \n";
	fp1 >> chislo1 >> chislo2 >> chislo3;
	//after reading from infile.txt
	cout << endl << chislo1 << endl << chislo2 << endl << chislo3;

	cout << "\n Save sum of numbers in file \n";
	fp2 << "Sum of numbers " << endl << " is= " << chislo1 + chislo2 + chislo3 << endl;
	fp1.close();
	fp2.close();
	ifstream fp3;
	fp3.open("outfile.txt");
	if (fp3.fail())
	{
		cout << "File is not open" << endl;
		exit(1);
	}
	char result1[80], result2[80];
	fp3.getline(result1, 80);
	fp3.getline(result2, 80);
	cout << "\n Check results \n";
	cout << result1<<endl;
	cout<< result2 << endl;
	fp3.close();
}


//Задача 11.5 стр. 132- Програма, която
//1.записва в двоичен файл низ и две числа от тип double;
//2.прочита данните от файла и ги извежда на екрана

#include <fstream>
#include <iostream>
#include <cstring>
using namespace std;
int main()
{
	char niz[80];
	double chislo1, chislo2;
	fstream fp1;
	fp1.open("chisla.dat", ios::binary | ios::out);
	if (fp1.fail())
	{
		cout << endl << "File is not open" << endl;
		exit(1);
	}

	cout << "\n String and 2 double numbers to file\n";
	cout << endl << "\nEnter string:";
	cin.getline(niz,80);
	int razmer = strlen(niz);
	fp1.write(niz, razmer);
	cout << endl << "Enter number 1:";
	cin >> chislo1;
	fp1.write((char*)&chislo1, sizeof(double));
	cout << endl << "Enter number 2:";
	cin >> chislo2;
	fp1.write((char*)&chislo2, sizeof(double));
	fp1.close();
	cout << "\n Clear string and numbers=0\n";
	strcpy_s(niz,"");
	chislo1 = chislo2 = 0.0;
	fp1.open("chisla.dat", ios::binary | ios::in);
	fp1.read(niz, razmer);
	fp1.read((char*)&chislo1, sizeof(double));
	fp1.read((char*)&chislo2, sizeof(double));
	fp1.close();
	cout << "\n Reading from file gives:\n";
	for(int i=0; i<razmer;i++)
	cout << niz[i];
	cout << endl << chislo1 << " " << chislo2 << endl;
}

//Задача 11.6 - стр.133
//Initialize float A[10],
//save in binary file ,
//read from file and print.
#include <iostream>
#include <fstream>
using namespace std;

int main()
{
	int i;
	float A[10] = { 1.34, 18.67, 1009.674, 666.88, 12.8,
					0.0, 34.86, 22.222, 1.00001, 0.7777 };

	fstream fp;
	fp.open("out_massiv.dat", ios::out | ios::binary);
	if (fp.fail())
	{
		cout << endl << "Error in file";
		exit(1);
	}
	cout << "\n Save array in file:\n";
	fp.write((char*)A, sizeof(A));
	fp.close();
	cout << "\n Clear array\n";
	for (i = 0;i < 10; i++)
		A[i] = 0.0;
	cout << "\n Reading from file:\n";
	fp.open("out_massiv.dat", ios::in | ios::binary);
	if (fp.fail())
	{
		cout << endl << "Error in file";
		exit(1);
	}
	fp.read((char*)A, sizeof(A));
	fp.close();
	cout << "\n Print result:\n";
	for (i = 0; i < 10; i++)
		cout  <<A[i]<<"\t";
}


//Задача 11.7 - стр.134 - Директен достъп до паметта чрез указател
//Създаване на файл от 10 символа.
//замяна на конкретен номер символ с друг символ
//извеждане новото съдържанието на файла на екран

#include <fstream>
#include <iostream>
#include <cstring>
using namespace std;
int main()
{
	char simvoli[] = "Varna e mojat roden grad";
	char symbol;
	long pos;
	fstream fp;
	fp.open("sentence.dat", ios::out | ios::binary);
	if (!fp)
	{
		cout << endl << "Error in file";
		exit(1);
	}
	fp.write(simvoli, strlen(simvoli));
	fp.close();
	// Смяна на символа
	cout << endl << "\n Enter position to change symbol\n";
	cin >> pos;
	fp.open("sentence.dat", ios::in | ios::binary|ios::out);
	if (!fp)
	{
		cout << endl << "Error in file";
		exit(1);
	}
	fp.seekg(pos, ios::beg);
	// Позиционира файла върху позиция pos спрямо началото
	fp.get(symbol);
	cout << endl << "Symbol is " << symbol;
	// символа на позиция pos
	cout << endl << "Enter new symbol:";
	cin >> symbol;
	fp.seekg(-1L, ios::cur); // Връщане една позиция назад
	fp.put(symbol); // Заместване с новия символ
	fp.close();
	for(int i=0;i<strlen(simvoli);i++)
	simvoli[i]=' ';
	fp.open("sentence.dat", ios::in | ios::binary);
	if (!fp)
	{
		cout << endl << "Error in file";
		exit(1);
	}
	fp.read(simvoli, strlen(simvoli));//Четене на променения стринг
	fp.close();
	cout << endl << "The new string is: " << simvoli;
}



//Текстови файлове (with functions)

#include <iostream>
#include <fstream>
using namespace std;

void file_in(int a[], int count);
void file_out(int b[], int count);
void array_print(int a[],int b[], int count);

int main()
{
	int a[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 },b[10];

	cout << "\nText File write\n";
		file_out(a, 10);

		cout << "\nText File read\n";
		file_in(b, 10);

		cout << "\nArray Print a[] and b[]\n";
		array_print(a,b, 10);

	return 0;
}

void file_out(int a[], int count)
{
	fstream fp;
	fp.open("chisla.txt", ios::out);

	for (int i = 0; i < count; i++)
	{
		fp << a[i] << "\t";
	}

	fp.close();
}

void file_in(int b[], int count)
{
	fstream fp;
	fp.open("chisla.txt", ios::in);

	for (int i = 0; i < count; i++)
	{
		fp >> b[i];
	}

	fp.close();
}

void array_print(int a[],int b[], int count)
{
	cout << "\n Array a[]\n";
	for (int i = 0; i < count; i++)
	{
		cout << a[i] << "\t";
	}
	cout << "\n Array b[]\n";
	for (int i = 0; i < count; i++)
	{
		cout << b[i] << "\t";
	}
}

//Двоични файлове (with functions)


#include <iostream>
#include <fstream>
using namespace std;

void file_in(int a[], int count);
void file_out(int b[], int count);
void array_print(int a[],int b[], int count);

int main()
{
	int a[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 }, b[10];

	cout << "\nBinary file write\n";
		file_out(a, 10);

		cout << "\nBinary file read\n";
		file_in(b, 10);

		cout << "\nArray print a[] and b[]\n";
		array_print(a,b, 10);

	return 0;
}

void file_out(int a[], int count)
{
	fstream fp("chisla.bin", ios::binary|ios::out);
	fp.write((char*)a, sizeof(int) *count);
	fp.close();
}

void file_in(int b[], int count)
{
	fstream fp("chisla.bin", ios::binary |ios::in);

	fp.seekg(0l, ios::end);
	long n = fp.tellg();
	fp.seekg(0l, ios::beg);

	if (n <= count * sizeof(int))
		fp.read((char*)b, n);

	fp.close();
}

void array_print(int a[],int b[], int count)
{
	cout << "\n Array a[]\n";
	for (int i = 0; i < count; i++)
	{
		cout << a[i] << "\t";
	}
	cout << "\n Array b[]\n";
	for (int i = 0; i < count; i++)
	{
		cout << b[i] << "\t";
	}
}
