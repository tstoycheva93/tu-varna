//1.Tyrsi zadadena bukva, prebroi kolko pyti se sresta i zameni s '*'
//2.Preobrazuva vsqka nechetna bukva v glavna
#include<iostream>
#include<string>
#include<cstring>
using namespace std;
int main()
{	string  s1;
	char c;
	int br = 0, i;
	cout << "\n Enter string:";
	getline(cin, s1);
	cout << s1;
	cout << "\n Enter character:";
	cin >> c;
	for (i = 0; i < s1.length();i++)	//kato s1.size()- dyljina na string
		if (c == s1[i])
		{
			s1[i] = '*';
			br++;
		}
	cout << s1 << endl;
	cout << "\n count of exchanged chars: " << br << endl;
		//preobrazuva nechetnite bukvi v glavni
		//int i;
	string s2;
		cout << "\n Enter string:";
		cin.ignore();
		getline(cin, s2);
		for (i = 0;i < s2.size(); i += 2)
			s2[i] = toupper(s2[i]);	//toupper() preobrazuva malkite bukwite w glawni
		cout << s2 << endl;			//tolower() obratnoto
		system("pause");
	}

// Zad. 6.8 na str.72 Modelirane na igra za razpoznavane na duma po bukvi
//polzwa biblioteka <cstring>
#include<iostream>
#include<string>
#include<cstring>

using namespace std;
int main()
{
	char duma[] = "programming";
	char word[] =  "+++++++++++";
	int i, count = 0;
	char ch;
	do {
		cout << " \n Gues the word:";
		cout << endl << word << endl;
		cout << "\n Enter character:";
		cin>>ch;
		cout << endl;
		for (i = 0;i < strlen(duma);i++)	//strlen() - broj simvoli
			if (ch == duma[i])
				word[i] = ch;
		count++;
	} while (strcmp(word, duma));	//strcmp() -wrysta 0 pri sywpadane
	cout << endl << "\n \a You guess - congratulations!!  The word is: " << word << endl;
	cout << count << "\t Number of attempts" << endl;
}

	//str. 70/zad.6.5 - Namerete min i max dyljina na red - ot 10 reda tekst
	//polzwa biblioteka <cstring>
	#include<iostream>
	#include<string>
	#include<cstring>

	using namespace std;
	int main()
	{
	char text[10][80];			//dwumeren simvolen masiw - 10 reda po 80 simwola
	int len[10];						//dylvini na redowete
	int i, min=80, max=0, n = 0, m = 0;
													//wywevda se tekst
	cout << "\n Enter text in 10 rows \n";
	for (i = 0;i < 10;i++)
		cin.getline(text[i], 80);
														//opredelq dylvini na redowete
	for (i = 0;i < 10;i++)
		len[i] = strlen(text[i]);			//strlen() - broj simwoli
	//opredelq min i max
	for (i = 0; i < 10; i++)
	{
		if (len[i] < min)
		{
			min = len[i];n = i + 1;
		}
		if (len[i] > max)
		{
			max = len[i];m = i + 1;
		}
	}
	//izwevda teksta
	cout << "\n\n\n";
	for (i = 0; i < 10; i++)
		cout << text[i] << endl;
	//izwevda max i min
	cout << "\n min length is:" << min << "\t  on position: " << n << endl;
	cout << "\n max length is:" << max << "\t on position: " << m << endl;
}

//polzwa biblioteka <cstring> i <string>
//Definirajte masiv s dylvina 20, kojto e
//pylen s EGN bez dublirane na EGN-ta
//i dyljina ne po malko ot 10 simwola.
//Da se izwlicha rojdena data ot EGN;
//Da se izchisli pol po predposlednata cifra ot EGN: odd - "female", even - "male"
//Da se opredeli wyzrast
#include<iostream>
#include<string>
#include<cstring>

using namespace std;
int main()
{
	char egn[20][11];
	int br, i, j,age;
	string day, month, year, p;
	do {
		cout << "\n How many EGN will enter now:";
		cin >> br;				//tekust razmer na masiva
	} while (br < 0 || br > 20);
	cout << "\n Enter EGN:";
	cin.ignore();				//pochistwa bufera
	for (i = 0;i < br;i++)
	{
		do {
			cout << "\n 10 digits, please:";
			cin.getline(egn[i], 11);
				} while (strlen(egn[i]) < 10);
		//Check for duplicates
		for (j = i - 1;j >= 0;j--)
			if (!strcmp(egn[i], egn[j]))
				{	cout << "\n This egn exist. Enter another:";i--;
				break;
				}
	}
	cout << "\n List of EGN:\n";
	for (i = 0;i < br;i++)
	{
		cout <<"\n EGN "<<i+1<<"  :  "<< egn[i] << "\t";
		cout << "Birthday:  ";
		day.assign(egn[i], 4, 2);

		month.assign(egn[i], 2, 2);
		if (month[0]=='4')
			month[0]='0';
		else if(month[0]=='5')
			month[0]='1';
		year.assign(egn[i], 0, 2);
		cout << day + "." + month + "." + "20" + year;
		
		p.assign(egn[i], 8, 1);
		cout <<" pol: ";
		pare("7") || 
		if(stoi(p)%2!=0)							
			cout << "female";
		else
			cout << "male";
		age = 22 - stoi(year);
		cout << "\t Age:" << age << endl;
	}
	system("pause");
}
	
	//Library class string
	#include<string>
	#include<iostream>
	using namespace std;
	int main()
	{// use cin>> or = to enter string
		string st1;
		string st2;
		cout << "\n Enter your first name : ";
		cin >> st1;
		st2 = st1;
		cout << "\n Welcome " << st2 << endl;
		system("pause");
		string nst1;
		string nst2;
		cout << "\n Enter your first name : ";
		cin.ignore();
		getline(cin, nst1);
		nst2 = nst1;
		cout << "\n Welcome " << nst2 << endl;
		system("pause");
		//initialization in () or =
		string st3("Welcome");
		string st4 = " to the world of ";
		string st5;
		st5 = "C++ programming";
		cout << st3 << st4 << st5 << endl;
		system("pause");
		//method size() count symbols i metod length()
		string str5 = "C++ is fun";
		cout << str5;
		cout << "\n String size gives:" << str5.size() << endl;
		str5 = "";
		cout << "\n Size of cleared string is:" << str5.size() << endl;
		system("pause");
		string str = "C++ is fun";
		cout << str;
		cout << "\n String size gives:" << str.length() << endl;
		str = "";
		cout << "\n Size of cleared string is:" << str.length() << endl;
		system("pause");
		//method empty() return 1 or 0
		string name;
		cout << "\n Enter name:";
		cout << "\n You will stay in loop untill enter name:";
		while (name.empty())//when enter name empty() is 0
		{
					getline(cin, name);
		}
		cout << "\n Thanks " << name << endl;
		system("pause");
		//concatenation by + or method append()
		string firstname, lastname, fullname;
		cout << "Enter your first name:";
		cin >> firstname;
		cout << "Enter your last name:";
		cin >> lastname;
		fullname = firstname;
		fullname.append(" ");
		fullname.append(lastname);
		cout << "\n Thanks " << fullname << endl;
		system("pause");
		cout << "\n Concatenation with +:";
		fullname = "";
		fullname = firstname + "    " + lastname;
		cout << fullname;
		system("pause");
		//compare by == or != or method compare() -return 0 if equal
		string n1, n2;
		cout << "\n Enter 2 strings and compare:";
		cin.ignore();
		cout << "\n First:";
		getline(cin, n1);
		cout << "\n Second:";
		getline(cin, n2);
		if (n1.compare(n2) == 0)
			cout << "\n strings are the same \n";
		else
			cout << "\n strings are not equal\n";
		system("pause");
		//copy strings by = or method assign()
		string s1, s2, s3;
		s1 = "hello world";
		s2.assign(s1);
		cout << s1 << " " << s2 << endl;
		s3.assign(s1, 6, 5);//world
		//from symbol 6-th copy 5 symbols
		cout << s3 << endl;// world
		system("pause");
		//method swap() exchange 2 strings
		string strg1 = "this is first";
		string strg2 = "this is second";
		cout << strg1 << "\t" << strg2;
		strg1.swap(strg2);
		cout << "\n After swapping :" << endl;
		cout << strg1 << "\t" << strg2 << endl;
		system("pause");
		//method erase() delete part of string
		string stri = "original string";
		cout << stri;
		cout << "\n Erase from 6-th 3\n";
		stri.erase(6, 3);
		cout << stri << endl;//originstring
		system("pause");
	//method replace() combine erase() and insert()
		string stro = "This is an original string";
		cout << stro << endl;
		stro.replace(8, 2, "my new");
		cout << stro << endl;//This is my new original string
		system("pause");
	}
	