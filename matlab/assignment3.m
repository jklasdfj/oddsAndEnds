%assingment 3
% https://www.mathworks.com/help/images/import-export-and-conversion.html

ct1 = imread('CTImage1.jpeg');
ct2 = imread('CTImage2.jpg');
whos

% get single slice, of each image matrix 2d 1200x1432 or 1200x1412

ct1slice = squeeze (ct1(:,:,3));
ct2slice = squeeze(ct2(:,:,3));

%reduce to 1/4 original size, RESIZE THE original or the slice?

ct1quarter = imresize(ct1slice, 0.25);
ct2quarter = imresize(ct2slice, 0.25);

% plot resized images beside originals

figure(1)
hold on
imshowpair(ct1slice, ct1quarter, 'montage');
title('CTImage1 Original and 1/4 Size');
hold off

figure(2)
hold on
imshowpair(ct2slice,ct2quarter,'montage');
title('CTImage2 Original and 1/4 Size');
hold off

%semicolons fuckign me up?
% need 256?
ct1histogram= imhist(ct1quarter,256); % matlab is smart enough to automatically use 256 for grayscale
ct2histogram = imhist(ct2quarter);

% obtain image histogram and histogram equalization for each resized image
% plot original histograms, equalized histograms, and equalized images

ct1quarterEqualizedImage = histeq(ct1quarter); % spits out an image
ct2quarterEqualizedImage = histeq(ct2quarter);

equalizedct1hist = imhist(ct1quarterEqualizedImage,256);
equalizedct2hist = imhist(ct2quarterEqualizedImage);

figure(3)
hold on
imshowpair(ct1quarter,ct1quarterEqualizedImage, 'montage');
title('CT1 Quarter and Equalized Comparison');
hold off

figure(4)
hold on
imshowpair(ct2quarter,ct2quarterEqualizedImage, 'montage');
title('CT2 Quarter and Equalized Comparison');
hold off

% subplot in the image histograms of the equalized quarter images
figure(5)
hold on
subplot(2,1,1);
imhist(ct1quarter,256);
title('CT1 Quarter Histogram');
subplot(2,1,2);
imhist(ct1quarterEqualizedImage,256);
title('CT1 Quarter Equalized Histogram');
hold off

figure(6)
hold on
subplot(2,1,1);
histogram(ct2histogram,256);
imhist(ct2quarter);
title('CT2 Quarter Histogram');
subplot(2,1,2);
imhist(ct2quarterEqualizedImage);
title('CT2 Quarter Equalized Histogram');
hold off

% calculate mean abosulte difference between original resized images, and
% equalized images

diff1 = imabsdiff(ct1quarter, ct1quarterEqualizedImage);
diff2 = imabsdiff(ct2quarter, ct2quarterEqualizedImage);

means1=mean(diff1);
means2=mean(diff2);

trueMean1= mean(means1)
trueMean2 = mean(means2)
