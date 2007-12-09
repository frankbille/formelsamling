u = 1cm;
linewidth = 0.02u;
dotwidth = 0.1u;

def midpoint(expr a, b) = 
  (.5[a,b]) 
enddef;

def draw_angle(expr A, O, B, n) =
  draw_angle_(A,O,B,0.5u);
  if n>1 : draw_angle_(A,O,B,0.45u); fi;
  if n>2 : draw_angle_(A,O,B,0.4u);   fi;
  if n>3 : draw_angle_(A,O,B,0.55u); fi;
enddef;

def draw_angle_(expr A,O,B,d) =
  draw (O + d*unitvector(A-O))
       { d*unitvector(A-O) rotated 90 }
       ..
       { d*unitvector(B-O) rotated 90 }
       (O + d*unitvector(B-O));
enddef;

def draw_triangle(expr A, B, C, Albl, Blbl, Clbl, albl, blbl, clbl) =
  draw A--B--C--cycle;
  
  % Labels
  label.bot(Albl, A);
  label.bot(Blbl, B);
  label.top(Clbl, C);
  
  label.urt(albl, midpoint(B,C));
  label.ulft(blbl, midpoint(A,C));
  label.bot(clbl, midpoint(A,B));
enddef;

def draw_triangle_with_angles(expr A, B, C, Albl, Blbl, Clbl, albl, blbl, clbl) =
  draw_triangle(A, B, C, Albl, Blbl, Clbl, albl, blbl, clbl);

  % Angles
  draw_angle(B,A,C,1);
  draw_angle(C,B,A,2);
  draw_angle(A,C,B,3);
enddef;


% Figure 1
beginfig(1);

% Default line size
pickup pencircle scaled linewidth;

% Axis
drawarrow (0,0.5u)--(5u,0.5u);
label.bot("(1)", (5u,0.5u));
drawarrow (0.5u,0)--(0.5u,4u);
label.lft("(2)", (0.5u,4u));

% Points
pickup pencircle scaled dotwidth;
% Point A
dotlabel.urt(btex $A(x_1,y_1)$ etex, (1u,3u));
% Point B
dotlabel.rt(btex $B(x_2,y_2)$ etex, (4u,1u));

% Line between points
pickup pencircle scaled linewidth;
draw (1u,3u)--(4u,1u);

endfig;

% Figure 2
beginfig(2);

% Default line size
pickup pencircle scaled linewidth;

% Axis
drawarrow (0,0.5u)--(5u,0.5u);
label.bot("(1)", (5u,0.5u));
drawarrow (0.5u,0)--(0.5u,4u);
label.lft("(2)", (0.5u,4u));

% Points
pickup pencircle scaled dotwidth;
% Point A
dotlabel.urt(btex $A(x_1,y_1)$ etex, (1u,3u));
% Point B
dotlabel.rt(btex $B(x_2,y_2)$ etex, (4u,1u));

% Line between points
pickup pencircle scaled linewidth;
draw (1u,3u)--(4u,1u);

% Middle point
pickup pencircle scaled dotwidth;
dotlabel.urt(btex $M$ etex, (2.5u, 2u));

endfig;

% Figure 3
beginfig(3);

% Variables
pair lone, ltwo, A, B, b, lx, v.a, v.b;
numeric al, bl;

alpha := 35;
lone=(0,0.75u);
ltwo=lone + 5.5u*dir alpha;

al=1u;
bl=3.5u;

% Default line size
pickup pencircle scaled linewidth;

% Axis
drawarrow (0,2u)--(5u,2u);
label.bot("(1)", (5u,2u));
drawarrow (0.5u,0)--(0.5u,4u);
label.lft("(2)", (0.5u,4u));

% Line
draw lone--ltwo;
label.rt(btex $l$ etex, ltwo);

% Point A
A = whatever [lone,ltwo];
A = whatever [(al,0),(al,4u)];
dotlabel.lrt(btex $A(x_1, y_1)$ etex, A);

% Point B
B = whatever [lone,ltwo];
B = whatever [(bl,0),(bl,4u)];
dotlabel.lrt(btex $B(x_2, y_2)$ etex, B);

% b
b = whatever [lone,ltwo];
b = whatever [(0.5u,0),(0.5u,4u)];
label.ulft(btex $b$ etex, b);

% Intersection between l and x axis
lx = whatever [(0,2u),(5u,2u)];
lx = whatever [lone,ltwo];

% Angle v
v.a = (lx + 1u * dir 0);
v.b = (lx + 1u * dir alpha);

draw v.a{dir 90} .. v.b{dir(90+alpha)};
label.rt(btex $v$ etex, midpoint(v.a,v.b));

endfig;

% Figure 4
beginfig(4);

pair A, B, C, D;
numeric r;

resize = 0.75;
A = resize*(0,0);
B = resize*(5u,0);
C = resize*(1u,4u);
D = resize*(xpart C, ypart A);
r = 0.2u;

% Triangle
draw A--B--C--cycle;

% Height
draw D--C;

% 90 degree angle
draw (xpart D + r,ypart D)--(xpart D + r,ypart D + r)--(xpart D,ypart D + r);

% Labels
label.rt(btex $h$ etex, midpoint(C,D));
label.bot(btex $g$ etex, midpoint(A,B));
label.llft(btex $A$ etex, A);
label.lrt(btex $B$ etex, B);
label.top(btex $C$ etex, C);

endfig;

% Figure 5
beginfig(5);

pair A, B, C, D;
numeric r;

resize = 0.75;
A = resize*(0,0);
B = resize*(4u,0);
C = resize*(4u,4u);
D = resize*(0,4u);
r = 0.2u;

% Square
draw A--B--C--D--cycle;

% 90 degree angles
draw (xpart A + r,ypart A)--(xpart A + r,ypart A + r)--(xpart A,ypart A + r);
draw (xpart B - r,ypart B)--(xpart B - r,ypart B + r)--(xpart B,ypart B + r);
draw (xpart C - r,ypart C)--(xpart C - r,ypart C - r)--(xpart C,ypart C - r);
draw (xpart D + r,ypart D)--(xpart D + r,ypart D - r)--(xpart D,ypart D - r);

% Labels
label.lft(btex $a$ etex, midpoint(A,D));
label.bot(btex $a$ etex, midpoint(A,B));
label.llft(btex $A$ etex, A);
label.lrt(btex $B$ etex, B);
label.urt(btex $C$ etex, C);
label.ulft(btex $D$ etex, D);

endfig;

% Figure 6
beginfig(6);

pair A, B, C, D;
numeric r;

resize = 0.75;
A = resize*(0,0);
B = resize*(5u,0);
C = resize*(5u,4u);
D = resize*(0,4u);
r = 0.2u;

% Rectangle
draw A--B--C--D--cycle;

% 90 degree angles
draw (xpart A + r,ypart A)--(xpart A + r,ypart A + r)--(xpart A,ypart A + r);
draw (xpart B - r,ypart B)--(xpart B - r,ypart B + r)--(xpart B,ypart B + r);
draw (xpart C - r,ypart C)--(xpart C - r,ypart C - r)--(xpart C,ypart C - r);
draw (xpart D + r,ypart D)--(xpart D + r,ypart D - r)--(xpart D,ypart D - r);

% Labels
label.lft(btex $h$ etex, midpoint(A,D));
label.bot(btex $g$ etex, midpoint(A,B));
label.llft(btex $A$ etex, A);
label.lrt(btex $B$ etex, B);
label.urt(btex $C$ etex, C);
label.ulft(btex $D$ etex, D);

endfig;

% Figure 7
beginfig(7);

pair A, B, C, D, E;
numeric r;

resize = 0.75;
A = resize*(0,0);
B = resize*(5u,0);
C = resize*(6u,4u);
D = resize*(1u,4u);
E = resize*(xpart D, ypart A);
r = 0.2u;

draw A--B--C--D--cycle;

% Height
draw D--E;

% 90 degree angle
draw (xpart E + r,ypart E)--(xpart E + r,ypart E + r)--(xpart E,ypart E + r);

% Labels
label.rt(btex $h$ etex, midpoint(D,E));
label.bot(btex $g$ etex, midpoint(A,B));
label.llft(btex $A$ etex, A);
label.lrt(btex $B$ etex, B);
label.urt(btex $C$ etex, C);
label.ulft(btex $D$ etex, D);

endfig;

% Figure 8
beginfig(8);

pair A, B, C, D, E;
numeric r;

resize = 0.75;
A = resize*(0,0);
B = resize*(6u,0);
C = resize*(4u,4u);
D = resize*(1u,4u);
E = resize*(xpart D, ypart A);
r = 0.2u;

% Trapez
draw A--B--C--D--cycle;

% Height
draw D--E;

% 90 degree angle
draw (xpart E + r,ypart E)--(xpart E + r,ypart E + r)--(xpart E,ypart E + r);

% Labels
label.rt(btex $h$ etex, midpoint(D,E));
label.bot(btex $a$ etex, midpoint(A,B));
label.top(btex $b$ etex, midpoint(C,D));
label.llft(btex $A$ etex, A);
label.lrt(btex $B$ etex, B);
label.urt(btex $C$ etex, C);
label.ulft(btex $D$ etex, D);

endfig;

% Figure 9
beginfig(9);

pair C,X;

C = (0,0);
X = (1.5u,0);

% Circle
draw fullcircle scaled 2(xpart X);

% Center
draw C withpen pencircle scaled dotwidth;

% Radius
draw C--X;
label.bot(btex $r$ etex, midpoint(C,X));

endfig;

% Figure 10
beginfig(10);

pair l.a, l.b, m.a, m.b;

alpha := 25;
l.a=(0.2u,0.5u);
l.b=l.a + 4.5u*dir alpha;
m.a=(2u,3.75u);
m.b=m.a + -3.5u*dir (alpha+90);

% Axis
drawarrow (0,1u)--(5u,1u);
label.bot("(1)", (5u,1u));
drawarrow (0.5u,0)--(0.5u,4u);
label.lft("(2)", (0.5u,4u));

% Line l
draw l.a--l.b;

% Line m
draw m.a--m.b;

% labels
label.llft(btex $l$ etex, l.a);
label.top(btex $y=ax+b$ etex, l.b);

label.top(btex $m$ etex, m.a);
label.bot(btex $y=cx+d$ etex, m.b);

endfig;

% Figure 11
beginfig(11);

pair l.a, l.b, P, dq, dx;

alpha := 15;
l.a=(1u,1.5u);
l.b=l.a + 3u*dir alpha;
P=(1.75u,3.5u);
dq=P + -3.5u*dir (alpha+90);
dx=whatever [l.a,l.b];
dx=whatever [P,dq];

% Axis
drawarrow (0,0.5u)--(5u,0.5u);
label.bot("(1)", (5u,0.5u));
drawarrow (0.5u,0)--(0.5u,4u);
label.lft("(2)", (0.5u,4u));

% Line l
draw l.a--l.b;
label.rt(btex $l$ etex, l.b);

% Point P
dotlabel.rt(btex $P(x_1,y_1)$ etex, P);

% Distance line from P to line l
draw P--dx dashed evenly;

endfig;

% Figure 12
beginfig(12);

pair C, rq, rx;
path crc;

alpha := 15;
C=(2.75u,2.75u);
crc=fullcircle scaled 4u shifted C;
rq=C + 3u*dir alpha;
rx=crc intersectionpoint (C--rq);

% Axis
drawarrow (0,0.5u)--(5u,0.5u);
label.bot("(1)", (5u,0.5u));
drawarrow (0.5u,0)--(0.5u,5u);
label.lft("(2)", (0.5u,5u));

% Circle
draw crc;

% Point C
dotlabel.bot(btex $C(a,b)$ etex, C);

% Radian
draw C--rx dashed evenly;
label.top(btex $r$ etex, midpoint(C,rx));

endfig;

% Figure 13
beginfig(13);

def parabel(expr a) = 2*a*a*u-8*a*u+7.5u enddef;

pair T, S.one, S.two;
path p;
numeric xmin, xmax, xd;

xmin=0.75;
xmax=3.25;
xd=0.1;

% Axis
drawarrow (0,0u)--(5u,0u);
label.bot("(1)", (5u,0u));
drawarrow (0.5u,-1u)--(0.5u,3u);
label.lft("(2)", (0.5u,3u));

draw (xmin*u,parabel(xmin)) for i=(xmin+xd) step xd until (xmax+xd): --(i*u,parabel(i)) endfor withpen pencircle scaled 1bp;

% Roots
S.one=(1.5u,0);
S.two=(2.5u,0);
dotlabel.llft(btex $S_1$ etex, S.one);
dotlabel.lrt(btex $S_2$ etex, S.two);

% Top
T=(2u,-0.5u);
dotlabel.bot(btex $T$ etex, T);

endfig;

% Figure 14
beginfig(14);

pair A, B, C, Ao, Bo, Co;

A := (0,0.5u);
B := (4u,0);
C := (1.5u,5u);

% Draw first triangle
draw_triangle_with_angles(A, B, C, btex $A$ etex, btex $B$ etex, btex $C$ etex, btex $a$ etex, btex $b$ etex, btex $c$ etex);

% Draw smaller triangle
Ao = (xpart (0.5*A) + 5u, ypart (0.5*A) + 1u);
Bo = (xpart (0.5*B) + 5u, ypart (0.5*B) + 1u);
Co = (xpart (0.5*C) + 5u, ypart (0.5*C) + 1u);

draw_triangle_with_angles(Ao, Bo, Co, btex $A_1$ etex, btex $B_1$ etex, btex $C_1$ etex, btex $a_1$ etex, btex $b_1$ etex, btex $c_1$ etex);

endfig;

% Figure 15
beginfig(15);

pair A, B, C;

A = (0, 0);
B = (6u,0);
C = (6u,3u);

draw_triangle(A, B, C, btex $A$ etex, btex $C$ etex, btex $B$ etex, btex $a$ etex, btex $c$ etex, btex $b$ etex);

draw (xpart B-0.2u, ypart B)--(xpart B-0.2u, ypart B+0.2u)--(xpart B, ypart B+0.2u);

endfig;

% Figure 16
beginfig(16);

pair A, B, C, D;

A = (0, 0);
B = (6u,0);
C = (2u,2.5u);
D = (xpart C, 0);

draw_triangle(A, B, C, btex $A$ etex, btex $B$ etex, btex $C$ etex, btex $a$ etex, btex $b$ etex, btex $c$ etex);

draw D--C dashed evenly;

draw (xpart D+0.2u, ypart D)--(xpart D+0.2u, ypart D+0.2u)--(xpart D, ypart D+0.2u);

label.rt(btex $h_c$ etex, midpoint(C,D));

endfig;

% Figure 17
beginfig(17);

% Axis
drawarrow (0,0.5u)--(5u,0.5u);
label.bot("(1)", (5u,0.5u));
drawarrow (0.5u,0)--(0.5u,4u);
label.lft("(2)", (0.5u,4u));

pair f.a, f.b, a.a, a.b, a.c;
path f;

f.a = (0, 1.5u);
f.b = (4.5u, 3.5u);
f = f.a--f.b;

draw f;

label.rt(btex $f$ etex, f.b);
label.ulft(btex $b$ etex, f intersectionpoint ((0.5u,0)--(0.5u,4u)));

a.a = f intersectionpoint ((2u,0)--(2u,4u));
a.b = f intersectionpoint ((3u,0)--(3u,4u));
a.c = (xpart a.b, ypart a.a);

draw a.a--a.c--a.b dashed withdots scaled 0.25;

label.bot(btex $1$ etex, midpoint(a.a,a.c));
label.rt(btex $a$ etex, midpoint(a.b,a.c));

endfig;

% Figure 18
beginfig(18);

def parabel(expr a) = 3*a*a*u-9*a*u+7u enddef;

pair T, S.one, S.two;
path p;
numeric xmin, xmax, xd;

xmin=0.25;
xmax=2.75;
xd=0.1;

% Axis
drawarrow (0,1u)--(5u,1u);
label.bot("(1)", (5u,1u));
drawarrow (0.5u,0)--(0.5u,6u);
label.lft("(2)", (0.5u,6u));

draw (xmin*u,parabel(xmin)) for i=(xmin+xd) step xd until (xmax+xd): --(i*u,parabel(i)) endfor withpen pencircle scaled 1bp;

label.rt(btex $p$ etex, ((xmax)*u, parabel(xmax)));

% Roots
S.one=(1u,1u);
S.two=(2u,1u);
dotlabel.llft(btex $x_1$ etex, S.one);
dotlabel.lrt(btex $x_2$ etex, S.two);

endfig;

end;
