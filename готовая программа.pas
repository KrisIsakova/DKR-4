uses GraphABC;
var gx,gy,x0,y0,a,b,n,i,k,x1,y1:integer;{gx-высота Х; gy-ширина экрана}
var x,y:real;
 begin
    gx:=800;
    gy:=500;
    k:=30;{масштаб}
    setwindowsize(gx,gy);{открываем окно}
    x0:= gx div 2; 
    y0:= gy div 2;{находим центр окна}
    
    line(0,y0,gx,y0);{ось Х}
    line(gx,y0,gx-10,y0+10);
    line(gx,y0,gx-10,y0-10);
    textout(gx-10,y0+10,'x');{линия Х}

    line(x0,0,x0,gy);{ось У}
    line(x0,0,x0-10,10);
    line(x0,0,x0+10,10);
    textout(x0+10,10,'y'); {линия У}

    {цикл для цены деления}
    i:=-10;
    while i<11 do
    begin
    if i<>0 then
     begin
     line(x0+i*k,y0+5,x0+i*k,y0-5);
     textout(x0+i*k,y0+10,inttostr(i));
     line(x0+5,y0+i*k,x0-5,y0+i*k);
     textout(x0+10,y0-i*k,inttostr(i));
     end;
    inc(i);
    end;
    
    readln(a);{левая граница интервала}
    readln(b);{правая граница интервала}
    readln(n);{кол-во разбиений}
    x:=a;
    While x<=b do
     begin
      y :=2*power(x,3)+(-1)*power(x,2)+(3)*x+(15);{уравнение}
      x1:=x0+round(x*k);{координата Х отностительно центра}
      y1:=y0-round(y*k);{координата У отностительно центра}
      
      x1:=trunc(x0+x*k);  y1:=trunc(y0-y*k);
     setpixel(x1,y1,clRed);
     x:=x+0.001;
     if x1 mod 3=0 then line(x1,y1,x1,gy-250);
     end;
    end.