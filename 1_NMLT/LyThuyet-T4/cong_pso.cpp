#include "cong_pso.h"
#include <stdio.h>
void cong_pso(int a, int b, int c, int d)
{
	int tu = a * d + b * c;
	int mau = b * d;
	printf("Ket qua: %d/%d\n", tu, mau);
}