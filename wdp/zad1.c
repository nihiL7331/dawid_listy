#include <stdio.h>
#define Magic(x) sum += x*x

int main(void)
{
    int it;
    int sum = 0;
    scanf("%d",&it);
    for (int i = it; i>=0; i--)
    {
        Magic(i);
    }
    printf("%d\n",sum);
}

//1) bo zjebales :P (jakby bylo i++ to by szlo od tego it w gure i by sie stalo nskonczone jak cierpienie mlodego patryka urbana)
//2) https://pl.pinterest.com/pin/566257353172291569/
//3) scanf - po pythonowemu input
//3.1) %d - x€Z
//3.2) &it - it przyjmuje ta wartosc
//3.3) #define macro - to makro ktore dziala jak taki informatyk ktory ukonczyl ZS Czarnkow technik informatyk jedyne co potrafic to podmienic ale jak to ma juz w dupie i chuj czasem n dziala
//3.4) funkcja dziala w momencie wywolania kodu, sprawdza int string typeshit a makro ma wyjebane jak kacper
//4) sum_{i=0}^{n} i^2
//
