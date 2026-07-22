#include <iostream>
#include <graphics.h>
using namespace std;

int main()
{
    int R = 50;
    int xr = 60;
    int yr = 50;

    initwindow(500,400);

    for(int i = xr; i < 200; i++)
    {
        delay(15);
        setcolor(BLACK);
        circle(xr+ i - 1,yr ,R);
        setcolor(WHITE);
        circle(xr+ i,yr ,R);
    }

    xr = xr + 200;
    int yf = yr -R;
    int xf = xr;
    float Sy = 1.2;

    for(int i = 1; i < 8; i++)
    {
        delay(15);
        //setcolor(BLACK);
        setcolor(WHITE);

        int yr = yf + (yr -yf)*Sy;

        R = R*1.2;
        yr=yf+R;
        circle(xr,yr ,R);
        //setcolor(WHITE);
        //circle(xr+ i,yr ,R);
    }

    getch();
    return 0;
}
