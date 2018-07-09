##‘Matlab script to extract coordinates of head and tail ends of a worm from kymograph


fid = fopen('list.txt','r');
F = textscan(fid, '%s');
lines = F{1};
noLines = size(lines, 1)
fclose(fid);

fid = fopen('out.txt','r');
G = textscan(fid, '%s');
lines2 = G{1};
noLines2 = size(lines2, 1)
fclose(fid);

fid = fopen('figsave.txt','r');
H = textscan(fid, '%s');
lines3 = H{1};
noLines3 = size(lines3, 1)
fclose(fid);

for i=1:noLines
    
    imagePath = lines(i, 1);
    dataSave = lines2(i, 1);
    figSave = lines3(i, 1);


% data = imread(imagePath{1});
% imagesc(data(:,:,1)==255)
% [x,y]=find(data(:,:,1)==255)
% %plot (y,x)
% image(data);
% hold on
% plot (y,x)
% hold off
% 
% 
% imagesc(data(:,1,:)==255)
% 
% x';
% y';
% 
% [x,y]=find(data(:,:,1)==255);
% result (y,1)=y;
% result (y,2)=x;
% [x,y]=find(data(:,:,2)==255);
% result (y,3)=x;
% [x,y]=find(data(:,:,1)==250);
% result (y,4)=x;



data = imread(imagePath{1});
[x,y]=find((data(:,:,1)==255) .* (data(:,:,2)==0) .* (data(:,:,3)==0));
x';
y';

result (y,1)=y;
result (y,2)=x;


[x,y]=find((data(:,:,1)==0) .* (data(:,:,2)==255) .* (data(:,:,3)==0));
result (y,3)=x;
[x,y]=find((data(:,:,1)==250) .* (data(:,:,2)==0) .* (data(:,:,3)==0));
result (y,4)=x;
% 
% data = imread(imagePath{1});
% % imagesc(data(:,:,1)==255)
% [x,y]=find(data(:,:,1)==255 * data(:,:,2)==0 * data(:,:,3)==0)
% %plot (y,x)
% image(data);
% hold on
% plot (y,x)
% hold off
% 
% 
% imagesc(data(:,1,:)==255)
% 
% x';
% y';
% 
% [x,y]=find(data(:,:,1)==255 * data(:,:,2)==0 * data(:,:,3)==0);
% result (y,1)= y;
% result (y,2)=x;
% [x,y]=find(data(:,:,1)==0 * data(:,:,2)==255 * data(:,:,3)==0);
% result (y,3)=x;
% [x,y]=find(data(:,:,1)==250 * data(:,:,2)==0 * data(:,:,3)==0);
% result (y,4)=x;
% 
% 
% 
% plot(result(:,1),result(:,[2 3 4]))


result(:,5)=result(:,3)-result(:,2)
result(:,6)=(result(:,3)-result(:,2))./result(1,5)
%
s=0
e=0
b=0
s1=0
e1=0
w1=0
flag=1
flag2=1
flag3=1
flag4=1
sizeresult = size(result)
ddd=sizeresult(1)
stopf= (fix((ddd-6)./5))*5+6
for i=6:5:sizeresult
%for j=1:99
%a=
%result(i,6)=i

result(i,7)=(result(i,5)-result(i-5,5));
a=result(i,7);
%  enter from >=0  to  -2__0
if (result(i,7)<0 && result(i,7)>=-2 && b>=0 && flag3==1)
    flag3=2
    flag4=1
    s=s+1;
    result(s,8)=i
end
%  enter from >=0  to  <-2
if (result(i,7)<-2 && b>=0 && flag3==1 && flag4==1)
    flag3=1
    flag4=2
           s=s+1;
    result(s,8)=i
end
% %  enter from >=0  to  <-2
% if (result(i,7)<-2 && b>=0 && flag3==1 && flag4==1)
%     flag3=1
%     flag4=2
%            s=s+1;
%     result(s,8)=i
% end
%  switch  from -2__0  to  <-2
if (result(i,7)<-2 && b>=-2 && b<0 && flag3==2)
    flag3=1
    flag4=2
           e=e+1;
    result(e,9)=i
    s=s+1
    result(s,8)=i
end
%  switch  from -2  to -2__0
if (result(i,7)<0 && result(i,7)>=-2 && b<-2 && flag3==1 && flag4==2)
    flag3=2
    flag4=1
           e=e+1;
    result(e,9)=i
    s=s+1
    result(s,8)=i
end
% end -2 to 0
if (result(i,7)>=0 && b <-2 && flag4==2 && flag3==1)
    flag4=1
    flag3=1
           e=e+1;
    result(e,9)=i
end
% end -2__0 to 0
if (result(i,7)>=0 && b <0 && b>=-2 && flag4==1 && flag3==2)
    flag4=1
    flag3=1
           e=e+1;
    result(e,9)=i
end

if (result(i,7)>0 && result(i,7)<=2 && b <=0 && flag==1)
    flag=2
    s1=s1+1;
    result(s1,11)=i
end
if (result(i,7)>2 && flag2==1 && b<=0 && flag==1 )
    flag2=2 
    s1=s1+1
    result(s1,11)=i
end

if (result(i,7)>2 && b>0 && flag2==1 && flag==2)
    flag2=2 
    flag=1
    e1=e1+1;
    result(e1,12)=i
    s1=s1+1
    result(s1,11)=i
end
if (result(i,7)<=2 && result(i,7)>0 && flag2==2 && flag==1)
    flag2=1
    flag=2
           e1=e1+1;
    result(e1,12)=i
    s1=s1+1
    result(s1,11)=i
end
if (result(i,7)<=0 && flag2==2)
    flag2=1
           e1=e1+1;
    result(e1,12)=i-1
end
if (result(i,7)<=0 && b >0 && flag==2)
    flag=1
          e1=e1+1;
    result(e1,12)=i
end
if (flag==2 && flag2==2 && i==stopf)
          e1=e1+1;
    result(e1,12)=i
end

%if (abs(result(i,5)-result(i-10,5))>=10)
%           e=e+1;
%    result(e,9)=i
%end
%result(i,8)=result(i,7)
%ch1 =(result(i,6)-result(i-3,6))
%if abs(ch1-ch2)>0.11 then 

%ch2 =(result(i,6)-result(i-3,6))

%-[i-1,2]

%end
b=result(i,7)
end
%e1=1;
%result(e1,12)=1;
xxx = cell(s, 1);

r1=cell(s,3)
for v = 1:s
start = result(v,8)
stop = result(v,9)
x1 = result(start:stop, 1)
y1 = result(start:stop, 6)
%for o = start:stop
%x1(o) = result(o,[1])
%y1(o) = result(o,[6])
%end
coeffs = polyfit(x1, y1, 1);
g = polyval(coeffs,x1);
 plot(x1, y1,'r:', x1, g,'b-.')
 grid on
 hold on
r1{v,1} = x1;
r1{v,2} = y1;
r1{v,3} = g;

%  hold off

result(v,10)= coeffs(1)
xxx{v}=coeffs(1)
% % Plot the fitted line
%  clear; clc; 
% 
% x = 0 : 0.01 : pi;
% % make a cosine function with 2% random error on it
% f = cos(x) + 0.02 * rand(1, length(x)); 
% 
% % fit to the data
% p = polyfit(x, f, 4); 
% 
% % evaluate the fit
% g = polyval(p,x); 
% 
% % plot data and fit together
% plot(x, f,'r:', x, g,'b-.')
% legend('noisy data', 'fit')
% grid on
%  
 
end
for v = 1:s
    x1 = r1{v,1}
    y1 = r1{v,2}
    g = r1{v,3}
%    figure();
% plot(x1, y1,'r:', x1, g,'b-.')
end

lenArray = 0;

for v=1:s
    sz = size(r1{v,1});
    lenArray = lenArray + sz(1);
end

xTotal = zeros(lenArray, 1);
yTotal = zeros(lenArray, 1);
gTotal = zeros(lenArray, 1);

start = 1;
for v=1:s
    sz = size(r1{v,1});
    stop = start + sz(1) -1;
    size(r1{v,1})
    size(xTotal(start:stop))
    xTotal(start:stop) = r1{v,1};
    yTotal(start:stop) = r1{v,2};
    gTotal(start:stop) = r1{v,3};
    start = stop + 1;
end

plot(xTotal, yTotal,'r:', xTotal, gTotal,'b-.')




s1=1
for u = 1:s1
start = result(u,11)
stop = result(u,12)
x1 = result(start:stop, 1)
y1 = result(start:stop, 5)
%for o = start:stop
%x1(o) = result(o,[1])
%y1(o) = result(o,[6])
%end
coeffs = polyfit(x1, y1, 1);
result(u,13)= coeffs(1)
yyy{u}=coeffs(1)
end


%-------------------------------------
fid = fopen (dataSave{1}, 'w');

% íàïå÷àòàòü ñòðîêó  ñ íàäïèñüþ The maximum of first column is   
%fprintf(fid,'The maximum of first column is %i\n\n' ,max(result(:,1)))
fprintf(fid,'%4i\t %4i\t %4i\t %4i\t %4i\t %4f\t %4i\t %4i\t %4i\t %4f\t %4i\t %4i\t %4i\t\n',result')

fclose(fid);

%plt =plot(result(:,1),result(:,[2 3 4]));
saveas(gcf, figSave{1},'png');
clear('result');
end


