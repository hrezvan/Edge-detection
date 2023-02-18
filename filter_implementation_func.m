function output_image = filter_implementation_func(image, filter)
[m,n] = size(image);
a = length(filter);
% for i=1:m-a-1
%     for j=1:n-a-1
% % % % % % output_image = image;
% for i=1:m-a+1
%     for j=1:n-a+1
for i=1:m-2*floor(a/2)
    for j=1:n-2*floor(a/2)
%         output_image(i,j) = image(i,j)*filter(1,1)+image(i,j+1)*filter(1,2)+image(i,j+2)*filter(1,3)+...
%             image(i+1,j)*filter(2,1)+image(i+1,j+1)*filter(2,2)+image(i+1,j+2)*filter(2,3)+...
%             image(i+2,j)*filter(3,1)+image(i+2,j+1)*filter(3,2)+image(i+2,j+2)*filter(3,3);
%     output_image(i+a-3,j+a-3) = uint8(sum(sum(double(image(i:i+a-1,j:j+a-1)).*filter)));
        output_image(i,j) = sum(sum(double(image(i:i+a-1,j:j+a-1)).*filter));
%         output_image(i+floor(a/2),j+floor(a/2)) = sum(sum(double(image(i:i+a-1,j:j+a-1)).*filter));
    end
end
end