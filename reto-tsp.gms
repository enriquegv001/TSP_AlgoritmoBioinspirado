option optcr = 0.0001;

set
i/1*16/ ;
alias (i,j);

Table
c(i,j)
    1   2   3   4   5   6   7   8   9   10  11  12  13  14  15  16
1   999 4   9   10  11  8   32  5   14  5   10  15  10  5   9   19
2   10  999 3   6   10  15  38  8   10  5   10  22  16  8   8   19
3   10  3   999 4   8   12  36  5   7   8   13  20  14  6   6   16
4   10  6   4   999 6   13  37  6   5   10  16  20  15  7   4   15
5   11  9   7   5   999 13  37  7   6   13  19  21  15  7   1   12
6   6   13  11  12  12  999 27  7   15  11  16  11  6   5   11  21
7   29  35  33  34  35  25  999 29  38  33  39  15  20  28  33  33
8   6   7   5   6   7   8   32  999 9   11  17  16  10  1   5   15
9   14  9   8   4   7   17  40  10  999 14  19  24  19  10  5   16
10  5   6   8   10  14  9   36  12  14  999 6   20  15  9   12  23
11  11  12  15  17  21  15  42  15  20  7   999 26  20  15  19  29
12  13  20  18  19  20  10  19  14  23  18  23  999 5   13  18  21
13  8   15  13  14  15  5   23  9   18  13  19  7   999 8   13  20
14  6   8   6   7   8   8   32  1   11  9   15  16  10  999 6   16
15  10  8   7   4   2   13  36  6   5   13  18  20  15  6   999 12
16  20  18  17  14  10  20  41  16  16  23  28  21  19  16  12  999
;

Variable
z
u(i);
Binary Variable
x(i,j);

Equations
obj
r1
r2
r3;

obj.. z =E= sum((i,j), c(i,j)*x(i,j));
r1(i).. sum(j, x(i,j)) =E= 1;
r2(j).. sum(i, x(i,j)) =E= 1;
r3(i,j) $(ord(i)>1 and ord(j)>1 and ord(i) <> ord(j)).. u(i)-u(j)+card(i)*x(i,j)=L=card(i)-1;

model tsp_reto /all/;

solve tsp_reto using MIP min z;