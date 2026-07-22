//2 зад.
//Дадено:  Правоъгълник  ABCD (фиг.1), определен с :
//т.В(400,400); т.М(250,350)
//T.M разделя  диагонала АС в съотношение  АМ:МС=1:3
//1. Да се начертае.
//2. Да се завърти  фигурата на 30 градуса спрямо т. А без да се показва  движението.
//3. Да се мащабира завъртяната фигура спрямо т.А с коефициенти  Sx=1.7, Sy=0.8

#include <iostream>
#include <graphics.h>
#include <dos.h>
#include <math.h>

using namespace std;
int main()
{
    int winwidth = 800, winheight = 600;
    initwindow(winwidth,winheight);
    int bx = 400, by = 400, mx = 250, my = 350;

    int ax = mx - 50;
    int ay = my + 50;
    int cx = bx;
    int cy = ay / 2;
    int dy = ax;
    int dx = cy;

    rectangle(dx, dy, bx, by);
    delay(500);

    int axm = ax + (ax - ax);
    int aym = ay + (ay - ay);

    int cxm = ax + (cx - ax);
    int cym = ay + (cy - ay);

    int dxm = ax+ (dx-ax);
    int dym = ay+ (dy-ay);

    int bxm = ax+ (bx-ax);
    int bym = ay+ (by-ay);

    cleardevice();

    int axr = ax + (axm - ax)*cos(30*M_PI/180) - (aym - ay)*sin(30*M_PI/180);
    int ayr = ay + (axm - ax)*sin(30*M_PI/180) + (aym - ay)*cos(30*M_PI/180);

    int bxr = ax + (bxm - ax)*cos(30*M_PI/180) - (bym - ay)*sin(30*M_PI/180);
    int byr = ay + (bxm - ax)*sin(30*M_PI/180) + (bym - ay)*cos(30*M_PI/180);

    int cxr = ax + (cxm - ax)*cos(30*M_PI/180) - (cym - ay)*sin(30*M_PI/180);
    int cyr = ay + (cxm - ax)*sin(30*M_PI/180) + (cym - ay)*cos(30*M_PI/180);

    int dxr = ax + (dxm - ax)*cos(30*M_PI/180) - (dym - ay)*sin(30*M_PI/180);
    int dyr = ay + (dxm - ax)*sin(30*M_PI/180) + (dym - ay)*cos(30*M_PI/180);

    setcolor(15);
    moveto(axr,ayr);
	lineto(bxr, byr);
	lineto(cxr,cyr);
	lineto(dxr,dyr);
	lineto(axr,ayr);
    delay(400);

    double Sx = 1.7, Sy = 0.8;

    axr = ax + ((axm -  ax)*cos(30*M_PI/180) - (aym - ay)*sin(30*M_PI/180))*Sx;
    ayr = ay + ((axm -  ax)*sin(30*M_PI/180) + (aym - ay)*cos(30*M_PI/180))*Sy;

    bxr = ax + ((bxm -  ax)*cos(30*M_PI/180) - (bym - ay)*sin(30*M_PI/180))*Sx;
    byr = ay + ((bxm -  ax)*sin(30*M_PI/180) + (bym - ay)*cos(30*M_PI/180))*Sy;

    cxr = ax + ((cxm -  ax)*cos(30*M_PI/180) - (cym - ay)*sin(30*M_PI/180))*Sx;
    cyr = ay + ((cxm -  ax)*sin(30*M_PI/180) + (cym - ay)*cos(30*M_PI/180))*Sy;

    dxr = ax + ((dxm -  ax)*cos(30*M_PI/180) - (dym - ay)*sin(30*M_PI/180))*Sx;
    dyr = ay + ((dxm -  ax)*sin(30*M_PI/180) + (dym - ay)*cos(30*M_PI/180))*Sy;

    rectangle(dxr, dyr, bxr, byr);

    getch();
    return 0;
}
