//3 зад.
//Дадено:  Квадрат  ABCD (фиг.1), определен с :
//Дължина на страната а=200 ; т.М(250,350)
//T.M разделя  диагонала АС в съотношение  АМ:МС=1:3
//1. Да се начертае.
//2. Да се завърти  фигурата на 45 градуса спрямо пресечната точка на диагоналите без да се показва  движението.
//3. Да се мащабира завъртяната фигура спрямо  пресечната точка на диагоналите с коефициенти  Sx=1.7, Sy=0.8

#include <iostream>
#include <graphics.h>
#include <dos.h>
#include <math.h>

using namespace std;

int main()
{
    int winwidth = 800, winheight = 600;
    initwindow(winwidth,winheight);
    int a = 200, mx = 250, my = 350;

    int ax = mx - 50;
    int ay = my + 50;
    int bx = ax + a;
    int by = ay;
    int cx = ax + a;
    int cy = ay - a;
    int dx = ax;
    int dy = ay - a;

    int Ox = 300, Oy = 300;
    rectangle(dx, dy, bx, by);
    delay(500);

    double Sx = 1.7, Sy = 0.8;

    int axm = Ox + (ax - Ox );
    int aym = Oy + (ay - Oy);

    int cxm = Ox + (cx - Ox );
    int cym = Oy + (cy - Oy);

    int dxm = Ox + (dx-Ox );
    int dym = Oy + (dy-Oy);
    int bxm = Ox + (bx-Ox );
    int bym = Oy + (by-Oy);

    int axr =Ox + (axm - Ox)*cos(45*M_PI/180) - (aym - Oy)*sin(45*M_PI/180);
    int ayr = Oy + (axm - Ox)*sin(45*M_PI/180) + (aym - Oy)*cos(45*M_PI/180);

    int bxr = Ox + (bxm - Ox)*cos(45*M_PI/180) - (bym - Oy)*sin(45*M_PI/180);
    int byr = Oy + (bxm - Ox)*sin(45*M_PI/180) + (bym - Oy)*cos(45*M_PI/180);

    int cxr = Ox + (cxm - Ox)*cos(45*M_PI/180) - (cym - Oy)*sin(45*M_PI/180);
    int cyr =Oy + (cxm - Ox)*sin(45*M_PI/180) + (cym - Oy)*cos(45*M_PI/180);

    int dxr = Ox + (dxm - Ox)*cos(45*M_PI/180) - (dym -Oy)*sin(45*M_PI/180);
    int dyr = Oy + (dxm - Ox)*sin(45*M_PI/180) + (dym - Oy)*cos(45*M_PI/180);

    moveto(axr,ayr);
	lineto(bxr, byr);
	lineto(cxr,cyr);
	lineto(dxr,dyr);
	lineto(axr,ayr);
	delay(400);

    axr = Ox + ((axm - Ox)*cos(45*M_PI/180) - (aym - Oy)*sin(45*M_PI/180))*Sx;
	ayr = Oy + ((axm - Ox)*sin(45*M_PI/180) + (aym - Oy)*cos(45*M_PI/180))*Sy;
    bxr = Ox + ((bxm - Ox)*cos(45*M_PI/180) - (bym - Oy)*sin(45*M_PI/180))*Sx;
	byr = Oy + ((bxm - Ox)*sin(45*M_PI/180) + (bym - Oy)*cos(45*M_PI/180))*Sy;
	cxr = Ox + ((cxm - Ox)*cos(45*M_PI/180) - (cym - Oy)*sin(45*M_PI/180))*Sx;
    cyr = Oy + ((cxm - Ox)*sin(45*M_PI/180) + (cym - Oy)*cos(45*M_PI/180))*Sy;
    dxr = Ox + ((dxm - Ox)*cos(45*M_PI/180) - (dym - Oy)*sin(45*M_PI/180))*Sx;
    dyr = Oy + ((dxm - Ox)*sin(45*M_PI/180) + (dym - Oy)*cos(45*M_PI/180))*Sy;


    moveto(axr,ayr);
    lineto(bxr, byr);
    lineto(cxr,cyr);
    lineto(dxr,dyr);
    lineto(axr,ayr);

    getch();
    return 0;
}
