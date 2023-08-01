Image_dir = 'temp';
listing = cat(1, dir(fullfile(Image_dir, '*.jpg')));
% The final output will be saved in this directory:
result_dir = fullfile(Image_dir, 'result');
% Preparations for saving results.
if ~exist(result_dir, 'dir'), mkdir(result_dir); end

addpath(genpath('.'));

for i_img = 1:length(listing)
    % Input = imread(fullfile(Image_dir,listing(i_img).name));
    im=imread(fullfile(Image_dir,listing(i_img).name));
    tic
    [im_vign_corrected,im_vignetting]=vignCorrection_nonPara(im,0.25);%you may need to input the second parameter and adapt it to the vignetting in the input image
    toc
    imwrite(im_vign_corrected, fullfile(result_dir,listing(i_img).name));
end
