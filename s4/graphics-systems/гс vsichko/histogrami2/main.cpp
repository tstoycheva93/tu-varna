#include <iostream>
#include <graphics.h>

using namespace std;

int main()
{
    float a[] = {2,-3,5,-6,4,1};
    int n = 6;
    int P = 600;
    int D = 40;
    int Ds = 40;
    int Dc = 50;
    int x0 = 150;
    int y0 = 550;
    int width = 800;
    int height = 600;
    initwindow(width,height);

    float value = 0;

    float amin=a[0], amax=a[0];
    float x1,x2,y1,y2;
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

    char num[10];
    float s = (amax-amin)/P;
    float y0n = y0+amin/s;

    for(int i = 1;i <=n;i++) {
        x1 = x0 + i*(Ds +Dc) - Dc;
        y1 = y0n - (a[i-1])/s;
        x2 = x0 + i*(Ds+Dc);
        y2 = y0n;
        setfillstyle(1,i+3);
        bar(x1,y1,x2,y2);
    }

    line(x0,y0, x0,y0-P);
    line(x0,y0n,x0+n*(Ds+Dc),y0n);

    float I = P/D - 1;

     settextjustify(2,1);
    for(int i = 0; i < I; i++)  {
        line(x0,y0 - i*D,x0-5,y0 - i*D);
        value = amin + (i*D*s);
        gcvt(value,5,num);
        outtextxy(x0-10,y0-i*D,num);
    }

    getch();
    return 0;
}
