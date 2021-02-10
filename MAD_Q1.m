%% QUESTION ONE: RECOMMENDING A BOLT SUPPLIER
clc, clear, close all
%% Reading in data sets,
    bolt_data = readtable('Bolts.csv');

%% Allocate the Data to its Respective Manufacturer
    allnutt = bolt_data(strcmp(bolt_data.Manufacturer,'Allnutt'),:);
    boltzman = bolt_data(strcmp(bolt_data.Manufacturer,'Boltzmann'),:);
    coachers = bolt_data(strcmp(bolt_data.Manufacturer,'Coachers'),:);
    
%% Converting Strength Data into an Array
    allnutt_data = allnutt(:,3);
    allnutt_data = allnutt_data{:,:};
    
    boltzman_data = boltzman(:,3);
    boltzman_data = boltzman_data{:,:};

    coachers_data = coachers(:,3);
    coachers_data = coachers_data{:,:};

%% Visualising Data: Raw Data Plot
plot(bolt_data.Strength(1:200), 'r', 'LineWidth', 0.75)
    hold on
plot(bolt_data.Strength(201:399), 'k', 'LineWidth', 0.75)
plot(bolt_data.Strength(400:598), 'g', 'LineWidth', 0.75)
    hold off
    lgd = legend('Allnutt','Boltzman', 'Coachers');
    title(lgd,'Manufacturers')
    title ('ASTM A325M8S Heavy Hex Bolt Tensile Strengths')
    ylabel('Tensile Strenght'), xlabel('Bolts per Manufacturers'), grid on
    
%% Visualsing Data: Box Plot
h1 = subplot(1,3,1);
boxplot(allnutt_data), ylim([830 870])
    title('Manufacturer: Allnutt'), grid on
h2 = subplot(1,3,2);
boxplot(boltzman_data), ylim([830 870])
    title('Manufacturer: Boltzmann'), grid on
h3 = subplot(1,3,3);
boxplot(coachers_data), ylim([830 870])
    title('Manufacturer: Coachers'), grid on

p1 = get(h1,'position');
p3 = get(h3,'position');
height = p1(2)+p1(4)-p3(2);
h3 = axes('position',[p3(2) p3(3) p3(3) height],'visible','off');
h_label=ylabel('Tensile Strength MPa', 'visible', 'on');

%% Visualising Data: Scatter Plot
x = (1:200);
subplot(1,3,1)
scatter(x, allnutt_data, 'r')
    title('Manufacturer: Allnutt'), ylim([810 880])
    xlabel('ID Code'), ylabel('Tensile Strength MPa'), grid on
subplot(1,3,2)
scatter(x, boltzman_data, 'k')
    title('Manufacturer: Boltzmann'), ylim([810 880])
    xlabel('ID Code'), ylabel('Tensile Strength MPa'), grid on
subplot(1,3,3)
scatter(x, coachers_data, 'g')
    title('Manufacturer: Coachers'), ylim([810 880])
    xlabel('ID Code'), ylabel('Tensile Strength MPa'), grid on

%% Using Summary Statistics to Find the Most Suitable Manufacturer    
% Lowest tensile strength,
    allnutt_min_strength = min(allnutt_data);
    boltzman_min_strength = min(boltzman_data);
    coachers_min_strength = min(coachers_data);

%Highest tensile strength,
    allnutt_max_strength = max(allnutt_data);
    boltzman_max_strength = max(boltzman_data);
    coachers_max_strength = max(coachers_data);

% Mean tensile strength,
    allnutt_mean_strength = mean(allnutt_data);
    boltzman_mean_strength = mean(boltzman_data);
    coachers_mean_strength = mean(coachers_data);

% Median tensile strength,
    allnutt_median_strength = median(allnutt_data);
    boltzman_median_strength = median(boltzman_data);
    coachers_median_strength = median(coachers_data);

% Median absolute deviation,
    allnutt_mad_strength = mad(allnutt_data);
    boltzman_mad_strength = mad(boltzman_data);
    coachers_mad_strength = mad(coachers_data);