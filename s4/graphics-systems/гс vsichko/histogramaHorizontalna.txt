#include <iostream>
#include <graphics.h>
using namespace std;

int main()
{
    initwindow(800,600);

    float A[6] = {3.14 , 5.67 ,32.4 ,23.4, 12.4, 4.5};
    char charr[6][10] =
    {
        {'H', 'O', 'M', 'E'},
        {'F','O','O','D'}
    };
    float Amax, Amin,S;
    int P, D , DS, DC, x0, y0, n;
    P=500;
    D = 40;
    DS = 40;
    DC = 50;
    x0 = 50;
    y0 = 550;
    n = 6;

    Amax = Amin = A[0];

    for(int j = 0; j<n ; j++)
    {
        if(Amin > A[j])
        {
            Amin = A[j];
        }
        if(Amax < A[j])
        {
            Amax = A[j];
        }
    }

    if(Amin > 0)
    {
        Amin = 0;
    }

    if(Amax < 0)
    {
        Amax = 0;
    }

    S = (Amax - Amin) / P;

    for(int j = 0; j<n ; j++)
    {
        int x1 = x0;
        int y1 = y0 - (j+1)*(DS + DC);

        int x2 = x0 + (A[j] -Amin)/S;
        int y2 = y0 -(j+1)*(DS + DC )+ DC;

        setfillstyle(1, j+2);
        bar(x1,y1,x2,y2);

    }

    getch();

}
