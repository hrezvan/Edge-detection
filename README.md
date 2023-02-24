# Edge-detection
In this project we have two targets:
  1. Smoothing images
  2. Edge detection

first of all we prepare an image and we make it noisy by using "imnoise" syntax.
![2](https://user-images.githubusercontent.com/60284829/221173740-071ed921-4a5c-47b4-a7a0-b2230d546d7d.PNG)

then we try to smooth it with two distinct methods:
1. Averaging filter:<br />
![3](https://user-images.githubusercontent.com/60284829/221173825-d7e55ed8-b6ff-4d1c-b79f-a8aca221256f.PNG)


2. Gaussian filter: these filters are made in different sigma values and sizes. e.g sigma = 0.1, 0.5, 1, 1.5, 3
I have written a function called filter_implementation to traverse the filter on image. it's consisting of two for loops and in each loop, filter moves on the image and pixel values will be calculated by convoluting filter in image.<br />
![3](https://user-images.githubusercontent.com/60284829/221175690-20ae5e2b-b5c4-4c09-97eb-dbf07829271e.PNG)<br />

![4](https://user-images.githubusercontent.com/60284829/221175144-1fe84714-a50e-46fb-b652-4d27453d8185.PNG)

![4](https://user-images.githubusercontent.com/60284829/221173896-a36280b4-7c13-46a2-9476-7e6fec3cc089.PNG)
![5](https://user-images.githubusercontent.com/60284829/221173918-5d0c4042-08f5-4ec9-bbc3-dbea03dc5364.PNG)
![6](https://user-images.githubusercontent.com/60284829/221173952-1ea69f73-151b-449c-b21b-bb5ac7eaea73.PNG)
![7](https://user-images.githubusercontent.com/60284829/221173975-221a8655-6a97-484d-b40a-4aa14e250a53.PNG)
![8](https://user-images.githubusercontent.com/60284829/221174003-056e1b43-f9b1-47bf-a8b8-f144dc9bb768.PNG)
<br />
As we can as the larger sigma, the blurrier image becomes. <br />

then we try to detect edges. mostly there are two methods to detect edges: 1. first derivatives which is non-maximum suppresion:
![18](https://user-images.githubusercontent.com/60284829/221174048-d2d86afa-dddd-4cac-ae4b-5009838c90b8.PNG)


2. second derivatives which is implementing LoG and then detecting zero crossings using Greenfield method:
![2](https://user-images.githubusercontent.com/60284829/221175187-df6420ca-9478-4fa0-aaf0-e39a005addc2.PNG)

![23](https://user-images.githubusercontent.com/60284829/221174148-0565487f-0bcb-4c7b-94cf-491e2bfd750d.PNG)
![24](https://user-images.githubusercontent.com/60284829/221174159-e65a7fa6-350c-4ea6-846a-c1ba06241a34.PNG)
