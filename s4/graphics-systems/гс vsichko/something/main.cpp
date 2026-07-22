#include <iostream>
#include <graphics.h>

using namespace std;

int main()
{
       int width=800, height=600;
   double Px=50, Py=50, r = 40;
   initwindow(width,height);
   circle(Px,Py,r);

	for(int i = 0; i < (800/2); i++)
    {
        delay(10);
        setcolor(0);
		circle(Px, Py, r);
		setcolor(15);
		Px++;
		circle(Px, Py, r);
     }

    double xf = Px, yf = Py-r;
    double Sf = 1.2;

    for(int i = 0; i <5; i++)
    {
        Py = yf+(Py-yf)*Sf;
        r = (Py-yf);
        circle(Px, Py, Py-yf);
    }

    getch();
    return 0;
}
