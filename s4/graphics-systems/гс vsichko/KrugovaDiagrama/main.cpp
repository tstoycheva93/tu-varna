#include <iostream>
#include <graphics.h>
#include <math.h>
using namespace std;

int main()
{
    int n = 7;
    float a[7]= {11.5, 55,67.3, 78, 32.7, 45.6, 34};
    int rx = 100, ry = 50, d = 25;
    int ox = 300,oy = 250;
    //int xi = 0, yi = 0, xnew,ynew;
    //char str[10];
    //float stangle = 0, endangle =0, suma = 0;
    float alfan = 0, alfak =0, suma = 0;

    float gama;
    for(int i = 0; i<n; i++)
        {
            suma += a[i];
        }
    initwindow(600,800);
    for(int j = 0; j <d ; j++)
    {
        //stangle = 0;
        for(int i = 0; i<n; i++)
        {
            gama = (a[i]/suma) * 360;
            alfak = alfan + gama;
            setcolor(i+1);
            setfillstyle(1,i+9);

            float beta = (alfan + gama/2)/180 * 3.14;
            sector(ox + 0.2 * rx * cos(beta), oy - 0.2 * ry * sin(beta) - j, alfan, alfak, 200, 100);
            //sector(ox, oy - j, alfan, alfak, 200, 100);
            alfan = alfak;
        }
    }
    getch();
}
