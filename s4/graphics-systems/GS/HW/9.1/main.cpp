//1 зад.
//Дадено:  Правоъгълник  ABCD (фиг.1) , определен с : т.В(400,400); т.D(200,200)
//T.M разделя  диагонала АС в съотношение  АМ:МС=1:3
//1. Да се начертае.
//2. Да се мащабира спрямо т.М с коефициенти  Sx=1.7, Sy=0.8
//3. Да се завърти мащабираната фигура на 30 градуса спрямо т. М, като се покаже движението.

#include <iostream>
#include <graphics.h>
#include <dos.h>
#include <math.h>

using namespace std;

int main()
{
    int winwidth = 800, winheight = 600;
    initwindow(winwidth,winheight);
    int bx = 400, by = 400, dx = 200, dy = 200;

    int cx = bx;
    int cy = dy;
    int ax = dx;
    int ay = by;
    int my = ay - 200/4;
    int mx = ax + (cx - dx)/4;

    rectangle(dx, dy, bx, by);
    delay(500);

    double Sx = 1.7, Sy = 0.8;

    int axm = mx + (ax - mx)*Sx;
    int aym = my + (ay - my)*Sy;

    int cxm = mx + (cx - mx)*Sx;
    int cym = my + (cy - my)*Sy;

    int dxm = mx+ (dx-mx)*Sx;
    int dym = my+ (dy-my)*Sy;
    int bxm = mx+ (bx-mx)*Sx;
    int bym = my+ (by-my)*Sy;

    rectangle(dxm, dym, bxm, bym);
    delay(500);
    cleardevice();

    for(int i = 1; i<= 30; i+=1){
        int axr = mx + (axm - mx)*cos(i*M_PI/180) - (aym - my)*sin(i*M_PI/180);
        int ayr = my + (axm - mx)*sin(i*M_PI/180) + (aym - my)*cos(i*M_PI/180);

        int bxr = mx + (bxm - mx)*cos(i*M_PI/180) - (bym - my)*sin(i*M_PI/180);
        int byr = my + (bxm - mx)*sin(i*M_PI/180) + (bym - my)*cos(i*M_PI/180);

        int cxr = mx + (cxm - mx)*cos(i*M_PI/180) - (cym - my)*sin(i*M_PI/180);
        int cyr = my + (cxm - mx)*sin(i*M_PI/180) + (cym - my)*cos(i*M_PI/180);

        int dxr = mx + (dxm - mx)*cos(i*M_PI/180) - (dym - my)*sin(i*M_PI/180);
        int dyr = my + (dxm - mx)*sin(i*M_PI/180) + (dym - my)*cos(i*M_PI/180);

        setcolor(15);
        moveto(dxr,dyr);
        lineto(axr, byr);
        lineto(bxr,byr);
        lineto(cxr,cyr);
        lineto(dxr,dyr);
        delay(40);
    }
    getch();
    return 0;
}
