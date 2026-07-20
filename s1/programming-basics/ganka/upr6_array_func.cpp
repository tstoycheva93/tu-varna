//Tema 6: Masivi-str.64
#include<iostream>
using namespace std;
int main()
{
	//kolko otlichni ocenki ima v masiva
 int ocenki[10], br6=0;
	for (int i=0; i<10; i++)
	{ cout<<"\n ocenka["<<i+1<<"]="; 
	cin>>ocenki[i];
	}
	for (int i=0; i<10; i++)
		if(ocenki[i]==6) br6++;
	cout<<"\n Number excellents:"<<br6<<endl;
}
	

//str.66/zad.6.1
//Vyvedete masiv A[10] - polojitelni celi chisla
// prebrojte i prehvyrlete chetnite i nechetnite elementi v novi masivi B[] i C[]
#include<iostream>
using namespace std;
	int main()
	{
	unsigned int A[10], B[10], C[10];		//masiv za chetni - B, za nechetni C
	int m=0,k=0,temp,i;								//m -indekc za masiva B, k - za masiva C
	for(i=0; i<10; i++)
	{	cout<<"\n Enter positive numbers in A["<<i+1<<"]=";
		cin>>temp;
		while(temp<=0)
		{
			cout<<"\n Only positive, please:";
			cin>>temp;
		}
		A[i]=temp;
		if(A[i]%2==0)										//chetno
		{B[m]=A[i]; m++;}								//chetnite se zapisvat v B na poziciq m
		else
		{C[k]=A[i]; k++;}								//nechetnite se zapisvat v C na poziciq k
	}			//kraj na for
	if(m!=0)
	{
		cout<<"\n Even numbers: "<<m<<"\n";
		for(i=0; i<m; i++)
			cout<<B[i]<<"\t";
	}
	else
		cout<<"\n No even numbers \n";

	if(k!=0)
	{
		cout<<"\n Odd numbers: "<<k<<" \n";
		for (i=0; i<k; i++)
			cout<<C[i]<<"\t";
	}
	else
		cout<<"\n No odd numbers \n";
		}
	
	//Chrez funkcii
	//vyvedete masiv A[10] i go razdelete na chetni i nechetni elementi , 
	//syhraneni v masivi B[] i C[]
	#include<iostream>
	using namespace std;

	int input(int A[])
	{		int i,n;
	do{	cout<<"\n Size of array:";
			cin>>n;
		}
		while(n<1||n>10);
			for(i=0; i<n; i++)
		{		cout<<"\n Enter numbers in A["<<i+1<<"]=";
				cin>>A[i];
		}	
			return n;
	}		


	void odd_even(int n,int A[],int B[],int C[],int *pm,int *pk)
	{
	int m=0,k=0,i;		
	for(i=0;i<n;i++)
	if(A[i]%2==0)											//chetno
		{B[m]=A[i]; m++;}								//chetnite se zapisvat v B na poziciq m
		else
		{C[k]=A[i]; k++;}								//nechetnite se zapisvat v C na poziciq k
		*pm=m;		*pk=k;								//m i k se vrystat po adres v izvikvastata funkcia
		}

	void output(int N,int A[],int m,int B[],int k,int C[],int D[])
	{		int i;
			cout<<"\n MasivA\n";
			for(i=0;i<N;i++)
			cout<<A[i]<<"\t";
	cout<<"\n Odd/even numbers\n";														
	if(m!=0)
	{
		cout<<"\n Even numbers: "<<m<<"\n";
		for(i=0; i<m; i++)
			cout<<B[i]<<"\t";
	}
	else
		cout<<"\n No even numbers \n";
	if(k!=0)
	{
		cout<<"\n Odd numbers: "<<k<<" \n";
		for (i=0; i<k; i++)
			cout<<C[i]<<"\t";
	}
	else
		cout<<"\n No odd numbers \n";
	cout<<"\n Sort ascending\n";
	for(i=0;i<N;i++)
		cout<<D[i]<<"\t";
	}

	int main()
	{
	 int N,A[10],B[10],C[10],D[10];
		int m,k;
		N=input(A);
		odd_even(N,A,B,C,&m,&k);
		sort(N,A,D);
		output(N,A,m,B,k,C,D);
		
	}
	


//Ot menu se izbirat funkcii za:
//obrystane, sortirane i tyrsene na kratni chisla v masiv	A[]
//poslednata funkciq izvejda vsichki masivi i rezultati
#include<iostream>
using namespace std;

int input(int A[]);
void reverse(int n, int A[],int B[]);
void sort(int n, int A[],int C[]);
int divisible(int n, int A[],int D[]);
void output(int n,int A[],int B[],int C[],int k,int D[]);

int main()
{
	int A[100],B[100],C[100],D[100], k=0,n = 0;
	int ch;
	cout << "\n Input array A[]\n";
	n=input(A);
	do {
		cout << "\n \t Menu";
		cout << "\n 1. Reverse array";
		cout << "\n 2. Sort ascending";
		cout << "\n 3. Search divisible by";
		cout<<"\n 4. Results";
		cout << "\n 5. Exit";
			do {
			cout << "\n Your choice is (1-5):";
			cin >> ch;
				} while (ch < 1 || ch>5);
		switch (ch)
		{
		case 1: reverse(n, A,B);break;
		case 2: sort(n, A,C);break;
		case 3: k=divisible(n, A,D);break;
		case 4: output(n,A,B,C,k,D);break;
		}
	} while (ch != 5);
}

int input(int A[])
{		int n;
		do {
		cout << "\n Size of array:";
		cin >> n;
				} while (n < 1 || n>100);
	for (int i = 0; i < n; i++)
		{		cout << "\n A[" << i + 1 << "]=";
				cin >> A[i];
		}
	return n;
}


void reverse(int n, int A[], int B[])
{	int z=0;
	cout << "\n Reverse array \n";
	for (int i = n - 1; i >= 0; i--)
	{	B[z]=A[i];	z++;	}
}
void sort(int n, int A[],int C[])
{	int temp, i, k;
	for (i = 0; i < n; i++)
		C[i]=A[i];
	for (i = 0; i < n - 1; i++)
		for (k = i + 1; k < n; k++)
			if (C[i] > C[k])
			{	temp = C[i]; C[i] = C[k]; C[k] = temp;}
}
int divisible(int n, int A[], int D[])
{
	int kratno, i,k=0;
	cout << "\n Divisible by:";
	cin >> kratno;
	for (i = 0; i < n; i++)
		if (A[i] % kratno == 0)
		{D[k]=A[i];k++;}
		return k;
}
void output(int n,int A[],int B[],int C[],int k,int D[])
{int i;
cout<<"\n Original array A[]\n";
for(i=0;i<n;i++)
	cout<<A[i]<<"\t";
cout<<"\n Reversed array B[]\n";
for(i=0;i<n;i++)
	cout<<B[i]<<"\t";
cout<<"\n Sorted array C[]\n";
for(i=0;i<n;i++)
	cout<<C[i]<<"\t";
cout<<"\n Array D[]-divisible\n";
for(i=0;i<k;i++)
	cout<<D[i]<<"\t";
}