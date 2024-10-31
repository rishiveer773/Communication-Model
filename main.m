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
% disp(binary_vector);

