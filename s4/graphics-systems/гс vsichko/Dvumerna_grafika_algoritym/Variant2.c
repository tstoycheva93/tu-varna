
#include <iostream>
#include <graphics.h>
using namespace std;

float min(float a[], int n)
{
    float min=a[0];
    for(int i=1;i<n;i++)
    if(a[i]<min) min=a[i];
    return min;
}

float max(float a[], int n)
{
    float max=a[0];
    for(int i=1;i<n;i++)
    if(a[i]>max) max=a[i];
    return max;
}


int main()
{


   int n=10;
   float Vhodx[20]={-10.3, -2.5, -3, -5.5, 13, 66.5, -14.3, 29.1, 9.9, 7.45};
   float Vhody[20]={27.34, 101.2, -3.45, 5.22, 8, -17.76, -98.6, 78, -13.3, -60};
   int Px=600;
   int Py=450;
   int x0=50;
   int y0=400;
   int Dx=40;
   int Dy=40;
   float xp, yp;
   float xmin,ymin,xmax,ymax;
   //parametri na prozoreca
   initwindow(Px,Py,"Title");
   //Namirane na x,ymin, x,ymax
   //xmin=min(Vhodx,n);
   //ymin=min(Vhody,n);
   //xmax=max(Vhodx,n);
   //ymax=max(Vhody,n);

   xmin = -2;
   xmax = 22;
   int n = 50;

   float deltax = (xmax - xmin)/(n-1);
   for(int i=0; i<n;i++)
   {
        Vhodx[i] = xmin + i * deltax;
        Vhody[i] = Vhodx[i] * Vhodx[i] + 2*Vhodx[i] -3;
   }

   //Skalarni koeficienti
    //float Sx=(xmax-xmin)/Px;
    //float Sy=(ymax-ymin)/Py;

   //Izchertavane na tochkite
    //for(int i=0;i<n;i++)
    //{
     //   xp=x0+(Vhodx[i]-xmin)/Sx;
     //   yp=y0-(Vhody[i]-ymin)/Sy;
     //   circle(xp,yp,3);
    //}


//Izchertavane na osite
double I=Px/Dx-1, J=Py/Dy -1;

line(x0, y0,x0+Px,y0);
line(x0, y0,x0,y0-Py);

float value;
char num[10];

for(int i=0; i<I;i++)
{
    line(x0+i*Dx,y0,x0+i*Dx, y0+5);
    settextjustify(1,1);
    value = xmin+(i*Dx*Sx);
    num[10];
    gcvt(value,6,num); //prevryshtane na chisloto v masiv ot char, zapazen v num
    outtextxy(x0+i*Dx,y0+20,num);
}

for(int j=0; j<J;j++)
{
    line(x0, y0-(j*Dy), x0-5, y0-(j*Dy));
    settextjustify(1,1);
    value = ymin+(j*Dy*Sy);
    gcvt(value,6,num); //prevryshtane na chisloto v masiv ot char, zapazen v num
    outtextxy(x0-20,y0+j*Dy,num);
}

getch();
    return 0;
}
