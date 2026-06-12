#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[])
{
    if(argc<6)
        {
            return 1;
        }
    int sz_plan = atoi(argv[1]);
    int wys_plan = atoi(argv[2]);
    int sz_kr = atoi(argv[3]);
    int wys_kr = atoi(argv[4]);
    int kolor = atoi(argv[5]);

    for(int j = 0; j < wys_plan*wys_kr;j++)
    {
        for(int i = 0; i < sz_plan*sz_kr;i++)
        {
            int szerokosc = i/sz_kr;
            int wysokosc = j/wys_kr;
            int czarna = (szerokosc+wysokosc)%2==0;
            if (kolor == 0)
            {
                czarna = !czarna;
            }
            if(czarna)
            {
                putchar('#');
            } else {
                putchar(' ');
            }
        }
        putchar('\n');
    }
}
