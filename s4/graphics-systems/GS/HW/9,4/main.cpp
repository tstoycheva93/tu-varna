//4 зад.
//Дадено:  Правоъгълник  ABCD (фиг.1), определен с :
//Координатите на  т.М(250,350), т.N(400,240)
//т.M разделя  диагонала АС в съотношение  АМ:МС=1:3
//т.N  разделя страната ВС в съотношение  СN:NB=1:4
//1. Да се начертае.
//2. Да се завърти  фигурата на 45 градуса спрямо т.K (500,320) без да се показва  движението.
//3. Да се мащабира завъртяната фигура спрямо  т.K с коефициенти  Sx=1.7, Sy=0.8


#include <iostream>
#include <graphics.h>
#include <dos.h>
#include <math.h>

using namespace std;

int main()
{
    int winwidth = 1000, winheight = 1000;
    initwindow(winwidth,winheight);
    int nx = 400, ny = 240, mx = 250, my = 350;
    int kx = 500, ky = 320;

    int ax = mx - 50;
    int ay = my + 50;
    int bx = nx;
    int by = ay;
    int cx = nx;
    int cy = by - ny;
    int dx = ax;
    int dy = cy;

    int Sx = 1.7, Sy = 0.8;

    rectangle(dx, dy, bx, by);
    delay(500);
    cleardevice();

    int axm = kx + (ax - kx);
    int aym = ky + (ay - ky);

    int cxm = kx + (cx - kx);
    int cym = ky + (cy - ky);

    int dxm = kx+ (dx-kx);
    int dym = ky+ (dy-ky);
    int bxm = kx+ (bx-kx);
    int bym = ky+ (by-ky);

    int axr = kx + (axm - kx)*cos(45*M_PI/180) - (aym - ky)*sin(45*M_PI/180);
    int ayr = ky + (axm - kx)*sin(45*M_PI/180) + (aym - ky)*cos(45*M_PI/180);

    int bxr = kx + (bxm - kx)*cos(45*M_PI/180) - (bym - ky)*sin(45*M_PI/180);
    int byr = ky + (bxm - kx)*sin(45*M_PI/180) + (bym - ky)*cos(45*M_PI/180);

    int cxr = kx + (cxm - kx)*cos(45*M_PI/180) - (cym - ky)*sin(45*M_PI/180);
    int cyr = ky + (cxm - kx)*sin(45*M_PI/180) + (cym - ky)*cos(45*M_PI/180);

    int dxr = kx + (dxm - kx)*cos(45*M_PI/180) - (dym - ky)*sin(45*M_PI/180);
    int dyr = ky + (dxm - kx)*sin(45*M_PI/180) + (dym - ky)*cos(45*M_PI/180);

    setcolor(15);
    moveto(axr,ayr);
    lineto(dxr,dyr);
    lineto(cxr,cyr);
    lineto(bxr,byr);
    lineto(axr,ayr);
    delay(100);

    axr = kx + ((axm - kx)*cos(45*M_PI/180) - (aym - ky)*sin(45*M_PI/180))*Sx;
    ayr = ky + ((axm - kx)*sin(45*M_PI/180) + (aym - ky)*cos(45*M_PI/180))*Sy;

    bxr = kx + ((bxm - kx)*cos(45*M_PI/180) - (bym - ky)*sin(45*M_PI/180))*Sx;
    byr = ky + ((bxm - kx)*sin(45*M_PI/180) + (bym - ky)*cos(45*M_PI/180))*Sy;

    cxr = kx + ((cxm - kx)*cos(45*M_PI/180) - (cym - ky)*sin(45*M_PI/180))*Sx;
    cyr = ky + ((cxm - kx)*sin(45*M_PI/180) + (cym - ky)*cos(45*M_PI/180))*Sy;

    dxr = kx + ((dxm - kx)*cos(45*M_PI/180) - (dym - ky)*sin(45*M_PI/180))*Sx;
    dyr = ky + ((dxm - kx)*sin(45*M_PI/180) + (dym - ky)*cos(45*M_PI/180))*Sy;

    rectangle(axr, ayr, cxr, cyr);

    getch();
    return 0;
}
