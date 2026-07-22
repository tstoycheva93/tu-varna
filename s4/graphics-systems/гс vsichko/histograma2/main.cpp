#include <iostream>
#include <graphics.h>

using namespace std;

int main()
{
    float a[] = {2,3,5,6,4,1};
    float x0 = 100;
    float y0 = 450;
    float Px = 600, Py = 400;
    float D = 50, Ds = 40, Dc = 30;
    int width = 800;
    int height = 600;
    initwindow(width,height);
    line(x0,y0,x0+Px,y0);
    line(x0,y0,x0,y0-Py);

    float amin=a[0], amax=a[0];
    float x1,x2,y1,y2;
    int n = sizeof(a)/sizeof(a[0]);
    for(int i =1;i < n;i++)
    {
        if(a[i] > amax)
        {
            amax = a[i];
        }
        if (a[i] < amin)
        {
            amin = a[i];
        }
    }
    if(amax < 0)
    {
        amax=0;
    }
    if(amin > 0)
    {
        amin = 0;
    }

    float s = (amax-amin)/Px;
    int y0n=y0 + amin/s;

    for(int i =1;i<=n;i++)
    {
        x1 = x0+i*(Ds + Dc) - Dc;
        y1 = y0 - (a[i-1] - amin)/s;
        x2 = x0+ i*(Ds+Dc);
        y2 = y0;
        setfillstyle(1,i+3);
        bar(x1,y1,x2,y2);
    }

    line(x0,y0,x0+P,y0);
    line(x0,y0,x0,y0 - n*(Ds+Dc));

    I = Px/D - 1;

    settextjustify(1,2);
    for(int i = 0; i < I; i++)  {
        line(x0+i*D,y0,x0+i*D,y0 +10);
        value = amin + (i*D*S);
        gcvt(value,5,num);
        outtextxy(x0+i*D,y0+10,num);
    }
    getch();
    return 0;
}
