#include <iostream>
#include <graphics.h>
#include <algorithm>


using namespace std;

int main()
{
float xmin1 = -15;
float xmax1 = 8;
int n1 = 120;
int i;
double x1[n1];
double y1[n1];
int width=1000,height=800;
int Px=600,Py=400,
Dx=60,Dy=50,
x0=200,y0=600 ;


double xmin2 = -4;
double xmax2 = 10;
int n2=180;
double x2[n2];
double y2[n2];


double xmin;
double xmax;
double ymin;
double ymax;


//изчисляване на стъпката на изменение на входните данни, необходима за получаване на n броя //стойности в масива x
double deltax1 = (xmax1-xmin1) / (n1-1);

//изчисляване на стъпката на изменение на входните данни, необходима за получаване на n2 броя //стойности в масива x2
double deltax2 = (xmax2-xmin2) / (n2-1);


// попълване на входните масиви с изчислените данни
for (i = 0; i < n1; i ++)
{
x1[i] = xmin1 + i * deltax1 ;
y1[i] = x1[i]*x1[i] + 8*x1[i] -10; //y1 = x1^2 + 8*x1 - 10
}


// попълване на входните масиви x2 и y2 с изчислените данни
for (i = 0; i < n2; i ++)
{
x2[i] = xmin2 + i * deltax2 ;
y2[i] = 5*x2[i]*x2[i] - 3*x2[i] +4; //y2 = 5*x2^2 - 3*x2 + 4
}

// намиране на ymin1 и ymax1
double ymin1 = y1[0];
double ymax1 = y1[0];

for(i = 0; i< n1; i++)
{
if(y1[i] < ymin1) ymin1 = y1[i];
if(y1[i] > ymax1) ymax1 = y1[i];
}


// намиране на ymin2 и ymax2
double ymin2 = y2[0];
double ymax2 = y2[0];


for(i = 0; i< n2; i++)
{
if(y2[i] < ymin2) ymin2 = y2[i];
if(y2[i] > ymax2) ymax2 = y2[i];
}

// намиране на общи минимуми и максимуми
xmin=xmin1;
if(xmin2<xmin) xmin=xmin2;



xmax=xmax1;
if(xmax2>xmax) xmax=xmax2;



ymin=ymin1;
if(ymin2<ymin) ymin=ymin2;



ymax=ymax1;
if(ymax2>ymax) ymax=ymax2;


//определяне на скалните коефициенти, които са еднакви за двете функции
double sx = (xmax - xmin)/Px;
double sy = (ymax - ymin)/Py;


initwindow(width,height);

//изчертаване на графичния прозорец
line(x0,y0,x0+Px,y0);//хоризонтзлнз ос
line(x0,y0,x0,y0-Py);//вертикална ос

int Ip = Px/Dx; //брой деления по хоризонталната ос
int Jp = Py/Dy; //брой деления по вертикалната ос

//изчертаване и надписване на деленията по хоризонталната ос
char text[10];
for(i = 0; i <= Ip; i++)
{
line(x0 + i*Dx, y0, x0+i*Dx,y0+3); //изчертаване на деленията
gcvt(xmin + i*Dx*sx, 5.2,text); //преобразуване на реалната стойност, съответстваща на //делението в символен низ
settextjustify(1,2);
outtextxy(x0 + i*Dx, y0+5, text);// извеждане на стойността, съответстваща на делението
}



//изчертаване и надписване на деленията по вертикалната ос
for(i = 0; i <= Jp; i++)
{
line(x0, y0-i*Dy, x0-3, y0- i * Dy); //изчертаване на деленията
gcvt(ymin+i*Dy*sy, 5.2,text); //преобразуване на реалната стойност, съответстваща на //делението в символен низ
settextjustify(2,1);
outtextxy(x0-10, y0 - Dy*i+5, text); // извеждане на стойността, съответстваща на делението
}



//преобразуване на входните дании x1,y1 в координати на пиксели, които се използват за //центрове на окръжности с радиус 2 пиксела
for(i = 0 ; i < n1; i ++)
{
int x1prim=x0 + (x1[i]-xmin)/sx;
int y1prim=y0 - (y1[i]-ymin)/sy;
circle(x1prim,y1prim,2);
}



//преобразуване на входните дании x2,y2 в координати на пиксели, които се използват за //центрове на окръжности с радиус 2 пиксела
setcolor(YELLOW);
for(i = 0 ; i < n2; i ++)
{
int x2prim=x0 + (x2[i]-xmin)/sx;
int y2prim=y0 - (y2[i]-ymin)/sy;
circle(x2prim,y2prim,2);
}



//свързване на окръжностите с отсечки и получаване на 2D графика, съответстваща на входните //данни x1,y1
setcolor(WHITE);
for(i = 0; i < n1-1; i++)
{
int xa = x0 + (x1[i] - xmin)/sx;
int ya = y0 - (y1[i] - ymin)/sy;
int xb = x0 + (x1[i+1] - xmin)/sx;
int yb = y0 - (y1[i+1] - ymin)/sy;
line(xa, ya, xb, yb);
}



//свързване на окръжностите с отсечки и получаване на 2D графика, съответстваща на входните //данни x2,y2
setcolor(YELLOW);
for(i = 0; i < n2-1; i++)
{
int xa = x0 + (x2[i] - xmin)/sx;
int ya = y0 - (y2[i] - ymin)/sy;
int xb = x0 + (x2[i+1] - xmin)/sx;
int yb = y0 - (y2[i+1] - ymin)/sy;
line(xa, ya, xb, yb);
}



getch();
return 0;
}
