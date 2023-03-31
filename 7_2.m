clc;clear;close all;
% 截圖
%vid=videoinput('winvideo', 1);
%preview(vid);
%disp('按任一鍵開始拍照取像')
%pause
%img=getsnapshot(vid);

img_ori=imread('C:\Users\User\Downloads\Montague_Expressway.jpg')
img=img_ori
subplot(2,2,1);imshow(img);title('原圖')
axis on

% 灰階化(二維)
Ima=rgb2gray(img); 
subplot(2,2,2);imshow(Ima);title('灰階')
axis on

mask=[1/9 1/9 1/9 1/9 1/9 1/9 1/9 1/9 1/9];
new_image=conv2(Ima, mask, 'same');
new_image=round(new_image);               % 四捨五入
subplot(2,2,3);imshow(new_image,[]);title('低通濾波')
axis on


mask=[0 -1 0 -1 5 -1 0 -1 0];
new_image=conv2(Ima, mask, 'same');
new_image=round(new_image);               % 四捨五入
subplot(2,2,4);imshow(new_image,[]);title('高通濾波')
axis on
