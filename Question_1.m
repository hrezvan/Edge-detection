clc;
clear;
close all;

img = rgb2gray(imread('first_img2.jpg'));
imshow(img);title('Main Image[grayscale]');
noisy_img = imnoise(img,'salt & pepper',0.01);
figure;imshow(noisy_img);title('Noisy Image');
%% Mean Filter
mean_filter = ones(3,3)/9;
mean_filtered_img = filter_implementation_func(noisy_img,mean_filter);
figure;imshow(uint8(mean_filtered_img));title('Mean filter');
%% Gaussian
sigma_0point1_gaussian_filter = gaussian_filter_maker(3,0.1);
gaussian_filtered_img_sigma_0point1 = filter_implementation_func(noisy_img,sigma_0point1_gaussian_filter);
figure;imshow(uint8(gaussian_filtered_img_sigma_0point1));title('\sigma = 0.1');

sigma_0point5_gaussian_filter = gaussian_filter_maker(5,0.5);
gaussian_filtered_img_sigma_0point5 = filter_implementation_func(noisy_img,sigma_0point5_gaussian_filter);
figure;imshow(uint8(gaussian_filtered_img_sigma_0point5));title('\sigma = 0.5');

sigma_1_gaussian_filter = gaussian_filter_maker(7,1);
gaussian_filtered_img_sigma_1 = filter_implementation_func(noisy_img,sigma_1_gaussian_filter);
figure;imshow(uint8(gaussian_filtered_img_sigma_1));title('\sigma = 1');

sigma_1point5_gaussian_filter = gaussian_filter_maker(11,1.5);
gaussian_filtered_img_sigma_1point5 = filter_implementation_func(noisy_img,sigma_1point5_gaussian_filter);
figure;imshow(uint8(gaussian_filtered_img_sigma_1point5));title('\sigma = 1.5');

sigma_3_gaussian_filter = gaussian_filter_maker(19,3);
gaussian_filtered_img_sigma_3 = filter_implementation_func(noisy_img,sigma_3_gaussian_filter);
figure;imshow(uint8(gaussian_filtered_img_sigma_3));title('\sigma = 3');


%% First x then y
[m,n] = size(noisy_img);
[G_x_0_point_1,G_y_0_point_1] = gaussian_x_y_filter_maker(3,0.1);
gaussian_filtered_img_sigma_0_point_1_xy = x_y_implementation(G_x_0_point_1,G_y_0_point_1,noisy_img);
figure;imshow(uint8(gaussian_filtered_img_sigma_0_point_1_xy));title('\sigma = 0.1;x then y');

[G_x_0_point_5,G_y_0_point_5] = gaussian_x_y_filter_maker(5,0.5);
gaussian_filtered_img_sigma_0_point_5_xy = x_y_implementation(G_x_0_point_5,G_y_0_point_5,noisy_img);
figure;imshow(uint8(gaussian_filtered_img_sigma_0_point_5_xy));title('\sigma = 0.5;x then y');

[G_x_1,G_y_1] = gaussian_x_y_filter_maker(7,1);
gaussian_filtered_img_sigma_1_xy = x_y_implementation(G_x_1,G_y_1,noisy_img);
figure;imshow(uint8(gaussian_filtered_img_sigma_1_xy));title('\sigma = 1;x then y');

[G_x_1_point_5,G_y_1_point_5] = gaussian_x_y_filter_maker(11,1.5);
gaussian_filtered_img_sigma_1_point_5_xy = x_y_implementation(G_x_1_point_5,G_y_1_point_5,noisy_img);
figure;imshow(uint8(gaussian_filtered_img_sigma_1_point_5_xy));title('\sigma = 1.5;x then y');

[G_x_3,G_y_3] = gaussian_x_y_filter_maker(19,3);
gaussian_filtered_img_sigma_3_xy = x_y_implementation(G_x_3,G_y_3,noisy_img);
figure;imshow(uint8(gaussian_filtered_img_sigma_3_xy));title('\sigma = 3;x then y');

function G = gaussian_filter_maker(dimension,sigma)
for i=1:dimension
    for j=1:dimension
        G(i,j) = (1/(2*pi*(sigma^2)))*exp(((i-floor(dimension/2))^2+(j-floor(dimension/2))^2)/(-2*sigma^2));
    end
end
G = G/(sum(sum(G)));              %% Dividing by total Weights
end

function [G_x,G_y] = gaussian_x_y_filter_maker(dimension,sigma)
j=-(dimension-1)/2;
i=j;
for j=1:dimension
        G_x(1,j) = (1/(sqrt(2*pi)*sigma))*exp((-(j-floor(dimension/2))^2)/(2*sigma^2));
        j=j+1;
end
for i=1:dimension
        G_y(i,1) = (1/(sqrt(2*pi)*sigma))*exp((-(i-floor(dimension/2))^2)/(2*sigma^2));
        i=i+1;
end
G_x = G_x/(sum(sum(G_x)));
G_y = G_y/(sum(sum(G_y)));
end
function final_image = x_y_implementation(G_x,G_y,image)
[m,n] = size(image);
for i=1:m
    for j=1:n-length(G_x)+1
        gaussian_filtered_img_sigma_0_point_1_x(i,j) = sum(G_x.*double(image(i,j:j+length(G_x)-1)));
    end
end
for i=1:m-length(G_x)+1
    for j=1:n-length(G_x)+1
        final_image(i,j) = sum(G_y.*gaussian_filtered_img_sigma_0_point_1_x(i:i+length(G_x)-1,j));
    end
end
end
