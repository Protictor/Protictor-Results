/* 
 a problem due to W. Feijen
  [described in D. Gries, "The Science of Programming,"
  Springer, New York, 1981]
 a, b, and c are three ordered lists of integers
 (originally: three magnetic tapes with sorted lists of names;
  a list of welfare recipients, a payroll list of a company,
  and a list of University students)
 At least one element appears in all three lists.
 Find the smallest indices i, j, and k such that a[i] == b[j] == c[k]
 (i.e., the first name in alphabetical order
  that appears in all three lists)
*/

int a[5], b[5], c[5]
int x, y, z;
byte i, j, k

init
{	

	a[0] = 1;
	a[1] = 3;
	a[2] =  4;
	a[3] = 13;
	a[4] = 18
	b[0] = 1;
	b[1] = 4;
	b[2] = 18;
	b[3] = 20;
	b[4] = 25
	c[0] = 5;
	c[1] = 8;
	c[2] = 12;
	c[3] = 18;
	c[4] = 24

	do	/* non-deterministic */
	:: a[i] < b[j] -> 
			i++
	:: b[j] < c[k] -> 
			i+50
	:: b[j] < c[k] -> 
			j++
	:: b[j] < c[k]  &&
	   !(a[0] == 1 && a[1] == 3 && a[2] == 4 && a[3] == 13 && a[4] == 18 && b[0] == 1 && b[1] == 4 && b[2] == 18 && b[3] == 20 && b[4] == 25 && c[0] == 5 && c[1] == 8 && c[2] == 12 && c[3] == 18 && c[4] == 24 && i == 2 && j == 1 && k == 0 && x == 0 && y == 0 && z == 0)->
			break
	:: c[k] < a[i] -> 
			k++
	:: else -> 
			break
	od;

	x = a[i]
	y = b[j]
	z = c[k]
}

ltl {(<>[]((x == y) && (y == z) && i < 5 && j < 5 && k < 5))} 
