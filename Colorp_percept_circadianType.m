%Purpose: identify which color percepts of "the dress" are associated with
%circadian types
%Input: data contained in workspace "Assignment2_data.mat"
%Output: histograms for color percept and circadian type
%Assumptions/Dependencies:none
%V1 2/17/2016

%% 0 Initialization
clear all, close all, clc;                                                  %clears workspace to start with a clean slate

%% 1 Loader
load 'Assignment2_data.mat' ;                                               %Loads the data into the workspace


%% 2 Loop for Color Percepts

numericalDATA = [];                                                         %create the empty cell matrix
%First loop will recode the color percepts into numeric value

for ii = 1:length(DATA);                                                    %Iterations for this loop will go from 1 to the length of DATA (518)
    if strcmp(DATA{ii,1},'White/Gold') == 1;                                %If string in iith row, first column of DATA is the same as 'white/gold'
        numericalDATA(ii,1) = 1;                                            %Then the iith row, first column of numericalDATA is 1
    elseif strcmp(DATA{ii,1},'Blue/Black') == 1;                            %%If string in iith row, first column of DATA is the same as 'Blue/Black'
        numericalDATA(ii,1) = 2;                                            %Then the iith row, first column of numericalDATA is 2
    elseif strcmp(DATA{ii,1},'White/Black') == 1;                           %If string in iith row, first column of DATA is the same as 'White/Black'
         numericalDATA(ii,1) = 3;                                           %Then the iith row, first column of numericalDATA is 3
    elseif strcmp(DATA{ii,1},'Blue/Gold') == 1;                             %If string in iith row, first column of DATA is the same as 'Blue/Gold'
         numericalDATA(ii,1) = 4;                                           %Then the iith row, first column of numericalDATA is 4
    elseif strcmp(DATA{ii,1},'It was quickly switching between white/gold and blue/black') == 1;%If string in iith row, first column of DATA is the same as 'It was quickly...'
         numericalDATA(ii,1) = 5;                                           %Then the iith row, first column of numericalDATA is 5
    else                                                                    %otherwise
        numericalDATA(ii,1) = 6;                                            %anything else or empty indices in DATA,>>iith row, first column of numericalDATA is 6
    end                                                                     %End of if-statement
end                                                                         %End of for-loop

%% 3 Loop for Circadian Types
%Second loop will recode the circadian types into numeric values

for ii = 1:length(DATA);                                                    %Iterations for this loop will go from 1 to the length of DATA (518)
    if strcmp(DATA{ii,2},'Strong owl') == 1;                                %If string in iith row, second column of DATA is the same as 'Strong owl'
        numericalDATA(ii,2) = 1;                                            %Then the iith row, second column of numericalDATA is 1
    elseif strcmp(DATA{ii,2},'Owl') == 1;                                   %If string in iith row, second column of DATA is the same as 'Owl'
        numericalDATA(ii,2) = 2;                                            %Then the iith row, second column of numericalDATA is 2
    elseif strcmp(DATA{ii,2},'Lark') == 1;                                  %If string in iith row, second column of DATA is the same as 'Lark'
         numericalDATA(ii,2) = 3;                                           %Then the iith row, second column of numericalDATA is 3
    elseif strcmp(DATA{ii,2},'Strong lark') == 1;                           %If string in iith row, second column of DATA is the same as 'Strong lark'
         numericalDATA(ii,2) = 4;                                           %Then the iith row, second column of numericalDATA is 4
    else                                                                    %otherwise
        numericalDATA(ii,2) = 5;                                            %anything else or empty indices in DATA,>>iith row, second column of numericalDATA is 5
    end                                                                     %End of if-statement
end                                                                         %End of for-loop


%% 4 Histogram of Color Responses

colorPercept = numericalDATA(:,1);                                          %assign variable colorPercept as first column of numericalDATA

figure;                                                                     %create a figure
h = histogram(colorPercept);                                                %assign h as a histogram of color percepts
xlabel('Color Percepts');                                                   %label the x axis
ylabel('Count');                                                            %label the y axis
title('Self Reported Color Percepts');                                      %title the histogram
set(gca,'Fontsize',12);                                                     %set label font size to 12
shg;                                                                        %show graph

%% 5 Historgram of Circadian Types

circType = numericalDATA(:,2);                                              %assign variable circType as second column of numericalDATA

figure;                                                                     %create a figure
h2 = histogram(circType);                                                   %assign h2 as a histogram of circadian type
xlabel('Circadian Type');                                                   %label the x axis
ylabel('Count');                                                            %label the y axis
title('Self Reported Circadian Type');                                      %title the histogram
set(gca,'Fontsize',12);                                                     %set label font size to 12
set(gca, 'XTick',[1 2 3 4 5])                                               %set axis tick marks to only whole units
shg;                                                                        %show graph