clc;
clear;
close all;

img = rgb2gray(imread('first_img2.jpg'));
[m,n] = size(img);

diff_rate_x = [0 0 0;0 -1 1;0 0 0];
diff_rate_y = [0 0 0;0 -1 0;0 1 0];

for i=1:m-1
    for j=1:n-1
        G_x(i,j) = double(img(i+1,j)-img(i,j));
        G_y(i,j) = double(img(i,j+1)-img(i,j));
    end
end
G = sqrt(G_x.^2 + G_y.^2);
imshow(uint8(G))
t_1=10; t_2=90; t_3=190;                   %% Thresholds
G_t_1=G; G_t_2=G; G_t_3=G;
for i=1:m-1
    for j=1:n-1
        if G(i,j) <= t_1
            G_t_1(i,j) = 0;
        end
        if G(i,j) <= t_2
            G_t_2(i,j) = 0;
        end
        if G(i,j) <= t_3
            G_t_3(i,j) = 0;
        end
    end
end
figure;imshow(uint8(G_t_1));title('Threshold = 10');
figure;imshow(uint8(G_t_2));title('Threshold = 90');
figure;imshow(uint8(G_t_3));title('Threshold = 190');
%% NMS
[m,n] = size(G_x);
for i=1:m
    for j=1:n
        if and(G_x(i,j) == 0,G_y(i,j) == 0)
            Theta(i,j)=0;
        else
            Theta(i,j)=atand(G_y(i,j)./G_x(i,j));
        end
    end
end
Theta = Theta+90;         %% edge direction
for i=2:m-1
    for j=2:n-1
        if (Theta(i,j)>0 && Theta(i,j)<22.5) || (Theta(i,j)>337.5 && Theta(i,j)<360)
            if G(i,j)<G(i+1,j) || G(i,j)<G(i-1,j)
                G(i,j) = 0;
            else
                continue;
            end
        elseif (Theta(i,j)>22.5 && Theta(i,j)<67.5) || (Theta(i,j)>292.5 && Theta(i,j)<337.5)
            if G(i,j)<G(i+1,j+1) || G(i,j)<G(i-1,j-1)
                G(i,j) = 0;
            else
                continue;
            end
        elseif (Theta(i,j)>67.5 && Theta(i,j)<112.5) || (Theta(i,j)>247.5 && Theta(i,j)<292.5)
            if G(i,j)<G(i,j+1) || G(i,j)<G(i,j-1)
                G(i,j) = 0;
            else
                continue;
            end
        elseif (Theta(i,j)>112.5 && Theta(i,j)<157.5) || (Theta(i,j)>202.5 && Theta(i,j)<247.5)
            if G(i,j)<G(i-1,j+1) || G(i,j)<G(i+1,j-1)
                G(i,j) = 0;
            else
                continue;
            end
        end
    end
end
figure;imshow(uint8(G));title('Non Maximum Suppression');