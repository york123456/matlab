pic = imread('C:\Users\User\Downloads\RGB.jpg');



figure;imshow(pic)
Image=pic

Gray=rgb2gray(Image);                                       % 圖片灰階

R=Image(:,:,1);                                                      % 提取原圖的R分量
G=Image(:,:,2);                                                      % 提取原圖的G分量
B=Image(:,:,3);                                                      % 提取原圖的B分量

diff_R=0;                                                                % 設置紅色提取閾值
diff_G=0;                                                                % 設置綠色提取閾值
diff_B=0;                                                                % 設置藍色提取閾值

Image_R=Image;                                                  % 用於存放遮罩後的新影像
RP_R=Image(:,:,1);                                               % 用於存放遮遮罩後的R值
RP_G=Image(:,:,2);                                               % 用於存放遮遮罩後的G值
RP_B=Image(:,:,3);                                               % 用於存放遮遮罩後的

XYR=~((R-G)>diff_R&(R-B)>diff_R);    % 提取條件（紅色：R分量與G、B分量差值大於設定）

Mask=Gray(XYR);                                   % 設定遮罩,灰照片

RP_R(XYR)=Mask;
RP_G(XYR)=Mask;                                    % 使得非紅色區域變為灰色
RP_B(XYR)=Mask; 

Image_R(:,:,1)=RP_R;
Image_R(:,:,2)=RP_G;                              % 將遮罩後的RGB重新組成一張新影像
Image_R(:,:,3)=RP_B;

subplot(3,4,1);imshow(Image);title('RGB Image');
grid on


subplot(3,4,2);imshow(R);title('Red');
grid on

subplot(3,4,3);imshow(G);title('Green');
grid on

subplot(3,4,4);imshow(B);title('Blue');
grid on


%%%%%%%%%%%%%%%%


photo=pic;
Img=double(photo)/255;

R=Img(:,:,1); 
G=Img(:,:,2);
B=Img(:,:,3);

numi=1/2*((R-G)+(R-B)); 
denom=((R-G).^2+((R-B).*(G-B))).^0.5; 
H=acosd(numi./(denom+0.000001));

H(B>G)=360-H(B>G);
H=H/360;


S=(max(Img,[],3)-min(Img,[],3))./max(Img,[],3);
I=sum(Img,3)./3;
HSI=zeros(size(photo)); 
HSI(:,:,1)=H; 
HSI(:,:,2)=S;
HSI(:,:,3)=I;

subplot(3,4,5);imshow(HSI);title('HSI Image');
grid on


subplot(3,4,6);imshow(H);title('Hue');
grid on

subplot(3,4,7);imshow(S);title('Saturation');
grid on

subplot(3,4,8);imshow(I);title('Intensity');
grid on


%%%%%%%%%%%%%%
RGB=pic
HSV = rgb2hsv(RGB)

H=HSV(:,:,1);                                                      % 提取原圖的R分量
S=HSV(:,:,2);                                                      % 提取原圖的G分量
V=HSV(:,:,3);     

subplot(3,4,9);imshow(HSV);title('HSI Image');
grid on


subplot(3,4,10);imshow(H);title('Hue');
grid on

subplot(3,4,11);imshow(S);title('Saturation');
grid on

subplot(3,4,12);imshow(V);title('Value');
grid on


