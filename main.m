clc;
clear;
close all;

%% A/D Converter
% In this step we are converting the given audio file into bits which are
% to be used as the input to the model
[audio, fs] = audioread("audio.wav");
audio_normalize = int16(audio * 32767);
audio_binary = dec2bin(typecast(audio_normalize(:), 'uint16'), 16);
binary_vector = audio_binary(:);
short_vector = binary_vector(1:floor(length(binary_vector)/4));
% disp(length(short_vector));
% disp(binary_vector);

Ts = 1/fs;

%% Encoding
% In this step we encode the above generated binary data based on 4-ary ASK
% modulation
encoding = [];
for i = 1:2:length(short_vector)-1
    a = data(i); 
    b = data(i+1);
    if (a == '0') && (b == '0')
        encoding = [encoding 0];
    elseif (a == '0') && (b == '1')
        encoding = [encoding 1];
    elseif (a == '1') && (b == '0')
        encoding = [encoding 2];
    else % (a == '1') && (b == '1')
        encoding = [encoding 3];
    end
end