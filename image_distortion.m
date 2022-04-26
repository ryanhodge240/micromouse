clear; clc; close all;

I = imread('Michelangelo.png');

for j = 1:4
    I = imrotate(I, 90);
    for i = 1:100
        c = [(i) (size(I, 2) - i) 0 size(I, 2)]';
        r = [size(I, 1) size(I, 1) 0 0]';
        base = [0 11; 11 11; 0 0; 11 0];
        tf = fitgeotrans([c r],base*80,'projective');
        [xf1, xf1_ref] = imwarp(I,tf);
        count = (j-1)*100 + i;
        name = ['TrainingData/Michelangelo/img' num2str(count) '.png'];
        imwrite(xf1, name);
    end
end