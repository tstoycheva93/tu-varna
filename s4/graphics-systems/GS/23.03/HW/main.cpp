#include <iostream>
#include <graphics.h>
#include <cmath>

using namespace std;

int main()
{
    int x0 = 200;
    int y0 = 600;
    int px = 600;
    int py = 400;
    int dx = 60;
    int dy = 50;
    int n = 150;
    int n2 = 150;

    float xmin1 = -3.14;
    float xmax1 = 3.14;
    float xmin2 = -3.14;
    float xmax2 = 3.14;


    float deltax1 = (xmax1-xmin1)/(n-1);
    float deltax2 = (xmax2-xmin2)/(n2-1);

    float x1[n];
    float y1[n];
    float x2[n2];
    float y2[n2];

    for(int i = 0; i<n; i++)
    {
        x1[i] = xmin1 +i*deltax1;
        y1[i] = sin(x1[i]);
    }

    for(int i = 0; i<n2; i++)
    {
        x2[i] = xmin2 +i*deltax2;
        y2[i] = cos(x2[i]);
    }

    float ymin1 = y1[0];
    for(int i = 0; i<n ;i++)
    {
        if(y1[i]<ymin1)
        {
            ymin1=y1[i];
        }
    }

    float ymax1 = y1[0];
    for(int i = 0; i<n;i++)
    {
        if(y1[i]>ymax1)
        {
            ymax1=y1[i];
        }
    }


    float ymin2 = y2[0];
    for(int i = 0; i<n2 ;i++)
    {
        if(y2[i]<ymin2)
        {
            ymin2=y2[i];
        }
    }

    float ymax2 = y2[0];
    for(int i = 0; i<n2;i++)
    {
        if(y2[i]>ymax2)
        {
            ymax2=y2[i];
        }
    }

    float xmax = xmax1;
    if (xmax2>xmax1)
    {xmax=xmax2;}

    float xmin = xmin1;
    if (xmin2<xmin1)
    {xmin=xmin2;}

    float ymax = ymax1;
    if (ymax2>ymax1)
    {ymax=ymax2;}

    float ymin = ymin1;
    if (ymin2<ymin1)
    {ymin=ymin2;}

    float sx = (xmax-xmin)/px;
    float sy = (ymax-ymin)/py;

    int xpr = x0;
    int ypr = y0;

    if (xmin<0)
    {
        xpr = x0 +((0-xmin)/sx);
    }
    if (ymin<0)
    {
        ypr = y0 -((0-ymin)/sy);
    }

    initwindow(1000,800);

    line(x0,ypr,x0+px,ypr);
    line(xpr,y0,xpr,y0-py);

    int divx = px/dx;
    int divy = py/dy;

    char text[10];
    for(int i = 0;i<=divx;i++)
    {
        line(x0+i*dx,ypr,x0+i*dx,ypr+6);
        gcvt(xmin+i*dx*sx,3.2,text);
        settextjustify(1,2);
        outtextxy(x0+i*dx,ypr+6,text);
    }

    for(int i = 0;i<=divy;i++)
    {
        line(xpr,y0-i*dy,xpr-6,y0-i*dy);
        gcvt(ymin+i*dy*sy,3.2,text);
        settextjustify(2,1);
        outtextxy(xpr-6,y0-i*dy,text);
    }

   for(int i = 0 ; i < n; i ++)
   {
       setcolor(BLUE);
       int xpr=x0 + (x1[i]-xmin1)/sx;
       int ypr=y0 - (y1[i]-ymin1)/sy;
       circle(xpr,ypr,2);
   }

   for(int i = 0; i < n-1; i++)
   {
       setcolor(RED);
	   int xa = x0 + (x1[i] - xmin1)/sx;
	   int ya = y0 - (y1[i] - ymin1)/sy;
	   int xb = x0 + (x1[i+1] - xmin1)/sx;
	   int yb = y0 - (y1[i+1] - ymin1)/sy;
	   line(xa, ya, xb, yb);
   }

   for(int i = 0 ; i < n; i ++)
   {
       setcolor(GREEN);
       int xpr=x0 + (x2[i]-xmin1)/sx;
       int ypr=y0 - (y2[i]-ymin1)/sy;
       circle(xpr,ypr,2);
   }

   for(int i = 0; i < n-1; i++)
   {
     setcolor(YELLOW);
	 int xa = x0 + (x2[i] - xmin1)/sx;
	 int ya = y0 - (y2[i] - ymin1)/sy;
	 int xb = x0 + (x2[i+1] - xmin1)/sx;
	 int yb = y0 - (y2[i+1] - ymin1)/sy;
	 line(xa, ya, xb, yb);
   }

    getch();
    return 0;
}
