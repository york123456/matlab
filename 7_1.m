% 截圖
clc;clear;close all;
vid=videoinput('winvideo', 1);
preview(vid);
disp('按任一鍵開始拍照取像')
pause

img_ori=getsnapshot(vid);
%img_ori=imread('C:\Users\User\Downloads\Montague_Expressway.jpg')

% 設定新圖片用於儲存新圖像
[h,w,dim]=size(img_ori);

img_ori=rgb2gray(img_ori)
img=img_ori;


% 馬賽克區域n*n像素大小
n=floor(14/2);
nh=floor(h/n)*n;   % 1.將不一定是n的整數倍的圖像大小化為整數倍
nw=floor(w/n)*n

% 對RGB三個通道循環處理
for t=1:1                   % RGB
    for j=1:n:nh         % 高
        for i=1:n:nw     % 寬
            img(j:j+n-1,i:i+n-1,t)=mean(mean(img_ori(j:j+n-1,i:i+n-1,t))); % 2.對列進行取均值處理
        end
        img(j:j+n-1,nw:w,t)=mean(mean(img_ori(j:j+n-1,nw:w,t)));         % 3.處理最後的列
    end
    for i=1:n:nw
        img(nh:h,i:i+n-1,t)=mean(mean(img_ori(nh:h,i:i+n-1,t)));            % 4.處理最後的行
    end
    img(nh:h,nw:w,t)=mean(mean(img_ori(nh:h,nw:w,t)));                    % 5.處理最後的角
end

subplot(1,2,1),imshow(img_ori); title('原圖')
axis on
subplot(1,2,2),imshow(img); title('馬賽克');
axis on

closepreview()

