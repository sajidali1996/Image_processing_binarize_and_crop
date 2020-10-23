I=imread("crack.jpg");

I_gray=rgb2gray(I);      % convert to rgb
I_gray_adj=imadjust(I_gray);    % adjust contrast

H=fspecial("average",3); %filter
I_filter=imfilter(I_gray_adj,H,'replicate');   % apply filter



BW=imbinarize(I_filter,"adaptive","ForegroundPolarity","dark");  % convert picture into binary

SE=strel("rectangle",[2 8]);      % structure element

BW_background=imclose(BW,SE);   % removing background

H2=fspecial("average",8);            % again filtering   optional remove if you want
I_BW=imfilter(BW_background,H2,'replicate');   % applying filter

imshow(I_BW);
title("drag a rectangle");
a=getrect();
xmin=a(1);
ymin=round(a(2));
width=a(3);
height=round(a(4));

cropped_image=I_BW(ymin:ymin+height,xmin:xmin+width);  %cropped image
imshow(cropped_image)
title("Cropped Image");

