//					Funkcii, koito vrystat edin rezultat chrez imeto si (po stojnost)
//														Zaglavie na funkciqta:
//			tip na rezultata					Ime na funkciqta (spisyk s formalni parametri)
//					{					tqlo na funkciqta
//										definirane na lokalni promenlivi;
//										izpylnimi operatori;
//										return(promenliva ot tipa na funkciqta);
//					}
//		Ako funkciqta e ot tip void - ne vrysta rezultati
//		Funkciqta se izvikva s:									ime(spisyk fakticheski parametri);
//		Formalnite i fakticheski parametri se syglasuvat po broj, tip i poziciq w spisyka

//Izwedete pozdrav po vyveden nomer chrez funkciq, koqto ne vrysta rezultat (void)

#include<iostream>
using namespace std;
void show(int num)
{		switch (num)
	{
	case 1:cout << "\n Happy birthday\n";break;
	case 2:cout << "\n Happy New Year\n";break;
	case 3:cout << "\n Marry Christmas\n";break;
	default: cout << "\n Congratulations\n";
	}	}					
int main()
{	int pn;
do{
	cout << "\n Enter congratulations number:";
	cin >> pn;
	show(pn);									//pn e fakticheski parametyr
}while(pn!=0);
}



//Chrez funkciq preobrazuvajte gradusi Farenhait w gradusi po Celsius 
//vrysta 1 rezultat (float)
#include<iostream>
using namespace std;

float temp(float gradf)
{		return(5.0 / 9.0 * (gradf - 32));		}
int main()
{	float f;
	for(f=-200;f<=200;f+=20)
		cout << f << "  grad Far   = " << temp(f) << "  grad Cel\n";
	system("pause");
}



//chrez funkciq preobrazuvajte malkite bukvi ot latinskata azbuka v glavni bukvi
//ostanalite simvoli ne se preobrazuvat
#include<iostream>
using namespace std;
int upper(char c)
{
	char r;  
	if (c >= 'a' && c <= 'z')			//dali e malka latinska bukva
		r = c - 'a' + 'A';
	else
		r = c;									// ako ne e malka bukva
	return r;
}
int main()
{
	char a,b;
	cout << "\n Enter character (exit - Enter):";
	do {
		cin >> a;
		b=upper(a);
		cout << a << "  ->	" << b<< endl;
		}	while(a!='\n');
}


//Chrez funkcii i menju syzdajte programa, 
//koqto izchislqwa  lice na figuri po izbor:
//prawoygylnik, kwadrat, triygylnik, kryg

#include<iostream>
#include<cmath>
using namespace std;

float tri(float a, float b, float c)
	{		float pp, p, s; 
		if (a > 0 && b > 0 && c > 0 && a + b > c && b + c > a && c + a > b)
			{		p = a + b + c;
					pp = p / 2.0;
					s = sqrt(pp * (pp - a) * (pp - b) * (pp - c));
					return s;
			}
		else
		{	cout << a << "," << b << "," << c << "  are not sides of triangle" << endl;
			return 0;
		}	}
	}	
float prav(float a, float b)
{
	if(a>0 && b>0)
	return a*b;
	else 
		return 0;
}
float kwad(float a)
{
	if (a>0)
	return a*a;
	else 
		return 0;
}
float circle(float a)
{
	const float Pi=3.141592;
	if(a<0)return 0;
	else
	return pow(a,2)*Pi;
}

int main()
{
	int choice;
	float a, b, c;
	do {
		cout << "\n \t Menu";
		cout << "\n 1. Rectangle";
		cout << "\n 2. Square";
		cout << "\n 3. Triangle";
		cout << "\n 4. Circle";
		cout << "\n 5. Exit";
			do {
				cout << "\n Your choice:";
				cin >> choice;
				} while (choice < 1 || choice>5);
			switch (choice)
			{
			case 1:cout << "\n Sides of rectangle a, b=";
						cin >> a >> b;
						cout << "\n Area:" << prav(a, b);break;
			case 2:cout << "\n Side of square a=";
						cin >> a;
						cout << "\n Area:" << kwad(a);break;
			case 3:cout << "\n Sides of triangle a,b,c=";
						cin >> a >> b >> c;
						cout << "\n Area:" << tri(a,b,c);break;
			case 4:cout << "\n Radius:";cin >> a;
						cout << "\n Area:" << circle(a);break;
			}
	} while (choice!=5);
}



//str59/zad 5.10 
//Systavete sobstvena funkciq, koqto izchislqva koren 3-ti ot x i q dobavete kym kalkulatora
//Polzvajte iteracionna formula: Vi= Vi-1 + (1/3)(x/(Vi-1)^2 - Vi-1),
//kydeto Vi e novoto priblijenie, a Vi-1 e predhodnoto
//Uslovie za kraj e postigane na tochnost (10) na stepen (-5)
//Tova e absoljutnata stojnost na razlikata na dve posledovatelni priblijeniq
//Nachalno priblijenie: V(x)=x/3, ako x>=1
//					i	V(x)=x, ako x<1
#include<iostream>
#include<iomanip>
#include<cmath>
using namespace std;
int main()
{
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
		cout <<setprecision(1)<<setw(5)<< x << "=" <<setprecision(8)<<setw(14)<< V1 << endl;
	}

}



// ukazateli - promenliva, chiqto stojnost e adres ot pametta
//prisvoqvane na ukazateli, operacii adresirane - &, izvlichane na stojnost - *

#include<iostream>
using namespace std;
int main()
{
	int a, b, * pa, * pb;					//def. na 2 ukazatelq
	a = 5;
	pa = &a;					//pa sochi kym a - izvlicha adresa na a - adresirane
	pb = pa;					//dvata ukazatelq sochat kym a - prisvoqvane na ukazateli
	b = *pb;					//b vzema sydyrjanieto na kletkata
	cout<<"\n b=" << b << endl;			// b e ravno na 5
	*pb = 10;						//sydyrjanieto na pb stava 10
	cout << "\n a="<<a << "\t b=" << b << endl;			//10		 5
	pb = &b;					//pb sochi b
	*pb = 100;	//sydyrjanieto na kletkata stava 100
	cout << "\n a=" << a << "\t b=" << b << endl;//10 100
}


//primer za opredelqne razmera na masiv, inicializiran s nqkakvi stojnosti
#include<iostream>
using namespace std;
int main()
{
	float x[] = {1,2,3,4,5,6,7,8,9,10};
	int n;
	n = sizeof(x) / sizeof(float);//sizeof() e funkciq koqto vrysta broj baitove
	cout << "\n Broj elementi:" << n << endl;
}


//masivi i ukazateli 
#include<iostream>
using namespace std;
int main()
{
	char x[] = "In vino veritas";
	char* px;
	int y[4] = { 8,-3,4,2 };
	int* py, i;
	px = x;								//x e const ukazatel kym nachaloto na masiv
	cout << px;						//izvejda stringa
	cout << endl;
	px = &x[8];						//vzema adresa na 8-ta bukva -v
	*px = 'f';						//promenq sydyrjanieto na -f
	px = &x[0];					//px se pozicionira v nachaloto na stringa
	cout << px;					//izvejda stringa
	cout << endl;
	for (py = y;  py < y + 4;  ++py)			//py sochi kym masiva y i go razlistva
		*py *= *py;								//chislata se vdigat na kvadrat
	for (i = 0, py = y;  i < 4;  ++i, ++py)
		cout << *py<<"\t";					//izvejda kvadratite na chislata
}

#include<iostream>
using namespace std;
int main()
{
int y[4] = { 8,-3,4,2 };
int* py, i;
//kvadrati na chislata na masiva y
for (i = 0;i < 4;++i)
	y[i] *= y[i];
//izvejdane na ekran
for (i = 0;i < 4;++i)
	cout << y[i] << "\t";
//kvadrati na kvadratite na chislata na masiva chrez ukazateli
for (py = y;py < y + 4;++py)
	*py *= *py;
//izvejdane na ekran
	py = y;
for (i = 0;i < 4;++i)
	{
	cout<< *py<<"\t";
		++py;
	}
}


//Funkcii, koito vrystat 2, 3 i poveche rezultata s ukazateli
//Syzdajte funkciq, koqto po vyveden radius izchislqva perimetyr i lice na kryg
#include<iostream>
#include<cmath>
using namespace std;

//nqma retyrn i zatova e void
//v spisyka s formalni parametri r e vhodna danna,
// c , s - sa za da vyrne rezultati perimetyr i lice na kryg
void circle(float r, float* c, float* s);
int main()
{
	//lice i perimeter na kryg
	float a, b, c;
	cout << "\n Enter radius:";
	cin >> a;
	circle(a, &b, &c);//na adresa na b i c ce poluchavat rezultatite
	cout << "\n Perimeter of circle:" << b << endl;
	cout << "\n Area of circle:" << c << endl;
}
void circle(float r, float* c, float* s)
{		const float PI=3.141592;
	//*c , *s - e pamet kydeto se slagat rezultatite
	*c =r* 2 * PI ;
	*s = pow(r,2)*PI;
}

#include<iostream>
#include<cmath>
using namespace std;
//chrez funkciq otdelete znaka, cqlata i drobna chast na zadadeno realno chislo
void split(float a, char* s, int* w, float* f);	//prototip

int main()
{
	float x, fx;
	int wx;
	char sx;
	cout << "\n Enter real number x=";
	cin >> x;
	split(x, &sx, &wx, &fx);
	cout << "\n Sign of x:" << sx << endl;
	cout << "\n Whole number x:" << wx << endl;
	cout << "\n Float part of x:" << fx << endl;
}
void split(float a, char* s, int* w, float* f)
{
	float absvalue;
	if (a > 0) *s = '+';
	else if (a < 0)  *s = '-';
	else *s = '  ';
	absvalue = fabs(a);			//absoljutna stojnost na a
	*w = floor(absvalue);		//zakryglqva kum po-malkoto cqlo chislo
	*f = absvalue - (*w);		//maha cqloto i ostava drobnata chast
}

//Hibridna funkciq - vrysta rezultati i po stojnost i po adres (s ukazateli)
//Chrez funkciq po zadadeni 3 strani izchislete perimetyr i lice na triygylnik
//Whod: 3 celi chisla - strani na triygylnik
//Izhod: S na triygylnika i P na triygylnik
#include<iostream>
#include<cmath>
#define PI 3.141592;
using namespace std;
int tri(float a, float b, float c, float *s,float *p);	//prototip
int main()
{
	float x, y, z, st, pt;
	int ret;
	cout << "\n Enter 3 sides of triangle:";
	cin >> x >> y >> z;
	ret = tri(x, y, z, &st, &pt);
	if (ret) cout << "\n Lice:" << st << "\n Perimeter:" << pt << endl;
	else
		cout << x << "," << y << "," << z << "\t aren't sides of triangle\n";
}

int tri(float a, float b, float c, float* s, float* p)
{
	int k; //uslovie za systestvuvane na triygylnik (lokalna promenliva)
	float pp; //poluperimeter
	k = (a > 0 && b > 0 && c > 0 && a + b > c && b + c > a && c + a > b);//logicheski izraz
	if (k)
	{
		*p = a + b + c;
		pp = *p / 2.0;
		*s = sqrt(pp * (pp - a) * (pp - b) * (pp - c));//Formula na Heron
	}
	return k;
}

#include<iostream>
using namespace std;
//podredete stojnostite na 3 promenlivi ot tip float v narastvast red
void order3(float* p, float* q, float* r);
void order2(float* a, float* b);
int main()
{
	float x, y, z;
	cout << "\n Enter 3 real numbers:";
	cin >> x >> y >> z;
	order3(&x, &y, &z);
	cout << "\n Ordered values:\n";
	cout<< x << "\t" << y << "\t" << z << endl;
}

void order2(float* a, float* b)
{
	float temp;
	if(*a > *b)
	{
		temp = *a;
		*a = *b;
		*b = temp;
	}
}

void order3(float* p, float* q, float* r)
{
	order2(p, q);
	order2(q, r);
	order2(p, q);
}
