//str 68/zad 6.3
//Dadena e kwadratna matrica A[5,5]. Da se preobrazuwa w nowa matrica B[5,5] po prawiloto:
//ako pone edin element w posledniq red na A e otricatelen, to po glawniq diagonal na B
//da se postawi 1, inache A i B sa identìchni; 
//da se izwedat w tablichna forma c komentari 2-te matrici;
/*
#include<iostream>
using namespace std;
int main()
{
	int A[5][5], B[5][5];//dwumerni masivi
	int i, k;	//indeksi za red i kolona
	cout << "\n Enter natrix A[5,5] and copy to matrix B[5,5]\n";
	for (i = 0;i < 5;i++)
		for (k = 0;k < 5;k++)
		{
			cout << "\n A[" << i + 1 << "][" << k + 1 << "]=";
			cin >> A[i][k];	//wywejda element ot A
			B[i][k] = A[i][k];
		}

	bool flag = false;
	for (k = 0;k < 5;k++)
		if (A[4][k] < 0)flag = true;

	if (flag)	//ima pone edin otricatelen element
		for (i = 0;i < 5;i++)
			B[i][i] = 1;

	//Print matrix A and B to the screen
	cout << "\n Matrix A\n\n";
	for (i = 0;i < 5;i++)
	{
		for (k = 0;k < 5;k++)
			cout << A[i][k] << "\t";
		cout << endl;
	}
	cout << "\n Matrix B\n";
	for (i = 0;i < 5;i++)
	{
		for (k = 0;k < 5;k++)
			cout << B[i][k] << "\t";
		cout << endl;
	}
}
*/
//Chrez funkcii prerabotete prednata zadacha:
//1.wywevdane na dwumeren masiv s proizwolni razmeri(kwadratna matrica);
//2.preobrazuwane na masiwa w now po prawiloto:
//ako pone edin element w posledniq red na A e otricatelen, to po diagonala na B
//da se postawi 1, inache A i B sa identìchni;
//3.izwevdane na dwata masiva w tablichen wid s komentari;

#include<iostream>
using namespace std;

void enter_matrix(int* r, int* k, int *pa, int *pb)
{
	int i, j;
	do {
		cout << "\n Square matrix only:";
		cout << "\n Number of rows:";
		cin >> *r;
		cout << "\n Number of columns:";
		cin >> *k;
	} while (*r != *k);
	cout << "\n Enter natrix A \n";
	for (i = 0;i < *r;i++)
		for (j = 0;j < *k;j++,pa++)
		{
			cout << "\n A[" << i + 1 << "][" << j + 1 << "]=";
			cin >> *pa;		//input element of A
			*pb = *pa;		//copy element to B
			pb++;			//move pointer to new element
		}
}

void print_matrix(int r, int k, int *pa, int *pb)
{
	int i, j;
	cout << "\n Matrix A\n";
	for (i = 0;i < r;i++)
	{
		for (j = 0;j < k;j++,pa++)
			cout << *pa << "\t";
		cout << endl;
	}
	cout << "\n Matrix B\n";
	for (i = 0;i < r;i++)
	{
		for (j = 0;j < k;j++,pb++)
			cout <<*pb << "\t";
		cout << endl;
	}
}

void last_row(int r, int k, int *pa, int *pb)
{
	int i, j;
	bool flag = false;

	for (j = 0;j < k;j++,pa++)
		if ( *pa< 0)flag = true;

	if (flag)
		for (i = 0;i < r;i++)
		{
			for (j = 0;j < k;j++,pb++)
				if (i == j)*pb = 1;
		}
}

int main()
{
	int A[10][10], B[10][10];
	int row, col;
	enter_matrix(&row, &col, &A[0][0], &B[0][0]);
	cout << "\n Initially B=A";
	print_matrix(row, col, &A[0][0], &B[0][0]);
	last_row(row, col, &A[row][0], &B[0][0]);
	cout << "\n Matrix B have 1-s on main diagonal if in A there is negative in last row";
	print_matrix(row, col, &A[0][0], &B[0][0]);
}
*/
//Zadacha 2: Dadena e matrica s proizvolni razmeri.
//Chrez funkcii da se wywede i izwede matricata;
//Chrez funkciq da se namerqt min elementi po redowe;
/*
#include<iostream>
using namespace std;

void enter_matrix(int* r, int* k, int* pa)
{
	int i, j;
	do {
		cout << "\n Number of rows:";
		cin >> *r;
	} while (*r < 1 || *r>10);
	do {
		cout << "\n Number of columns:";
		cin >> *k;
	} while (*k < 1 || *k>10);
	cout << "\n Enter natrix A \n";
	for (i = 0;i < *r;i++)
		for (j = 0;j < *k;j++, pa++)
		{
			cout << "\n A[" << i + 1 << "][" << j + 1 << "]=";
			cin >> *pa;
		}
}

void print_matrix(int r, int k, int* pa, int* min)
{
	int i, j;
	cout << "\n Matrix A\n";
	for (i = 0;i < r;i++,min++)
	{
		for (j = 0;j < k;j++, pa++)
			cout << *pa << "\t";
		cout << "\t"<<*min<<endl;
	}
}

void min_row(int r, int k, int *pa, int *min)
{
	int i, j;
		for (i = 0;i < r;i++,min++)
	{
			*min = *pa;pa++;
		for (j = 1;j < k;j++, pa++)
			if (*min > * pa)*min = *pa;
	}
}

int main()
{
	int A[10][10], M[10];
	int row, col;
	enter_matrix(&row, &col, &A[0][0]);
	min_row(row, col, &A[0][0], &M[0]);
	print_matrix(row, col, &A[0][0], &M[0]);
}
*/
//Zadacha 3: Dadena e matrica s proizvolni razmeri.
//Chrez funkcii da se wywede i izwede matricata;
//Chrez funkciq da se namerqt max elementi po koloni;
/*
#include<iostream>
using namespace std;

void enter_matrix(int* r, int* k, int* pa)
{
	int i, j;
	do {
		cout << "\n Number of rows:";
		cin >> *r;
	} while (*r < 1 || *r>10);
	do {
		cout << "\n Number of columns:";
		cin >> *k;
	} while (*k < 1 || *k>10);
	cout << "\n Enter natrix A \n";
	for (i = 0;i < *r;i++)
		for (j = 0;j < *k;j++, pa++)
		{
			cout << "\n A[" << i + 1 << "][" << j + 1 << "]=";
			cin >> *pa;
		}
}

void print_matrix(int r, int k, int* pa, int* max)
{
	int i, j;
	cout << "\n Matrix A\n";
	for (i = 0;i < r;i++)
	{
		for (j = 0;j < k;j++, pa++)
			cout << *pa << "\t";
		cout << endl;
	}
	cout << "\n Max on columns\n";
	for (i = 0;i < k;i++, max++)
		cout << *max << "\t";
	cout << endl;
}

void max_kol(int r, int k, int* pa, int* max)
{
	int i, j;
	//nachalo i kraj na masiva A
	int* BEG,*END;
	BEG = pa;
	END = pa+(r*k-1);

	for (i = 0;i < k;i++, max++)
	{
		*max = *(BEG + i);pa = BEG + i;

		do {
			j = 1;
			pa += j * k;
			if (*max < *pa)*max = *pa;
			j++;
		} while (pa <= END);
	}
}

int main()
{
	int A[10][10], M[10];
	int row, col;
	enter_matrix(&row, &col, &A[0][0]);
	max_kol(row, col, &A[0][0], &M[0]);
	print_matrix(row, col, &A[0][0], &M[0]);
}
*/