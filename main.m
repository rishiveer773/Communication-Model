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


% Taking the input from the user to decide which modulation scheme to
% proceed with
prompt = "State with which of the following modulation schemes to proceed " + ...
    "with: 4-ary ASK; 4-ary FSK; BPSK; QPSK type 1; QPSK type 2 or 16-ary QAM";
name=input(prompt+'\n', 's');
if name == "4-ary ASK"
    todo = four_ary_ask(short_vector);
    % disp(todo);
elseif name == "4-ary FSK"
    todo = four_ary_fsk(short_vector);
elseif name == "BPSK"
    disp("BPSK")
elseif name == "QPSK type 1"
    disp("Type 1 QPSK")
elseif name == "QPSK type 2"
    disp("Type 2 QPSK")
elseif name == "16-ary QAM"
    disp("QAM")
else
    disp("Wrong input, please try again..")
end