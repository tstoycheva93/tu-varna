//7 зад.
//Дадено:  Правоъгълник  ABCD (фиг.2), определен с :
//т.К(390,460), АВ=240, ВС=160
//т.M разделя  диагонала АС в съотношение  АМ:МС=1:3
//т. К разделя отсечката ВО в съотношение  BK:KO =1:3
//1. Да се начертае.
//2. Да се завърти  фигурата на 15 градуса спрямо т.M .
//3. Да се мащабира завъртяната фигура спрямо  т.М  с коефициенти  Sx=1.5, Sy=0.5

#include <iostream>
#include <graphics.h>
#include <dos.h>
#include <math.h>

using namespace std;

int main()
{
    int winwidth = 800, winheight = 600;
    initwindow(winwidth,winheight);

    int kx = 390, ky = 460;
    int ab = 240;
    int bc = 160;

    int ax = 170;//bx-ab
    int ay = 490;
    int bx = 410;
    int by = 490;
    int cx = bx;
    int cy = by - bc;
    int dx = ax;
    int dy = cy;
    int mx = ax + 60;
    int my = ay - 40;

    rectangle(dx, dy, bx, by);
    delay(500);
    cleardevice();

    int axm = mx + (ax - mx);
    int aym = my + (ay - my);

    int cxm = mx + (cx - mx);
    int cym = my + (cy - my);

    int dxm = mx + (dx - mx);
    int dym = my + (dy - my);

    int bxm = mx + (bx - mx);
    int bym = my + (by - my);


    for(int i = 1; i<= 15; i+=15){
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
        lineto(cxr,cyr);
        lineto(bxr,byr);
        lineto(axr,ayr);
        lineto(dxr,dyr);

    }

    int Sx = 1.5, Sy = 0.5;

    int axr = mx + ((axm - mx)*cos(15*M_PI/180) - (aym - my)*sin(15*M_PI/180))*Sx;
    int ayr = my + ((axm - mx)*sin(15*M_PI/180) + (aym - my)*cos(15*M_PI/180))*Sy;

    int bxr = mx + ((bxm - mx)*cos(15*M_PI/180) - (bym - my)*sin(15*M_PI/180))*Sx;
    int byr = my + ((bxm - mx)*sin(15*M_PI/180) + (bym - my)*cos(15*M_PI/180))*Sy;

    int cxr = mx + ((cxm - mx)*cos(15*M_PI/180) - (cym - my)*sin(15*M_PI/180))*Sx;
    int cyr = my + ((cxm - mx)*sin(15*M_PI/180) + (cym - my)*cos(15*M_PI/180))*Sy;

    int dxr = mx + ((dxm - mx)*cos(15*M_PI/180) - (dym - my)*sin(15*M_PI/180))*Sx;
    int dyr = my + ((dxm - mx)*sin(15*M_PI/180) + (dym - my)*cos(15*M_PI/180))*Sy;

    rectangle(axr,ayr,cxr,cyr);
    delay(50);

    getch();
    return 0;
}
