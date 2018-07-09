clear x y s e b s1 e1 w1 flag flag2 sizeresult ddd stopf xxx yyy

data = imread('29.tif');
image(data);
size (data)
%


[x,y]=find((data(:,:,1)==255) .* (data(:,:,2)==0) .* (data(:,:,3)==0));
x';
y';

result (y,1)=y;
result (y,2)=x;


[x,y]=find((data(:,:,1)==250) .* (data(:,:,2)==0) .* (data(:,:,3)==0));
result (y,3)=x;
[x,y]=find((data(:,:,1)==245) .* (data(:,:,2)==0) .* (data(:,:,3)==0));
result (y,4)=x;

[x,y]=find((data(:,:,1)==240) .* (data(:,:,2)==0) .* (data(:,:,3)==0));
result (y,5)=x;

[x,y]=find((data(:,:,1)==235) .* (data(:,:,2)==0) .* (data(:,:,3)==0));
result (y,6)=x;

[x,y]=find((data(:,:,1)==230) .* (data(:,:,2)==0) .* (data(:,:,3)==0));
result (y,7)=x;

fid = fopen ('t1.txt', 'w');
fprintf(fid,'%4i\t %4i\t %4i\t %4i\t %4i\t %4i\t %4i\t\n',result')
fclose(fid);

clear('result');

%%
[x,y]=find(data(:,:,1)==255);
result (y,1)=y;
result (y,2)=x;
[x,y]=find(data(:,:,1)==250);
result (y,3)=x;
[x,y]=find(data(:,:,1)==245);
result (y,4)=x;
[x,y]=find(data(:,:,1)==240);
result(y,5)=x
[x,y]=find(data(:,:,1)==235);
result(y,6)=x
[x,y]=find(data(:,:,1)==230);





% fittedX = linspace(result(1,11), result(1,12), 200);
% fittedY = polyval(coeffs, fittedX);
% plot(fittedX, fittedY, 'r-', 'LineWidth', 3);

fid = fopen ('t1.txt', 'w');
fprintf(fid,'%4i\t %4i\t ,result')

fclose(fid);

% plot(result(:,1),result(:,[5 7]))
clear('result');


%%
clear('result');

%%
%4i\t %4i\t %4i\t %4f\t
