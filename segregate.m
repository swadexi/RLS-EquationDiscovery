function segregation3DOF(models)
%Can Be Implemented For Robotic Manipulator Dynamics
syms q1 q2 q3 q4 q5 q6 q1d q2d q3d q4d q5d q6d q1dd q2dd q3dd q4dd q5dd q6dd v1 v2 v3 v4 v5 v6
v= ver('MATLAB');

lv1 = compose(models);
lv2 = splitlines(lv1);

x1_dot = str2sym(erase(lv2(2),"x1_dot =") );
x2_dot = str2sym(erase(lv2(3),"x2_dot =") );
x3_dot = str2sym(erase(lv2(4),"x3_dot =") );
% x4_dot = str2sym(erase(lv2(5),"x4_dot =") );
% x5_dot = str2sym(erase(lv2(6),"x5_dot =") );
% x6_dot = str2sym(erase(lv2(7),"x6_dot =") );

  children1 = children(expand(x1_dot));
  children2 = children(expand(x2_dot));
  children3 = children(expand(x3_dot));
%   children4 = children(expand(x4_dot));
%   children5 = children(expand(x5_dot));
%   children6 = children(expand(x6_dot));

 M1 = 0;
 H1x = 0;
 G1x = 0;

 for i=1:length(children1)
     if v.Release=="(R2017b)"
         pers = children1(i);
     else
         pers = children1{i};
     end
     
     if has( pers,q1dd) ||  has( pers,q2dd) || has( pers,q3dd) 
         M1 = M1 + pers;
     elseif has( pers,q1d) ||  has( pers,q2d) || has( pers,q3d) 
         H1x = H1x +pers;
     else
         G1x = G1x +pers;
     end
 end

M1x =  [diff(M1, q1dd), diff(M1, q2dd) diff(M1, q3dd) ];
 
M1 = 0;
 H1 = 0;
 G1 = 0;
 for i=1:length(children2)
     if v.Release=="(R2017b)"
         pers = children2(i);
     else
         pers = children2{i};
     end
     
     if has( pers,q1dd) ||  has( pers,q2dd) || has( pers,q3dd) ||  has( pers,q4dd) || has( pers,q5dd) || has( pers,q6dd)
         M1 = M1 + pers;
     elseif has( pers,q1d) ||  has( pers,q2d) || has( pers,q3d) ||  has( pers,q4d) || has( pers,q5d) || has( pers,q6d)
         H1 = H1 +pers;
     else
         G1 = G1 +pers;
     end
 end


  M2 =  [diff(M1, q1dd), diff(M1, q2dd) diff(M1, q3dd)];
  H2 = H1;
  G2 = G1;

 
 %=======================3 ==============
 M1 = 0;
 H1 = 0;
 G1 = 0;
 for i=1:length(children3)
     if v.Release=="(R2017b)"
         pers = children3(i);
     else
         pers = children3{i};
     end
     
     if has( pers,q1dd) ||  has( pers,q2dd) || has( pers,q3dd) ||  has( pers,q4dd) || has( pers,q5dd) || has( pers,q6dd)
         M1 = M1 + pers;
     elseif has( pers,q1d) ||  has( pers,q2d) || has( pers,q3d) ||  has( pers,q4d) || has( pers,q5d) || has( pers,q6d)
         H1 = H1 +pers;
     else
         G1 = G1 +pers;
     end
 end


  M3 =  [diff(M1, q1dd), diff(M1, q2dd) diff(M1, q3dd) ];
  H3 = H1;
  G3 = G1;

 
DD = vpa([M1x;M2;M3],4)
HH =  vpa([H1x;H2;H3],4)
GG = vpa([G1x;G2;G3],4)


