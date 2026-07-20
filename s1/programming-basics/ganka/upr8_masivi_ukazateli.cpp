//Masivi i ukazateli
//Masivi-inicializaciq, vyvejdane, izvejdane chrez funkcii s ukazateli
//Algoritmi: tyrsene , prehvyrlqne, sortirane na masivi
//Teoriq -Ukazatel kym elementite na masiv
//se definira po systiq nachin kakto kym obekt, 
//chijto tip syvpada s tipa na elementite na masiva.
//Naprimer: float A[10] chrez ukazatel se definira kato: float *pa;
//kojto moje da sochi kym proizvolen element ot masiva: 
//pa=&A[0]; sochi nachaloto na masiva
//Inicializaciq na ukazatelq se izvyrshva taka: pa=&A[0] ili pa=A;
//Opisanie na formalni parametri-masivi se izpolzva edna ot slednite dve formi:
//tip Ime[]; 
//tip *ime_uk;
//Opisanie na fakticheskite parametri-masivi se izpolzva edna ot slednite dve formi:
//Ime - samoto ime na masiva bez skobi ili
//&Ime[k] - adresa na indeksirana promenliva

/*
//Zadacha 1: Crez funkcii, koito obmenqt masivi i vrystat rezultati s ukazateli:
//1.Vyvedete masiv A[10] - polojitelni celi chisla
//2.Prebrojte i prehvyrlete chetnite i nechetnite elementi v novi masivi (B i C)
//	ZADACHA PODHODQSTA ZA KONTROLNO
#include<iostream>
using namespace std;
//prototipi
void input(int dim, unsigned int A[]);
void split(int dim, unsigned int A[], unsigned int B[], unsigned int C[], int* p, int* q);
void output(int dim, unsigned int A[], unsigned int B[], unsigned int C[], int m, int k);

int main()
{
	unsigned int A[10], B[10], C[10];//masiv za chetni - B, za nechetni C
	int m = 0, k = 0;//m -indekc za masiva B, k - index za masiva C
	const int dim = 10;
	//vij facticheskite parametri i sravni s formalnite
	input(dim, A);//popylva A s chisla
	split(dim, A, B, C, &m, &k);//vrysta masivi B i C i tehnite razmeri m i k
	output(dim, A, B, C, m, k);//ne vrysta rezultati
}


void input(int dim, unsigned int A[])
{
	int i, temp;
	for (i = 0; i < dim; i++)
	{
		cout << "\n Enter positive numbers in A[" << i + 1 << "]=";
		cin >> temp;//vremenna promenliva
		while (temp <= 0)	//proverka za neotricatelnost
		{
			cout << "\n Only positive please:";
			cin >> temp;
		}
		A[i] = temp;
	}
}

void split(int dim, unsigned int A[], unsigned int B[], unsigned int C[], int* p, int* q)
{
	int i, m = 0, k = 0;
	for (i = 0;i < dim;i++)
	{
		if (A[i] % 2 == 0)//chetno li e
		{
			B[m] = A[i]; m++;
		}//chetnite se zapisvat v B na poziciq m i m narastva
		else
		{
			C[k] = A[i]; k++;
		}//nechetnite se zapisvat v C na poziciq k i k narastva
		*p = m;*q = k;
	}
}


void output(int dim, unsigned int A[], unsigned int B[], unsigned int C[], int m, int k)
{
	int i;
	cout << "\n Array A\n";
	for (i = 0;i < dim;i++)
		cout << A[i] << "\t";
	if (m != 0)//ima chetni
	{
		cout << "\n Even numbers: " << m << "\n";
		for (i = 0; i < m; i++)
			cout << B[i] << "\t";
	}
	else
		cout << "\n No even numbers \n";

	if (k != 0)
	{
		cout << "\n Odd numbers: " << k << " \n";
		for (i = 0; i < k; i++)
			cout << C[i] << "\t";
	}
	else
		cout << "\n No odd numbers \n";
}



// PODHODQSTA ZA KONTROLNO
//Zadacha 2: Chrez menu i funkcii, koito obmenqt masivi namerete:
//1. Maximalnoto sred otricatelnite elementi v masiva A
//2. Broj na nulevite elementi v masiva A
//3. Proizvedenie ot polojitelnite chisla

#include<iostream>
using namespace std;

int menu()
{
	int choice;
	cout << "\n Menu\n";
	cout << "\n 1. Max among negatives";
	cout << "\n 2. Number of 0";
	cout << "\n 3. Product of positive elements";
	cout << "\n 4. Exit";
	do {
		cout << "\n Your choice:";
		cin >> choice;
	} while (choice < 1 || choice>4);
	return choice;
}

int input(int A[])
{
	int i, n;
	cout << "\n Enter array A[max 20]:";

	do {
		cout << "\n Size of array:";
		cin >> n;
	} while (n < 1 || n>20);

	for (i = 0; i < n; i++)
	{
		cout << "\n A[" << i + 1 << "]=";
		cin >> A[i];
	}
	return n;//vrysta tekustiq razmer na masiva po stojnost( return)
}

// max of negative elements in A
int max_neg(int n, int A[], int *p)
{
	int i, max = 0, index = 0;
	for (i = 0;i < n;i++)	//proverka dali ima otricatelni chisla
		if (A[i] < 0)
		{
			max = A[i];index = i;break;	//pyrvoto otkrito otric. chislo se vzema za nachalna stojnost na max
		}
	if (max != 0)
		for (i = 0;i < n;i++)
		{
			if (max < A[i] && A[i] < 0)
			{
				max = A[i];index = i;
			}
		}

	else if (max == 0)
		cout << "\n In A no negative numbers\n";
	*p = index;
	return max;
}

//number of 0 - funkciqta vrysta s return broq na 0
int num_0(int n, int A[])
{
	int i,broj = 0;
	for (i = 0;i < n;i++)
		if (A[i] == 0)broj++;
	return broj;
}
//proizvedenie ot + elementi v masiva A - s ukazatel vrysta p
void pr_pos(int n, int *pa, int* p)
{
	for (int i = 0;i < n;i++,pa++)
		if (*pa > 0)
			*p *= *pa;
}

void main()
{
	int A[20], n, ch, max, index, br0,p=1;
	n=input(A);
	do
	{
		ch = menu();
		switch (ch)
		{
		case 1:max=max_neg(n,A,&index);
			cout << "\n Max =" << max << "\t on position " << index + 1 << endl;
			break;
		case 2:br0=num_0(n,A);
			cout << "\n number of 0 in A:" << br0 << endl;
			break;
		case 3:pr_pos(n, &A[0], &p);
			cout << "\n Product of positive elements in A :" << p << endl;
		}
	} while (ch != 4);
}


//LOSH STIL -Globalen Masiv i tekust razmer
//Ot menu se polzvat funkcii za:	
//1.obrystane na masiva obratno
//2.sortirane na masiva vyzhodqsto
//3.tyrsene na kratni chisla na zadadeno chislo

#include<iostream>
using namespace std;

int A[100], n;	//GLOBAL ARRAY A i tekust razmer n

//prototipi na funkcii
void input();		//vyvejda masiv
void reverse();		//reverse
void sort();		//sort ascending (narastvasto)
void divisible();	//tyrsi kratni na zadadeno chislo
int menu();			//menu


int main()
{
	int ch;
	cout << "\n Input array";
	input();
	do {
		ch = menu();
		switch (ch)
		{
		case 1: reverse();break;
		case 2: sort();break;
		case 3: divisible();
		}
	} while (ch != 4);
}

int menu()
{
	int ch;
	cout << "\n \tMenu";
	cout << "\n 1. Reverse array";//obrysta obratno
	cout << "\n 2. Sort ascending";//sortira narastvasto
	cout << "\n 3. Divisible by";//tyrsi kratni na zadadeno chislo
	cout << "\n 4. Exit";
	do {
		cout << "\n Your choice is (1-4):";
		cin >> ch;
	} while (ch < 1 || ch>4);
	return ch;
}

//vyvejdane na masiv
void input()
{
	do {
		cout << "\n Size of array:";
		cin >> n;
	} while (n < 1 || n>100);
	for (int i = 0; i < n; i++)
	{
		cout << "\n A[" << i + 1 << "]=";
		cin >> A[i];
	}
}

//obrystane na masiva
void reverse()
{
	cout << "\n Reverse array \n";
	for (int i = n - 1; i >= 0; i--)
		cout << A[i] << "\t";
}

//sortirane po metoda na mehurchetata (vyzhodqsto)
void sort()
{
	int temp, i, k;
	for (i = 0; i < n - 1; i++)//vynshen cikyl ot 0 do predposledniq element
		for (k = i + 1; k < n; k++)//vytreshen cikyl ot sledvastiq element do posledniq element
			if (A[i] > A[k])
			{
				temp = A[i]; A[i] = A[k]; A[k] = temp;
			}
	cout << "\n Sorted ascending A \n";
	for (i = 0; i < n; i++) cout << A[i] << "\t";
}

void divisible()
{
	int kratno, i;
	cout << "\n Divisible by:";//na kolko da e kratno
	cin >> kratno;
	for (i = 0; i < n; i++)
		if (A[i] % kratno == 0 && A[i] != 0)
			cout << A[i] << "\t";
}

//LOSH STIL-FUNKCIITE NE VRYSTAT REZULTATI i promenqt originalniq masiv A
//Obrabotka na masiv s funkcii:		
//Ot menu se polzvat funkcii za:
//1.obrystane na masiva obratno
//2.sortirane na masiva vyzhodqsto
//3.tyrsene na kratni chisla na zadadeno chislo
#include<iostream>
using namespace std;

int menu();
int input(int A[]);
void reverse(int n, int A[]);
void sort(int n, int A[]);
void divisible(int n, int A[]);

int main()
{
	int A[100], n = 0;//definira masiv i tekust razmer- NE E GLOBALEN
	int ch;	//izbor ot menu
	cout << "\n Input array \n";
	n = input(A);	//funkciqta vrysta 2 rezultata - razmera na masiva - chrez imeto si i masiva s chisla na adres A
	do {
		ch = menu();
		switch (ch)
		{
		case 1: reverse(n, A);break;
		case 2: sort(n, A);break;
		case 3: divisible(n, A);
		}
	} while (ch != 4);
}

int menu()
{
	int ch;
	cout << "\n \t Menu";
	cout << "\n 1. Reverse array";
	cout << "\n 2. Sort ascending";
	cout << "\n 3. Divisible by";
	cout << "\n 4. Exit";
	do {
		cout << "\n Your choice is (1-4):";
		cin >> ch;
	} while (ch < 1 || ch>4);
	return ch;
}

int input(int A[])
{
	int m;
	do {
		cout << "\n Size of array:";
		cin >> m;
	} while (m < 1 || m>100);

	for (int i = 0; i < m; i++)
	{
		cout << "\n A[" << i + 1 << "]=";
		cin >> A[i];
	}
	return m;
}


void reverse(int n, int A[])
{
	cout << "\n Reverse array \n";
	for (int i = n - 1; i >= 0; i--)
		cout << A[i] << "\t";
}

void sort(int n, int A[])
{
	int temp, i, k;
	for (i = 0; i < n - 1; i++)
		for (k = i + 1; k < n; k++)
			if (A[i] > A[k])
			{
				temp = A[i]; A[i] = A[k]; A[k] = temp;
			}
	cout << "\n Sorted ascending A \n";
	for (i = 0; i < n; i++) cout << A[i] << "\t";
}

void divisible(int n, int A[])
{
	int kratno, i;
	cout << "\n Divisible by:";
	cin >> kratno;
	for (i = 0; i < n; i++)
		if (A[i] % kratno == 0 && A[i] != 0)
			cout << A[i] << "\t";
}

//DOBYR STIL - PODHODQSTA ZA KONTROLNO
//Obrabotka na masiv s funkcii, koito vrystat rezultati v main():
//Ot menu se polzvat funkcii za:
//1.obrystane na masiva obratno
//2.sortirane na masiva vyzhodqsto
//3.tyrsene na kratni chisla na zadadeno chislo

#include<iostream>
using namespace std;

int menu();
int input(int A[]);
void reverse(int n, int A[], int B[]);
void sort(int n, int A[], int C[]);
int divisible(int n, int A[], int D[]);

int main()
{
	int A[100], B[100], C[100], D[100], n = 0, l = 0;//definira masivi i tekust razmer za A i D
	int ch;	//izbor ot menu
	cout << "\n Input array \n";
	n = input(A);//funkciqta vrysta 2 rezultata - razmera na masiva -po stojnost i masiva s chisla chrez A
	do {
		ch = menu();
		switch (ch)
		{
		case 1: reverse(n, A, B); for (int i = 0; i < n; i++)cout << B[i] << "\t";break;
		case 2: sort(n, A, C);for (int i = 0; i < n; i++)cout << C[i] << "\t";break;
		case 3: l = divisible(n, A, D);for (int i = 0; i < l; i++)cout << D[i] << "\t";
		}
	} while (ch != 4);
}

int menu()
{
	int ch;
	cout << "\n \t Menu";
	cout << "\n 1. Reverse array";
	cout << "\n 2. Sort ascending";
	cout << "\n 3. Divisible by";
	cout << "\n 4. Exit";
	do {
		cout << "\n Your choice is (1-4):";
		cin >> ch;
	} while (ch < 1 || ch>4);
	return ch;
}

int input(int A[])
{
	int m;
	do {
		cout << "\n Size of array:";
		cin >> m;
	} while (m < 1 || m>100);

	for (int i = 0; i < m; i++)
	{
		cout << "\n A[" << i + 1 << "]=";
		cin >> A[i];
	}
	return m;
}


void reverse(int n, int A[], int B[])
{
	int p = 0;
	cout << "\n Reverse array \n";
	for (int i = n - 1; i >= 0; i--)
	{
		B[p] = A[i];p++;
	}
}

void sort(int n, int A[], int C[])
{
	int temp, i, k;
	for (i = 0; i < n; i++)
		C[i] = A[i];	//kopirame A v C
	cout << "\n Sort ascending\n";
	for (i = 0; i < n - 1; i++)
		for (k = i + 1; k < n; k++)
			if (C[i] > C[k])
			{
				temp = C[i]; C[i] = C[k]; C[k] = temp;
			}
}

int divisible(int n, int A[], int D[])
{
	int kratno, i, k = 0;
	cout << "\n Divisible by:";
	cin >> kratno;
	for (i = 0; i < n; i++)
		if (A[i] % kratno == 0 && A[i] != 0)
		{
			D[k] = A[i], k++;
		}
	return k;
}


//Primer na zadacha s razlichen tip funkcii:
//Vyvedete ednomeren masiv A:
//Ot menu se izvikvat funkcii za:
//1.sortira masiva narastvasto - PO NOV METOD
//2.sortira masiva namalqsto - s dvoen cikyl for
//3.mesti polojitelnite elementi v nov masiv B - NOV STIL s ukazateli za obmqna na masivi
//4.tyrsi pyrvoto chislo kratno na zadadeno chislo - NOV STIL -vrysta ukazatel po stojnost -ukazatelna funkciq
//main() izvejda chislata do pyrvoto kratno s ukazatel
#include <iostream>
using namespace std;
//nqma prototipi zastoto definiciite na funkcii sa predi main()
int menu()
{
	int c;
	cout << "\n\t Menu\n";
	cout << "\n 1.Sort ascending";
	cout << "\n 2.Sort descending";
	cout << "\n 3.Move positive elements";
	cout << "\n 4.Find first devisible by number";
	cout << "\n 5.Numbers in definite interval";
	cout << "\n 6.Exit";
	do {
		cout << "\n Your choice: ";
		cin >> c;
	} while (c < 1 || c>6);
	return c;
}

void bblsort(int n, int A[], int C[])
//sortira narastvashto po nov metod ( s flag) po-byrz
{
	int i, flag, temp;
	for (i = 0;i < n;i++)
		C[i] = A[i];	//kopira A v C
	do
	{
		flag = 0;
		for (i = 0;i < n - 1;i++)
			if (C[i] > C[i + 1])
			{
				temp = C[i];
				C[i] = C[i + 1];
				C[i + 1] = temp;
				flag = 1;
			}
	} while (flag);
}

void input(int* d, int A[])
{
	do {
		cout << "\n Size: ";
		cin >> *d;			//tekust razmer na masiva
	} while (*d < 1 || *d>100);
	cout << "\n Input array: \n";
	for (int i = 0;i < *d;i++)
	{
		cout << "\n A[" << i + 1 << "]=";
		cin >> A[i];
	}
}


void bblsort1(int n, int A[], int C[])
//sortirane namalqsto s dvoen cikul
{
	int i, k, temp;
	for (i = 0;i < n;i++)
		C[i] = A[i];	//kopira A v C

	for (i = 0;i < n - 1;i++)
		for (k = i + 1;k < n;k++)
			if (C[i] < C[k]) {
				temp = C[i];
				C[i] = C[k];
				C[k] = temp;
			}
}


//vmesto imeto na masiva se podava ukazatel, kojto sochi nachaloto mu

void move(int na, int* pa, int* nb, int* pb)
//prehvurlq + elementi v nov masiv i go vrusta chrez ukazatel *pb;
{
	int i; *nb = 0;	//razmer na noviq masiv =0
	for (i = 0;i < na;i++, pa++)
		if (*pa > 0) {
			*pb = *pa;
			pb++;//ukazatelq narastva i sochi kym nova poziciq
			(*nb)++;//stojnostta na broqcha (nb) na noviq masiv narastva s 1
		}
}

//tursene purvoto 4islo kratno na dadeno 4islo i vru6ta adresa mu
int* krat(int n, int* pa, int kr)
{
	for (int i = 0;i < n;i++, pa++)
		if (!(*pa % kr) && *pa != 0)return(pa);
	return(NULL);
}

int interval(int n, int A[], int lowborder, int highborder, int D[])
{
	int k = 0;
	for (int i = 0;i < n;i++)
		if (A[i] > lowborder && A[i] < highborder)
		{
			D[k] = A[i];k++;
		}
	return k;
}

int main()
{
	int A[100], i, n, m, B[100], C[100], D[100], k, kr, ch;
	input(&n, A);
	do {
		ch = menu();
		switch (ch)
		{
		case 1: bblsort(n, A, C);
			cout << "\n Sort descending \n";
			for (i = 0;i < n;i++)
				cout << C[i] << "\t";
			break;
		case 2: bblsort1(n, A, C);
			cout << "\n Sort ascending \n";
			for (i = 0;i < n;i++)
				cout << C[i] << "\t";
			break;
		case 3:
			cout << "\n Positive array \n";
			move(n, A, &m, B);
			if (m)
				for (i = 0;i < m;i++)
					cout << B[i] << "\t";
			else
				cout << "\n No positive numbers \n";
			break;
		case 4:
			cout << "\n Find first multiple number \n";
			do {
				cout << "\n Enter multiple numb 2,3,5,7,9 \n";
				cin >> kr;
			} while (kr < 1);
			int* res, * pa;
			res = krat(n, A, kr);
			if (res) {
				cout << "\n First devisible by " << kr << endl;
				cout << *res << endl;
				cout << "\n numbers till first divisible :\n";
				for (pa = A;pa <= res;pa++)
					cout << *pa << "\t";
			}
			else
				cout << "\n No devisible by" << kr << endl;
			break;
		case 5:int al, ah, temp;
			cout << "\n Numbers in interval:\n";
			cout << "\n Low border:"; cin >> al;
			cout << "\n High border"; cin >> ah;
			if (al > ah) { temp = al;al = ah;ah = temp; }
			k = interval(n, A, al, ah, D);
			for (i = 0;i < k;i++)
				cout << D[i] << "\t";
		}
	} while (ch != 6);
}
*/