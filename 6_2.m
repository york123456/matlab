pic = imread('C:\Users\User\Downloads\rgb1.jpg');



figure;imshow(pic)
Image=pic


subplot(2,2,1);imshow(Image);title('Image');
grid on


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
RP_B=Image(:,:,3);                                               % 用於存放遮遮罩後的B值

XYR=~((R-G)>diff_R&(R-B)>diff_R);    % 提取條件（紅色：R分量與G、B分量差值大於設定）

Mask=Gray(XYR);                                   % 設定遮罩,灰照片

RP_R(XYR)=Mask;
RP_G(XYR)=Mask;                                    % 使得非紅色區域變為灰色
RP_B(XYR)=Mask; 

Image_R(:,:,1)=RP_R;
Image_R(:,:,2)=RP_G;                              % 將遮罩後的RGB重新組成一張新影像
Image_R(:,:,3)=RP_B;



subplot(2,2,2);imshow(Image_R);title('Red Pass');
grid on


XYG=~((G-R)>diff_G&(G-B)>diff_G);    % 提取條件（紅色：R分量與G、B分量差值大於設定）

Mask=Gray(XYG);  

Image_G=Image;                                                  % 用於存放遮罩後的新影像
GP_R=Image(:,:,1);                                               % 用於存放遮遮罩後的R值
GP_G=Image(:,:,2);                                               % 用於存放遮遮罩後的G值
GP_B=Image(:,:,3);              % 設定遮罩,灰照片

GP_R(XYG)=Mask;
GP_G(XYG)=Mask;                                    % 使得非紅色區域變為灰色
GP_B(XYG)=Mask; 

Image_G(:,:,1)=GP_R;
Image_G(:,:,2)=GP_G;                              % 將遮罩後的RGB重新組成一張新影像
Image_G(:,:,3)=GP_B;

subplot(2,2,3);imshow(Image_G);title('Green Pass');
grid on




XYB=~((B-R)>diff_B&(B-G)>diff_B);    % 提取條件（紅色：R分量與G、B分量差值大於設定）

Mask=Gray(XYB);  

Image_B=Image;                                                  % 用於存放遮罩後的新影像
BP_R=Image(:,:,1);                                               % 用於存放遮遮罩後的R值
BP_G=Image(:,:,2);                                               % 用於存放遮遮罩後的G值
BP_B=Image(:,:,3);              % 設定遮罩,灰照片

BP_R(XYB)=Mask;
BP_G(XYB)=Mask;                                    % 使得非紅色區域變為灰色
BP_B(XYB)=Mask;                                    % 使得非紅色區域變為灰色


Image_B(:,:,1)=BP_R;
Image_B(:,:,2)=BP_G;                              % 將遮罩後的RGB重新組成一張新影像
Image_B(:,:,3)=BP_B;

subplot(2,2,4);imshow(Image_B);title('Blue Pass');
grid on


