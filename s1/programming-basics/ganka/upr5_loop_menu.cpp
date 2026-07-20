//Tema 5:Operatori za cikyl -for, while, do..while - Syzdavane na menu i podmenu.
//operatori break i continue
//str.50

#include <iostream>
#include <iomanip>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include<cstring>
using namespace std;
double root3(double x);
int main()
{
	//suma ot 1 do 10  - bez 7 i 8
	//str52- primer za operator continue - preskacha edna iteraciq( minawane prez cikyla)
	int S = 0;
	for (int i = 1; i <= 10; i++)
	{
		if (i == 7 || i == 8)continue;
		S += i;
	}
	cout << "\n S=" << S << endl;
}

	//str52/zad5.1
	// Product of positive numbers entered from keyboard until pressing 0
	//Version 1:cikyl s preduslovie while
	
	int i;																				 //enter from keyboard
	unsigned long p = 1;												//product of positive numbers
	cout << "\n Enter different numbers until pressing 0:";
	cin >> i;																			//pyrwoto chislo e izvyn cikyla
	while (i != 0)																	//dokato i e razlichno ot 0
	{
		if (i > 0) p *= i;
		cin >> i;																//vsqko sledvasto chislo se chete v cikyla
	}
	cout << "\n Product=" << p << endl;
	system("pause");
}

// Version 2:
	//operator break w cikyl prekratqva dejstvieto mu
	int i;
	unsigned long p=1;
	cout << "\n Enter different numbers until 0:";
	while(true)																							//endless loop
	{
	cin>>i;																				//vsqko chislo se chete v cikyla
	if(i==0)break;
	if(i>0)p*=i;
	}
	cout<<"\n Product = "<<p<<endl;
	system("pause");
	}

	//Version 3:

	int i;
	unsigned long p=1;

	while (cout << "\n Enter different numbers until 0:",cin >> i, i != 0) 
		if (i > 0)p *= i;
																//operator "," izpylnqva posledovatelno operatorite,
																		//kato posledniq opredelq logikata na izraza
	cout<<"\n Product = "<<p<<endl;
	system("pause");
	}

	// Calculate function f(x)=x^4+2.x^3-13.x^2+8.x
	//for x in interval(0.5 - 2.5)step 0.1
	//str54/zad 5.3
	float x,f;
	cout.setf(ios::fixed |ios::showpoint);
	cout<<"\n x \t f(x) \n";										//title of table
	for(x=0.5; x<=2.5; x+=0.1)
	{
	f=pow(x,4)+2*pow(x,3)-13*pow(x,2)+8*x;
	cout<<setprecision(1)<<setw(4)<<x;
	cout<<setprecision(8)<<setw(14)<<f<<endl;
	}
	system("pause");
	}

	// Create menu to use math functions
	//str56/zad5.6
	int ch;
	float a;
	do{
	cout<<"\n Enter argument:";
	cin>>a;
	cout<<"\n Math Functions";
	cout<<"\n 1. Ln";
	cout<<"\n 2. Lg";
	cout<<"\n 3. exp";
	cout<<"\n 4. sqrt";
	cout<<"\n 5. exit";
		do{		cout<<"\n Your choice is:";
					cin>>ch;
				}	while(ch<1 || ch>5);
	switch(ch)
		{
	case 1: cout<<"\n ln("<<a<<")="<<log(a)<<endl;break;
	case 2: cout<<"\n lg("<<a<<")="<<log10(a)<<endl;break;
	case 3: cout<<"\n exp("<<a<<")="<<exp(a)<<endl;break;
	case 4: cout<<"\n sqrt("<<a<<")="<<sqrt(a)<<endl;
		}
	}while(ch!=5);
	}


//str56/zad 5.6
//Kaskadno menu - Menu i podmenu za izbor na math funkcii

		int choice;
		char ch;
		double a,v;
		do {
			cout << "\n Enter argument a="; cin >> a;
			cout << "\n \t Menu";
			cout << "\n 1.ln()";
			cout << "\n 2.lg()";
			cout << "\n 3.exp()";
			cout << "\n 4.sqrt()";
			cout << "\n 5.root3()";
			cout << "\n 6.trigonometric functions";
			cout << "\n 7.Exit";

			do {
				cout << "\n Your choice is:";
				cin >> choice;
			} while (choice < 1 || choice>7);

			switch (choice)
			{
			case 1:cout << "\n ln(" << a << ")=" << log(a);break;
			case 2:cout << "\n lg(" << a << ")=" << log10(a);break;
			case 3:cout << "\n exp(" << a << ")=" << exp(a);break;
			case 4:cout << "\n sqrt(" << a << ")=" << sqrt(a);break;
			case 5:v=root3(a);cout<<"\n root3("<<a<<")="<< v << endl;break;
			case 6: do {
				cout << "\n Enter argument (rad):"; cin >> a;
				cout << "\n trigonometric functions";
				cout << "\n a)	sin()";
				cout << "\n b)	cos()";
				cout << "\n c)	tg()";
				cout << "\n d)	cotg()";
				cout << "\n e)	go back";
				do {
					cout << "\n Choice:";cin >> ch;
					} while (ch < 'a' || ch>'e');

				switch (ch)
				{
				case 'a':cout << "\n sin(" << a << ")=" << sin(a);break;
				case 'b':cout << "\n cos(" << a << ")=" << cos(a);break;
				case 'c':cout << "\n tg(" << a << ")=" << tan(a);break;
				case 'd':cout << "\n cotg(" << a << ")=" << 1 / tan(a);break;
				case 'e':cout << "\n Back to menu";
				}							//inner switch
			} while (ch != 'e');
			}								//outern switch

		} while (choice != 7);	
	}										//main()


	//Funkciq za root3(x)

	double root3(double x)
{
double V0, V1;
	if (x >= 1)
		V1 = x / 3.;
	else
		V1 = x;
	do {
		V0 = V1;
		if (V0 == 0) V1 = 0;
		else
			V1 = V0 + (1. / 3.) * (x / pow(V0, 2) - V0);
	} while (fabs(V1 - V0) > 0.00001);
	return V1;
	}
	
	//str59/zad 5.10 
	//Systavete sobstvena funkciq, koqto izchislqva koren 3-ti ot x
	//Polzvajte iteracionna formula: Vi= Vi-1 + (1/3)(x/(Vi-1)^2 - Vi-1),
	//kydeto Vi e novoto priblijenie, a Vi-1 e predhodnoto
	//Uslovie za kraj e postigane na tochnost (10) na stepen (-5)
	//Tova e absoljutnata stojnost na razlikata na dve posledovatelni priblijeniq
	//Nachalno priblijenie: V(x)=x/3, ako x>=1
	//					i	V(x)=x, ako x<1

	//Tablica na koren 3 ot chisla [-10,10]
		double V0, V1, x;
		cout.setf(ios::fixed | ios::showpoint);
		cout << "\n Koren 3-ti ot:\n";
		for (x = -10;x <= 10;x++)
		{
			if (x >= 1)
				V1 = x / 3.;
			else
				V1 = x;
			do {
				V0 = V1;
				if (V0 == 0) V1 = 0;
				else
					V1 = V0 + (1. / 3.) * (x / pow(V0, 2) - V0);
			} while (fabs(V1 - V0) > 0.00001);
			cout << "\n Koren 3-ti ot:"<<setprecision(1) << setw(5) << x << "=" << setprecision(8) << setw(14) << V1 << endl;
		}


	
	// Generate random number by rand() in <cstdlib> and guess the number
	//function time() is from <ctime> for initialization of rand()
	//str58/zad5.9
	int br = 0;																						//broj opiti
	long rando, guess;													//generirano chislo i chisloto za otgatvane
	srand(time(NULL));															//initialization  of rand()
																				//rand() generira cqlo chislo ot 0 do 32768
	rando = rand() % 100 + 1;								//normalizaciq ot 1 do 100
	cout << "Enter number between 1 and 100:";
						do {
		cin >> guess;
		br++;
		if (rando > guess)
			cout << "up" << endl;
		else if (rando < guess)
			cout << "down" << endl;
		else
			cout << "\n  You guessed:" << rando<< "\t attempts: " << br << endl;
						} while (rando != guess);
						system("pause");
}


//str72/zad6.8
//Poznajte dumata kato vyvejdate bukvi
	char duma[] = "C++";
	char word[] = "+++";
	int i, count = 0;		char ch;
							do {
		cout << "\n Guess the word:";
		cout << endl << word << endl;
		cout << "\n Enter character:";
		cin >> ch;
		for (i = 0;i < strlen(duma);i++)				//strlen() opredelq dyljinata na niza
			if (ch == duma[i])			word[i] = ch;
		count++;
							} while (strcmp(word, duma));		//strcmp() sravnqva dvata niza
	cout << "/n You guess:"<< word << "\t number of attempt:" << count << endl;
}

//rabota s ednomeren masiv bez funkcii

#include<iostream>
using namespace std;
void main()
{
	int A[10],B[10],i,k=0,S=0,Sr=0,min,max,temp;
	//wywejdane na masiv
	cout<<"\n Enter A[10]:\n";
	for(i=0;i<10;i++)
	{cout<<"\n A["<<i+1<<"]=";
	cin>>A[i];
	}
	//suma ot elementite na masiv
	for(i=0;i<10;i++)
		S+=A[i];
	cout<<"\n S="<<S<<endl;
	//sredno-aritmetichno ot masiv
	Sr=S/10;
	cout<<"\n Sredno-aritm e ="<<Sr<<endl;
	//max element w masiv
	max=A[0];
	for(i=1;i<10;i++)
		if(A[i]>max) max=A[i];
	cout<<"\n max element e = "<<max<<endl;
	//min element w masiv
	min=A[0];
	for(i=1;i<10;i++)
		if(A[i]<min) min=A[i];
	cout<<"\n min element e = "<<min<<endl;
	//prehvyrlqne na chetnite w B
	for(i=0;i<10;i++)
	if(A[i]%2==0)
	{B[k]=A[i];k++;}
	//izvejdane na masivi A i B
	cout<<"\n Masiv A \n";
	for(i=0;i<10;i++)
	cout<<A[i]<<"\t";
	if(k!=0)
	{
	cout<<"\n Masiv B \n";
	for(i=0;i<k;i++)
	cout<<B[i]<<"\t";
	}
	else
		cout<<"\n Nqma chetni chisla";
}


//za 4
//ednomeren masiv A s proizvolen razmer bez funkcii
//da se vyvede i da se kopira v nov masiv B
//da se sortira namaljasto
//da se namerjat kratnite na 3 i da se zapishat v nov masiv
//broi na chetnite chisla
//max sred otricatelnite chisla


#include<iostream>
using namespace std;
int main()
{
	int n,A[100],i,B[100],k=0,D[100],m=0,max=0,br=0,temp;
	//wywejdane na masiv
	do{
		cout<<"\n Size of array:";
		cin>>n;
		}
	while(n<1 || n>100);

	cout<<"\n Enter A:\n";
	for(i=0;i<n;i++)
	{cout<<"\n A["<<i+1<<"]=";
	cin>>A[i];
	}
	//copy A[] to B[]
	for(i=0;i<n;i++)
		B[i]=A[i];
	//sort B[] descending
	for(i=0;i<n-1;i++)
		for(k=i+1;k<n;k++)
			if(B[i]<B[k])
			{temp=B[i]; B[i]=B[k];B[k]=temp;}
			//print sorted B[]
			system("cls");
			cout<<"\n Sort descending\n";
		for(i=0;i<n;i++)	
			cout<<B[i]<<"\t";
		//move divisible by 3 in new array D[]
		for(i=0;i<n;i++)
			if(A[i]%3==0)
			{D[m]=A[i];m++;}
			//print array D[]
			cout<<"\n Divisible by 3 numbers"<<endl;
			if(m!=0)
			for(i=0;i<m;i++)
			cout<<D[i]<<"\t";
			cout<<"\n Number of even numbers\n";
			for(i=0;i<n;i++)
				if(A[i]%2==0) br++;
			cout<<br<<endl;
			// max negative number
			for(i=0;i<n;i++)
				if(A[i]<0) max=A[i];
			if(max)
				for(i=0;i<n;i++)
					if(A[i]<0 && max<A[i])
						max=A[i];
			cout<<"\n Max negative number:"<<max<<endl;
}


//vyvejdane na funkcii

#include<iostream>
using namespace std;
int menu();
int input();
int sort();
int krat3();
int even();
int max_neg();
//globalni promenlivi
int n,A[100],i,B[100],k=0,D[100],m=0,max=0,br=0,temp;

int main()
{	int ch;
	n=input();
	do{
	ch=menu();
	switch(ch)
	{	case 1:sort();break;
		case 2:krat3();break;
		case 3:even();break;
		case 4:max_neg();
	}
	}while(ch!=5);
}

int menu()
{	int ch;
	cout<<"\n \t Menu";
	cout<<"\n 1.Sort array descending";
	cout<<"\n 2.Move divisible by 3 to new array";
	cout<<"\n 3.Number of even numbers";
	cout<<"\n 4.Max negative number";
	cout<<"\n 5. Exit";
	do{
		cout<<"\n Your choice is:"; cin>>ch;
		}while(ch<1||ch>5);
	return ch;
}

int input()
{
	//wywejdane na masiv
	do{
		cout<<"\n Size of array:";
		cin>>n;
		}
	while(n<1 || n>100);

	cout<<"\n Enter A:\n";
	for(i=0;i<n;i++)
	{cout<<"\n A["<<i+1<<"]=";
	cin>>A[i];
	}
	return n;
}

int sort()
{
	//copy A[] to B[]
	for(i=0;i<n;i++)
		B[i]=A[i];
	//sort B[] descending
	for(i=0;i<n-1;i++)
		for(k=i+1;k<n;k++)
			if(B[i]<B[k])
			{temp=B[i]; B[i]=B[k];B[k]=temp;}
			//print sorted B[]
			system("cls");
			cout<<"\n Sort descending\n";
		for(i=0;i<n;i++)	
			cout<<B[i]<<"\t";
		return 0;
}

int krat3()
{
		//move divisible by 3 in new array D[]
		for(i=0;i<n;i++)
			if(A[i]%3==0)
			{D[m]=A[i];m++;}
		//print array D[]
			cout<<"\n Divisible by 3 numbers"<<endl;
			if(m!=0)
			for(i=0;i<m;i++)
			cout<<D[i]<<"\t";
			return 0;
}

int even()
{
	cout<<"\n Number of even numbers\n";
			for(i=0;i<n;i++)
				if(A[i]%2==0) br++;
			cout<<br<<endl;
			return 0;
}

int max_neg()
{
// max negative number
			for(i=0;i<n;i++)
				if(A[i]<0) max=A[i];
			if(max)
				for(i=0;i<n;i++)
					if(A[i]<0 && max<A[i])
						max=A[i];
			cout<<"\n Max negative number:"<<max<<endl;
			return 0;
}


	