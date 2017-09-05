%% Arduino Group Project: Read Serial from an Arduino
% This code will collect data formatted as a string over the 
% light level for the course of that time using the connected Arduino
% Hardware.

% Revised by: Portland Community College Students in ENGR114 Summer 2017
% Revised on: 6/7/17
% Description: Code for reading pH levels of solutions


%%
clc,clear all, close all

duration = input('Enter duration of run time (in seconds): ');   % reads one time per second


%% Set up serial port and ensure it outputs data
% Change COM4 to the Port the Arduino is connected to

Port = '/dev/tty.usbserial-DN02SGSE';                % Port the Arduino is connected to
delete(instrfindall);         % Deletes any connected ports
a = serial(Port);             % Connect to the arduino in order to read information 
fopen(a);                     % Opens the serial port
pause(1);                     % Pause() for 1 second to make sure a connection is made
out1 = instrfind('Port',Port); % See if any Ports are open
out = fscanf(a) ;             % Read one time from the serial port


%% Set up the animated figure

figure                       % Creates a figure to plot the data for the pH levels
h = animatedline;            % Line that plots in the figure
ax = gca;                    % Returns the handle to the current axis in the current figure
ax.YGrid = 'on';             % Creates grid line on the Y-axis only
ax.YLim = [0 14];            % The serial output range
xlabel('Time (seconds)');    % Creates the X-axis label in the graph
ylabel('pH levels');         % Creates the Y-axis label in the graph
title('pH Sensor Readings'); % Creates the title for the graph


%% Set up the serial data to run

x=linspace(1,duration,duration);  % can change to alter the number of data points 
startTime = datetime('now');      % Starts the readings at the current time
saved_data = [0 0];               % Stores the data recorded

%   Clear the command window of user inputs to make way for counter
clc

%% ThingSpeak.com Parameters

%%%%%%%%%%%%% Change based on your person ThingSpeak.com Channel %%%%%%%%%%%%%%%%%%%%%%%%%%
ThingSpeak_channel = 'xxxxxx' %% MUST BE CHANGED TO YOUR PARTICULAR THINGSPEAK CHANNEL
ThingSpeak_API_write_key = 'xxxxxxxxxxxxxxxx'  %% MUST BE CHANGED TO YOUR PARTICULAR THINGSPEAK.COM API Write KEY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Collect serial data
bbb = 0;
pH_mean = [];
try
    for i=1:length(x)
        data = fscanf(a, '%s');             % Reads the data from the arduino code
        data = str2num(data);               % Converts the data to a number from a string
        saved_data(end+1) = data;           % Logs the data for all the points
        t =  datetime('now') - startTime;   % Updates the time
        addpoints(h,datenum(t),data)        % Adds the data point to the figure
        ax.XLim = datenum([0 t]);           % Updates the axis window as it runs 
        datetick('x','keeplimits')          % Changes tick labels into data-based labels while perserving the axis limits.   
        drawnow                             % Allows you to see the updates immediately in the figure
       
        if mod(i,20)==0     % Uploads every 20 seconds
           
% Calculate the mean of the pH and uploade it to Thingspeak
            size_of_saved_data = numel(saved_data);           % Calculate the size of saved_data matrix
            sum_of_saved_data = sum(saved_data(3:end));       % Calculate the sum of saved data
            pH_mean = (sum_of_saved_data / size_of_saved_data) - 0.1;% Calculate the mean pH levels 
            fprintf('\npH mean: %.3f\n',pH_mean)
            thingSpeakWrite(ThingSpeak_channel,pH_mean,'WriteKey',ThingSpeak_API_write_key)   % Uploads within the loop so it will upload every 15 seconds not after you decide to finish the time inputed.
        end
        pause(1)
    % count-up of seconds inline
    clc
    %fprintf(repmat('\b',1,bbb + 1)); %  \b is backspace command
    fprintf('Last pH mean: %.3f\n',pH_mean)
    msg = ['Elapsed time: ',num2str(i),' seconds...'];
    fprintf(msg);fprintf('\n');
    bbb=numel(msg);
    end
end


%% Shut down the serial port from the Arduino Red Board

fclose(a);      % Closes the serial port
delete(a)       % Deletes the serial port
clear a;        % Clears the serial port 
