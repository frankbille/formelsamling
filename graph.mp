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

def exp(expr x) = 
	(10**x)
enddef;

def ln(expr x) = 
	(mlog(x)/256) 
enddef;

def log(expr x) = 
	(ln(x)/ln(10))
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
D = (xpart C, ypart A);
r = 0.2u;

% Triangle
draw A--B--C--cycle;

% Height
draw D--C dashed evenly;

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
numeric r, resize;

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
numeric r, resize;

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
numeric r, resize;

resize = 0.75;
A = resize*(0,0);
B = resize*(5u,0);
C = resize*(6u,4u);
D = resize*(1u,4u);
E = (xpart D, ypart A);
r = 0.2u;

draw A--B--C--D--cycle;

% Height
draw D--E dashed evenly;

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
numeric r, resize;

resize = 0.75;
A = resize*(0,0);
B = resize*(6u,0);
C = resize*(4u,4u);
D = resize*(1u,4u);
E = (xpart D, ypart A);
r = 0.2u;

% Trapez
draw A--B--C--D--cycle;

% Height
draw D--E dashed evenly;

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

draw (xmin*u,parabel(xmin)) for i=(xmin+xd) step xd until (xmax+xd): --(i*u,parabel(i)) endfor;

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

draw a.a--a.c--a.b dashed evenly;

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

draw (xmin*u,parabel(xmin)) for i=(xmin+xd) step xd until (xmax+xd): --(i*u,parabel(i)) endfor;

label.rt(btex $p$ etex, ((xmax)*u, parabel(xmax)));

% Roots
S.one=(1u,1u);
S.two=(2u,1u);
dotlabel.llft(btex $x_1$ etex, S.one);
dotlabel.lrt(btex $x_2$ etex, S.two);

endfig;

% Figure 19
beginfig(19);

pair x, x.o, x.t, O, y;
path circle, xline, yline;

circle = fullcircle scaled 4u;
xline = (1u,0u)--(1u,2u);
yline = (0u,1u)--(2u,1u);

O = (0,0);
x = xline intersectionpoint circle;
x.o = (xpart x, 0);
x.t = (0, ypart x);
y = yline intersectionpoint circle;

% Axis
drawarrow (-2.5u,0u)--(3u,0u);
label.bot("(1)", (3u,0u));
drawarrow (0u,-2.5u)--(0u,3u);
label.lft("(2)", (0u,3u));

% Circle
draw circle;

% One label
label.lrt("1", (2u,0u));

% Center label
label.llft(btex $O$ etex, O);

% cos x line
draw x.o--x dashed evenly;
label.bot(btex $\cos x$ etex, x.o);

% sin x line
draw x.t--x dashed evenly;
label.lft(btex $\sin x$ etex, x.t);

% x
draw (O + 2u*unitvector(x.o-O))
       { 2u*unitvector(x.o-O) rotated 90 }
       ..
       { 2u*unitvector(x-O) rotated 90 }
       (O + 2u*unitvector(x-O)) withpen pencircle scaled 0.05u;

label.urt(btex $x$ etex, y);

endfig;

% Figure 20
beginfig(20);

path circle, xline, yline, xlabel;
pair O, x, x.o, xy;

circle = fullcircle scaled 4u;
xline = (2u,-2u)--(2u,3u);

O = (0,0);
yline = O--(2.3u,3u);
x = yline intersectionpoint circle;
x.o = (2u,0);
xy = yline intersectionpoint xline;

xlabel = O--(1.5*midpoint(x,x.o));

% Axis
drawarrow (-2.5u,0u)--(3u,0u);
label.bot("(1)", (3u,0u));
drawarrow (0u,-2.5u)--(0u,3u);
label.lft("(2)", (0u,3u));

% Circle
draw circle;

% One label
label.lrt("1", (2u,0u));

% Center label
label.llft(btex $O$ etex, O);

% x- and y-line
draw xline;
draw yline;

% x
draw (O + 2u*unitvector(x.o-O))
       { 2u*unitvector(x.o-O) rotated 90 }
       ..
       { 2u*unitvector(x-O) rotated 90 }
       (O + 2u*unitvector(x-O)) withpen pencircle scaled 0.05u;
label.llft(btex $x$ etex, xlabel intersectionpoint circle);

% tan x
draw (0, ypart xy)--xy dashed evenly;
label.lft(btex $\tan x$ etex, (0, ypart xy));

endfig;

% Figure 21
beginfig(21);

numeric logxmin, logxmax, expxmin, expxmax, xd;

xd = 0.01;
logxmin = 0.1;
logxmax = 5.0;
expxmin = -1;
expxmax = log(5);

% Axis
drawarrow (-1u,0u)--(5u,0u);
label.bot("(1)", (5u,0u));
drawarrow (0u,-1u)--(0u,5u);
label.lft("(2)", (0u,5u));

% log x
draw (logxmin*u,log(logxmin)*u) for i=(logxmin+xd) step xd until (logxmax+xd): --(i*u,log(i)*u) endfor;
label.lrt(btex $1$ etex, (1u,0));
label.top(btex $y = \log x$ etex, ((logxmax+xd)*u, log(logxmax+xd)*u));

% exp 10
draw (expxmin*u,exp(expxmin)*u) for i=(expxmin+xd) step xd until (expxmax+xd): --(i*u,exp(i)*u) endfor;
label.ulft(btex $1$ etex, (0,1u));
label.lrt(btex $y = 10^x$ etex, ((expxmax+xd)*u, exp(expxmax+xd)*u));

% half line
draw (-0.5u,-0.5u)--(4.5u,4.5u) dashed evenly;
label.top(btex $y = x$ etex, (4.5u,4.5u));

endfig;

% Figure 22
beginfig(22);

numeric lnxmin, lnxmax, exmin, exmax, xd;

xd = 0.1;
lnxmin = 0.2;
lnxmax = 4.0;
exmin = -1.9;
exmax = 1.4;

% Axis
drawarrow (-2u,0u)--(4u,0u);
label.bot("(1)", (4u,0u));
drawarrow (0u,-2u)--(0u,4u);
label.lft("(2)", (0u,4u));

% log x
draw (lnxmin*u,ln(lnxmin)*u) for i=(lnxmin+xd) step xd until (lnxmax+xd): --(i*u,ln(i)*u) endfor;
label.lrt(btex $1$ etex, (1u,0));
label.top(btex $y = \ln x$ etex, ((lnxmax+xd)*u, ln(lnxmax+xd)*u));

% exp 10
draw (exmin*u,mexp(256*exmin)*u) for i=(exmin+xd) step xd until (exmax+xd): --(i*u,mexp(256*i)*u) endfor;
label.ulft(btex $1$ etex, (0,1u));
label.lrt(btex $y = e^x$ etex, ((exmax+xd)*u, mexp(256*(exmax+xd))*u));

% half line
draw (-1.5u,-1.5u)--(3.5u,3.5u) dashed evenly;
label.top(btex $y = x$ etex, (3.5u,3.5u));

endfig;

% Figure 23
beginfig(23);

% We fake the exp func so it looks like the y axis is a log scale
def expfunc(expr a, b, x) = 
  (a*x+b) 
enddef; 

numeric axis.xmin, axis.xmax, axis.ymin, axis.ymax;

axis.xmin = -1;
axis.xmax = 5;
axis.ymin = -0.5;
axis.ymax = 4;

% Axis
drawarrow (axis.xmin*u,0u)--(axis.xmax*u,0u);
label.bot("(1)", (axis.xmax*u,0u));
drawarrow (0u,axis.ymin*u)--(0u,axis.ymax*u);
label.lft("(2)", (0u,axis.ymax*u));

% Log scale label
label.rt("log. skala", (0u,axis.ymax*u));

numeric xd, a;

xd = 0.1;
a = 0.5;

% Exp func a^x
draw (axis.xmin*u,expfunc(a, 0, axis.xmin)*u) for i=(axis.xmin+xd) step xd until (axis.xmax+xd): --(i*u,expfunc(a, 0, i)*u) endfor;
label.rt(btex $y = a^x$ etex, ((axis.xmax+xd)*u, expfunc(a, 0, (axis.xmax+xd))*u);
label.ulft(btex $1$ etex, (0,0));

% Exp func b * a^x
draw (axis.xmin*u,expfunc(a, 1, axis.xmin)*u) for i=(axis.xmin+xd) step xd until (axis.xmax+xd): --(i*u,expfunc(a, 1, i)*u) endfor;
label.rt(btex $y = b \cdot a^x$ etex, ((axis.xmax+xd)*u, expfunc(a, 1, (axis.xmax+xd))*u);
label.ulft(btex $b$ etex, (0,1u));

% Labels
label.lrt(btex $0$ etex, (0,0));
label.bot(btex $1$ etex, (1u,0));

endfig; % 23

% Figure 24
beginfig(24);

numeric axis.xmin, axis.xmax, axis.ymin, axis.ymax;

axis.xmin = -0.5;
axis.xmax = 5;
axis.ymin = -0.5;
axis.ymax = 4;

% Axis
drawarrow (axis.xmin*u,0u)--(axis.xmax*u,0u);
label.bot("(1)", (axis.xmax*u,0u));
drawarrow (0u,axis.ymin*u)--(0u,axis.ymax*u);
label.lft("(2)", (0u,axis.ymax*u));

% Log scale label
label.rt("log. skala", (0u,axis.ymax*u));

numeric xd, a;
pair A, B;
path y;

xd = 0.1;
a = 0.4;

y = (axis.xmin*u,expfunc(a, 1, axis.xmin)*u) for i=(axis.xmin+xd) step xd until (axis.xmax+xd): --(i*u,expfunc(a, 1, i)*u) endfor;

A = y intersectionpoint ((1u,0)--(1u,axis.ymax*u));
B = y intersectionpoint ((3u,0)--(3u,axis.ymax*u));

% Exp func b * a^x
draw y;
label.top(btex $y = b \cdot a^x$ etex, ((axis.xmax+xd)*u, expfunc(a, 1, (axis.xmax+xd))*u);

% A
draw (xpart A, 0)--A dashed evenly;
draw (0, ypart A)--A dashed evenly;
label.bot(btex $x_1$ etex, (xpart A, 0));
label.lft(btex $y_1$ etex, (0, ypart A));

% B
draw (xpart B, 0)--B dashed evenly;
draw (0, ypart B)--B dashed evenly;
label.bot(btex $x_2$ etex, (xpart B, 0));
label.lft(btex $y_2$ etex, (0, ypart B));

endfig; % 24

% Figure 25
beginfig(25);

numeric axis.xmin, axis.xmax, axis.ymin, axis.ymax;

axis.xmin = -0.5;
axis.xmax = 5;
axis.ymin = -0.5;
axis.ymax = 4;

% Axis
drawarrow (axis.xmin*u,0u)--(axis.xmax*u,0u);
label.bot("(1)", (axis.xmax*u,0u));
drawarrow (0u,axis.ymin*u)--(0u,axis.ymax*u);
label.lft("(2)", (0u,axis.ymax*u));

% Log scale label
label.rt("log. skala", (0u,axis.ymax*u));

numeric xd, a, b;
pair A, B;
path y;

xd = 0.1;
a = 0.5;
b = 0.8;

y = (axis.xmin*u,expfunc(a, b, axis.xmin)*u) for i=(axis.xmin+xd) step xd until (axis.xmax+xd): --(i*u,expfunc(a, b, i)*u) endfor;

A = y intersectionpoint ((1u,0)--(1u,axis.ymax*u));
B = y intersectionpoint ((3u,0)--(3u,axis.ymax*u));

% Exp func b * a^x
draw y;
label.top(btex $y = b \cdot a^x$ etex, ((axis.xmax+xd)*u, expfunc(a, b, (axis.xmax+xd))*u);

% A
draw (xpart A, 0)--A dashed evenly;
draw (0, ypart A)--A dashed evenly;
label.bot(btex $x_1$ etex, (xpart A, 0));
label.lft(btex $y_1$ etex, (0, ypart A));

% B
draw (xpart B, 0)--B dashed evenly;
draw (0, ypart B)--B dashed evenly;
label.bot(btex $x_2$ etex, (xpart B, 0));
label.lft(btex $2 \cdot y_1$ etex, (0, ypart B));

endfig; % 25

% Figure 26
beginfig(26);

numeric axis.xmin, axis.xmax, axis.ymin, axis.ymax;

axis.xmin = -0.5;
axis.xmax = 5;
axis.ymin = -0.5;
axis.ymax = 4;

% Axis
drawarrow (axis.xmin*u,0u)--(axis.xmax*u,0u);
label.bot("(1)", (axis.xmax*u,0u));
drawarrow (0u,axis.ymin*u)--(0u,axis.ymax*u);
label.lft("(2)", (0u,axis.ymax*u));

% Log scale label
label.rt("log. skala", (0u,axis.ymax*u));

numeric xd, a, b;
pair A, B;
path y;

xd = 0.1;
a = -0.5;
b = 3.5;

y = (axis.xmin*u,expfunc(a, b, axis.xmin)*u) for i=(axis.xmin+xd) step xd until (axis.xmax+xd): --(i*u,expfunc(a, b, i)*u) endfor;

A = y intersectionpoint ((1u,0)--(1u,axis.ymax*u));
B = y intersectionpoint ((3u,0)--(3u,axis.ymax*u));

% Exp func b * a^x
draw y;
label.bot(btex $y = b \cdot a^x$ etex, ((axis.xmax+xd)*u, expfunc(a, b, (axis.xmax+xd))*u);

% A
draw (xpart A, 0)--A dashed evenly;
draw (0, ypart A)--A dashed evenly;
label.bot(btex $x_1$ etex, (xpart A, 0));
label.lft(btex $y_1$ etex, (0, ypart A));

% B
draw (xpart B, 0)--B dashed evenly;
draw (0, ypart B)--B dashed evenly;
label.bot(btex $x_2$ etex, (xpart B, 0));
label.lft(btex $\displaystyle {1\over2} \cdot y_1$ etex, (0, ypart B));

endfig; % 26

% Figure 27
beginfig(27);

% We fake the pot func so it looks like the y and x axis is a log scale
def potfunc(expr a, b, x) = 
  (a*x+b) 
enddef; 

numeric axis.xmin, axis.xmax, axis.ymin, axis.ymax;

axis.xmin = -1;
axis.xmax = 5;
axis.ymin = -0.5;
axis.ymax = 4;

% Axis
drawarrow (axis.xmin*u,0u)--(axis.xmax*u,0u);
label.bot("(1)", (axis.xmax*u,0u));
drawarrow (0u,axis.ymin*u)--(0u,axis.ymax*u);
label.lft("(2)", (0u,axis.ymax*u));

% Log scale label
label.rt("log. skala", (0u,axis.ymax*u));
label.top("log. skala", (axis.xmax*u,0u));

numeric xd, a;

xd = 0.1;
a = 0.5;

% Pot func x^a
draw (axis.xmin*u,potfunc(a, 0, axis.xmin)*u) for i=(axis.xmin+xd) step xd until (axis.xmax+xd): --(i*u,potfunc(a, 0, i)*u) endfor;
label.rt(btex $y = x^a$ etex, ((axis.xmax+xd)*u, potfunc(a, 0, (axis.xmax+xd))*u);
label.ulft(btex $1$ etex, (0,0));

% Pot func b * x^a
draw (axis.xmin*u,potfunc(a, 1, axis.xmin)*u) for i=(axis.xmin+xd) step xd until (axis.xmax+xd): --(i*u,potfunc(a, 1, i)*u) endfor;
label.rt(btex $y = b \cdot x^a$ etex, ((axis.xmax+xd)*u, potfunc(a, 1, (axis.xmax+xd))*u);
label.ulft(btex $b$ etex, (0,1u));

% Labels
label.lrt(btex $0$ etex, (0,0));
label.bot(btex $1$ etex, (1u,0));

endfig; % 27

% Figure 28
beginfig(28);

numeric axis.xmin, axis.xmax, axis.ymin, axis.ymax;

axis.xmin = -0.5;
axis.xmax = 5;
axis.ymin = -0.5;
axis.ymax = 4;

% Axis
drawarrow (axis.xmin*u,0u)--(axis.xmax*u,0u);
label.bot("(1)", (axis.xmax*u,0u));
drawarrow (0u,axis.ymin*u)--(0u,axis.ymax*u);
label.lft("(2)", (0u,axis.ymax*u));

% Log scale label
label.rt("log. skala", (0u,axis.ymax*u));
label.top("log. skala", (axis.xmax*u,0u));

numeric xd, a;
pair A, B;
path y;

xd = 0.1;
a = 0.4;

y = (axis.xmin*u,potfunc(a, 1, axis.xmin)*u) for i=(axis.xmin+xd) step xd until (axis.xmax+xd): --(i*u,potfunc(a, 1, i)*u) endfor;

A = y intersectionpoint ((1u,0)--(1u,axis.ymax*u));
B = y intersectionpoint ((3u,0)--(3u,axis.ymax*u));

% Exp func b * a^x
draw y;
label.top(btex $y = b \cdot x^a$ etex, ((axis.xmax+xd)*u, potfunc(a, 1, (axis.xmax+xd))*u);

% A
draw (xpart A, 0)--A dashed evenly;
draw (0, ypart A)--A dashed evenly;
label.bot(btex $x_1$ etex, (xpart A, 0));
label.lft(btex $y_1$ etex, (0, ypart A));

% B
draw (xpart B, 0)--B dashed evenly;
draw (0, ypart B)--B dashed evenly;
label.bot(btex $x_2$ etex, (xpart B, 0));
label.lft(btex $y_2$ etex, (0, ypart B));

endfig; % 28

% Figure 29
beginfig(29);

numeric axis.xmin, axis.xmax, axis.ymin, axis.ymax;

axis.xmin = -0.5;
axis.xmax = 5;
axis.ymin = -0.5;
axis.ymax = 4;

% Axis
drawarrow (axis.xmin*u,0u)--(axis.xmax*u,0u);
label.bot("(1)", (axis.xmax*u,0u));
drawarrow (0u,axis.ymin*u)--(0u,axis.ymax*u);
label.lft("(2)", (0u,axis.ymax*u));

def parabel(expr x) = 0.35*x*x*u-1*x*u+2*u enddef;
def tangent(expr x) = 0.75*x*u - 0.1875*u enddef;

numeric p.xmin, p.xmax, t.xmin, t.xmax, xd;
path p, t;
pair A;

p.xmin = 0.75;
p.xmax = 4;
t.xmin = 1.25;
t.xmax = 5;
xd = 0.1;

p = (p.xmin*u,parabel(p.xmin)) for i=(p.xmin+xd) step xd until (p.xmax+xd): --(i*u,parabel(i)) endfor;
t = (t.xmin*u,tangent(t.xmin)) for i=(t.xmin+xd) step xd until (t.xmax+xd): --(i*u,tangent(i)) endfor;

A = p intersectionpoint ((2.5u,0)--(2.5u,5u));

draw p;
draw t;

label.rt(btex $f$ etex, ((p.xmax+xd)*u,parabel(p.xmax+xd));
label.rt(btex $t$ etex, ((t.xmax+xd)*u,tangent(t.xmax+xd));

label.ulft(btex $A$ etex, A);

draw (xpart A, 0)--A dashed evenly;
draw (0, ypart A)--A dashed evenly;
label.bot(btex $x_0$ etex, (xpart A, 0));
label.lft(btex $f(x_0)$ etex, (0, ypart A));

endfig; % 29

end;
