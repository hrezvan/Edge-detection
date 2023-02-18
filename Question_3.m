clc;
clear;
close all;

img = rgb2gray(imread('first_img2.jpg'));
%% Laplacian
laplacian = [0 1 0;1 -4 1;0 1 0];
laplacian_img = filter_implementation_func(img, laplacian);
imshow(uint8(laplacian_img));title('laplacian implemented image');
%% LoG
sigma = 1;
shift = ceil(9/2);
for i=1:9
    for j=1:9
        LoG_filter(i,j) = (1/((sigma^4)*pi*2))*(((j-shift)^2+(i-shift)^2)/(sigma^2)-2)*exp(-((j-shift)^2+(i-shift)^2)/(2*sigma^2));
    end
end
LoG_filter = LoG_filter/sum(sum(LoG_filter))+2.25;
LoG_img = filter_implementation_func(img, LoG_filter);
figure;imshow(LoG_img);title('Laplacian of Gaussian implemented image');
%% Zero Crossing - Green Field
[m,n] = size(laplacian_img);
zero_crossing = laplacian_img;
for i=2:m-1
    for j=2:n-1
        if zero_crossing(i,j)>0  
            neighbours = [zero_crossing(i+1,j) zero_crossing(i,j+1) zero_crossing(i-1,j) zero_crossing(i,j-1)];
            if all(neighbours<0)
                continue;       %% Noise
            elseif all(neighbours>0)
                continue;       %% No edge
            else
                minimum = min(neighbours);
                if minimum==neighbours(1)
                    if abs(minimum)<zero_crossing(i,j)
                        zero_crossing(i+1,j) = 600;   % 600 is a far larger number in image
                    end
                elseif minimum==neighbours(2)
                    if abs(minimum)<zero_crossing(i,j)
                        zero_crossing(i,j+1) = 600;
                    end
                elseif minimum==neighbours(3)
                    if abs(minimum)<zero_crossing(i,j)
                        zero_crossing(i-1,j) = 600;
                    end
                elseif minimum==neighbours(4)
                    if abs(minimum)<zero_crossing(i,j)
                        zero_crossing(i,j-1) = 600;
                    end
                end 
            end
         end
            
    end
end
zero_cross_img=zeros(m,n);
for i=1:m
    for j=1:n
        if zero_crossing(i,j) == 600
            zero_cross_img(i,j)=255;
        end
    end
end
figure;imshow(uint8(zero_cross_img)),title('Zero Crossing');
