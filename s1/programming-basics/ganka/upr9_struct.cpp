//Syzdajte masiw ot sluviteli na firma (MAX=100)
//Za wseki slujitel wywedete imena,EGN i godini staj
//Wywedete danni za opredelen broj slujiteli i izwedete spisyka im
//Sortirajte dannite po godini staj i izwedete sortiraniq spisyk
//Tyrsete slujitel po EGN

#include<iostream>
using namespace std;
//office - employees with names, ID numbers and years of probation in office
struct office
{
	char name[30];
	unsigned long int egn;
	int years;
};
//prototipi
office input();
void order(office* pf[], int n);
void output(office* pf[], int n);
void search(office firm[], int n);

void main()
{
	int i, n;	//n is current size
	office firm[100], * pf[100];

	do {
		cout << "\n How many employees(max 100):";
		cin >> n;
	} while (n < 1 || n>100);

	cout << "\n Enter info about employees:";
	for (i = 0;i < n;i++)
	{
		firm[i] = input();
		pf[i] = &firm[i];
	}
		cout << "\n List of employees \n";
		output(pf, n);
		system("pause");
		cout << "\n Order on years of probation \n";
		order(pf, n);
		output(pf, n);
		system("pause");
		search(firm, n);
}

office input()
{
	office a;
	cin.ignore();
	cout << "\n Names:";
	cin.getline(a.name, 30);
	cout << "\n EGN:";
	cin >> a.egn;
	cout << "\n Years of probation:";
	cin >> a.years;
	return(a);
}

void order(office* pf[], int n)
{
	office* work;	//rabotna promenliwa -ukazatel
	int i,f = 1;	//flag e wdignat
	while (f != 0)
	{
		f = 0;
		for (i = 0;i < n - 1;i++)
			if (pf[i]->years > pf[i + 1]->years)
			{
				work = pf[i];
				pf[i] = pf[i + 1];
				pf[i + 1] = work;
				f = 1;
			}
	}
}

void output(office* pf[], int n)
{

	for (int i = 0;i < n;i++)
	{
cout << "\n Names:" << pf[i]->name<< "\t EGN:" << pf[i]->egn<<"\t Years:" << pf[i]->years;
		cout << endl;
	}
}

void search(office firm[], int n)
{
	int i,f=0;
	long id;
	cout << "\n Search on EGN:";
	cin >> id;
	for (i = 0;i < n;i++)
		if (firm[i].egn == id)
		{
			cout << "\n Found employee: " << firm[i].name << "\t years: " << firm[i].years << endl;
			f = 1;
		}
	if (f == 0)cout << "\n Employee not found";
}


#include<iostream>
#include<string>
#include<cstring>
using namespace std;
//office - employees with names, ID numbers and years in probation
//1. Enter size and array full with employees
//2. Print them on the screen
//3. Sort them on years of probation
//4. Search employee by EGN
//5. Search by name
//6. Sort by name ascending
struct office
{
	string name;
	string egn;
	int years;
};
//prototipi
int menu();
office input();
void order(office* pf[], int n);
void output(office* pf[], int n);
void search(office firm[], int n);
void search_name(office firm[], int n);
void order_names(office* pf[], int n);

int main()
{
	int i, n, choice;
	office firm[100], * pf[100];

	do {
		cout << "\n How many employees(max 100):";
		cin >> n;
	} while (n < 1 || n>100);

	cout << "\n Enter info about employees:";
	for (i = 0;i < n;i++)
	{
		firm[i] = input();
		pf[i] = &firm[i];
	}

	do {
		choice = menu();
		switch (choice)
		{
		case 1:
			cout << "\n List of employees \n";
			output(pf, n);break;
		case 2:
			order(pf, n);
			cout << "\n Sort by probation \n";
			output(pf, n);break;
		case 3:
			cout << "\n Search by ID number \n";
			search(firm, n);break;
		case 4:cout << "\n Search by names \n";
			search_name(firm, n);break;
		case 5:order_names(pf, n);
			output(pf, n);
		}
	} while (choice != 6);
}

office input()
{
	office a;
	cin.ignore();
	cout << "\n Names:";
	getline(cin,a.name);
	cout << "\n EGN:";
	getline(cin, a.egn);
	cout << "\n Years:";
	cin >> a.years;
	return(a);
}

void order(office* pf[], int n)
{
	office* work;
	int i, f = 1;
	while (f != 0)
	{
		f = 0;
		for (i = 0;i < n - 1;i++)
			if (pf[i]->years > pf[i + 1]->years)
			{
				work = pf[i];
				pf[i] = pf[i + 1];
				pf[i + 1] = work;
				f = 1;
			}
	}
}

void output(office* pf[], int n)
{
	int i;
	for (i = 0;i < n;i++)
	{
		cout << "\n Names:" << pf[i]->name;
		cout << "\t EGN:" << pf[i]->egn;
		cout << "\t Years:" << pf[i]->years;
		cout << endl;
	}
}

void search(office firm[], int n)
{
	int i, fl = 0;
	string id;
	cin.ignore();
	cout << "\n Search on EGN:";
	getline(cin, id);
	for (i = 0;i < n;i++)
		if (!id.compare(firm[i].egn))
		{
			cout << "\n Found employee:  " << firm[i].name << "\t years: " << firm[i].years << endl;
			fl = 1;
		}
	if (fl == 0)cout << "\n Not found employee\n";
}

int menu()
{
	int ch;
	cout << "\n Menu";
	cout << "\n 1.Print list of employees on the screen";
	cout << "\n 2.Sort them by probation";
	cout << "\n 3.Search by EGN";
	cout << "\n 4.Search by names";
	cout << "\n 5.Sort them by name";
	cout << "\n 6.Exit";
	do {
		cout << "\n Your choice is:";
		cin >> ch;
	} while (ch < 1 || ch>6);
	return ch;
}

void search_name(office firm[], int n)
{
	int i, fl = 0;
	string names;
	cin.ignore();
	cout<<"\n Name:";
	getline(cin, names);
	for (i = 0;i < n;i++)
		if (!names.compare(firm[i].name))	//if comparing gives 0 - equal
		{
			cout << "\n EGN:" << firm[i].egn << "\t years: " << firm[i].years << endl;
			fl = 1;
		}
	if (fl == 0)cout << "\n Not found employee\n";
}

void order_names(office* pf[], int n)
{
	office* work;
	int i, f = 1;
	while (f != 0)
	{
		f = 0;
		for (i = 0;i < n - 1;i++)
			if (pf[i]->name.compare(pf[i + 1]->name)>0)
			{
				work = pf[i];
				pf[i] = pf[i + 1];
				pf[i + 1] = work;
				f = 1;
			}
	}
}