//5 зад.
//Дадено:  Правоъгълник  ABCD (фиг.2), определен с :
//т.К(390,460), т.О(300,400)
//т.M разделя  диагонала АС в съотношение  АМ:МС=1:3
//т. К разделя отсечката ВО в съотношение BK:KO=1:3
//1. Да се начертае.
//2. Да се завърти  фигурата на 15 градуса спрямо т.М без да се показва  движението.
//3. Да се мащабира завъртяната фигура спрямо  т.М с коефициенти  Sx=1.2, Sy=1.2

#include <iostream>
#include <graphics.h>
#include <dos.h>
#include <math.h>

using namespace std;

int main()
{
    int winwidth = 1000, winheight = 800;
    initwindow(winwidth,winheight);
    int kx = 390, ky = 460,
    ox = 300, oy = 400;

    int bx = 420;
    int by = 480;
    int cx = bx;
    int cy = 320;
    int ax = 220;
    int ay = by;
    int dx = ax;
    int dy = cy;
    int mx = ax + 40;
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

    int axr = mx + (axm - mx)*cos(15*M_PI/180) - (aym - my)*sin(15*M_PI/180);
    int ayr = my + (axm - mx)*sin(15*M_PI/180) + (aym - my)*cos(15*M_PI/180);

    int bxr = mx + (bxm - mx)*cos(15*M_PI/180) - (bym - my)*sin(15*M_PI/180);
    int byr = my + (bxm - mx)*sin(15*M_PI/180) + (bym - my)*cos(15*M_PI/180);

    int cxr = mx + (cxm - mx)*cos(15*M_PI/180) - (cym - my)*sin(15*M_PI/180);
    int cyr = my + (cxm - mx)*sin(15*M_PI/180) + (cym - my)*cos(15*M_PI/180);

    int dxr = mx + (dxm - mx)*cos(15*M_PI/180) - (dym - my)*sin(15*M_PI/180);
    int dyr = my + (dxm - mx)*sin(15*M_PI/180) + (dym - my)*cos(15*M_PI/180);

    setcolor(15);
    moveto(dxr,dyr);
    lineto(cxr,cyr);
    lineto(bxr,byr);
    lineto(axr,ayr);
    lineto(dxr,dyr);
    delay(400);

    int Sx = 1.2, Sy = 1.2;

    axr = mx + ((axm - mx)*cos(15*M_PI/180) - (aym - my)*sin(15*M_PI/180))*Sx;
    ayr = my + ((axm - mx)*sin(15*M_PI/180) + (aym - my)*cos(15*M_PI/180))*Sy;

    bxr = mx + ((bxm - mx)*cos(15*M_PI/180) - (bym - my)*sin(15*M_PI/180))*Sx;
    byr = my + ((bxm - mx)*sin(15*M_PI/180) + (bym - my)*cos(15*M_PI/180))*Sy;

    cxr = mx + ((cxm - mx)*cos(15*M_PI/180) - (cym - my)*sin(15*M_PI/180))*Sx;
    cyr = my + ((cxm - mx)*sin(15*M_PI/180) + (cym - my)*cos(15*M_PI/180))*Sy;

    dxr = mx + ((dxm - mx)*cos(15*M_PI/180) - (dym - my)*sin(15*M_PI/180))*Sx;
    dyr = my + ((dxm - mx)*sin(15*M_PI/180) + (dym - my)*cos(15*M_PI/180))*Sy;

    rectangle(dxr, dyr, bxr, byr);

    getch();
    return 0;
}
