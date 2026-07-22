//6 зад.
//Дадено:  Правоъгълник  ABCD (фиг.2), определен с :
//т.К(390,460), т.М(240,440)
//т.M разделя  диагонала АС в съотношение  АМ:МС=1:3
//т. К разделя отсечката ВО в съотношение BK:KO =1:3
//1. Да се начертае.
//2. Да се мащабира фигурата  спрямо  т.О  с коефициенти  Sx=1.4, Sy=1.4
//3. Да се завърти  фигурата на 15 градуса спрямо т.О .

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
    int mx = 240, my = 440;

    int ax = 200;
    int ay = 480;
    int bx = 360;
    int by = 480;
    int cx = 360;
    int cy = 320;
    int dx = 200;
    int dy = 320;
    int ox = 280;
    int oy = 400;

    rectangle(dx, dy, bx, by);
    delay(500);
    cleardevice();

    double Sx = 1.4, Sy = 1.4;

    int axo = ox + (ax - ox)*Sx;
    int ayo = oy + (ay - oy)*Sy;

    int cxo = ox + (cx - ox)*Sx;
    int cyo = oy + (cy - oy)*Sy;

    int dxo = ox+ (dx-ox)*Sx;
    int dyo = oy+ (dy-oy)*Sy;
    int bxo = ox+ (bx-ox)*Sx;
    int byo = oy+ (by-oy)*Sy;

    rectangle(dxo, dyo, bxo, byo);

    for(int i = 1; i<= 15; i+=1){
        int axr = ox + (axo - ox)*cos(i*M_PI/180) - (ayo - oy)*sin(i*M_PI/180);
        int ayr = oy + (axo - ox)*sin(i*M_PI/180) + (ayo - oy)*cos(i*M_PI/180);

        int bxr = ox + (bxo - ox)*cos(i*M_PI/180) - (byo - oy)*sin(i*M_PI/180);
        int byr = oy + (bxo - ox)*sin(i*M_PI/180) + (byo - oy)*cos(i*M_PI/180);

        int cxr = ox + (cxo - ox)*cos(i*M_PI/180) - (cyo - oy)*sin(i*M_PI/180);
        int cyr = oy + (cxo - ox)*sin(i*M_PI/180) + (cyo - oy)*cos(i*M_PI/180);

        int dxr = ox + (dxo - ox)*cos(i*M_PI/180) - (dyo - oy)*sin(i*M_PI/180);
        int dyr = oy + (dyo - ox)*sin(i*M_PI/180) + (dyo - oy)*cos(i*M_PI/180);

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
