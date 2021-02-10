%% QUESTION TWO: CHANGES IN AIR QUALITY OVER TIME
clc, clear, close all
%% Reading in data sets
    brisbane_CBD_2010 = readtable('brisbanecbd-aq-2010.csv');
    brisbane_CBD_2016 = readtable('brisbanecbd-aq-2016.csv');
    south_brisbane_2010 = readtable('southbrisbane-aq-2010.csv');
    south_brisbane_2016 = readtable('southbrisbane-aq-2016.csv');

brisbane_CBD_2010_PM10 = table2array(brisbane_CBD_2010(:,7));
south_brisbane_2010_PM10 = table2array(south_brisbane_2010(:,13));
 
brisbane_CBD_2016_PM10 = table2array(brisbane_CBD_2016(:,11));
south_brisbane_2016_PM10 = table2array(south_brisbane_2016(:,13));

%% Removing 'NaN' from Array
    brisbane_CBD_2010_PM10(isnan(brisbane_CBD_2010_PM10)) = [];
    brisbane_CBD_2016_PM10(isnan(brisbane_CBD_2016_PM10)) = [];

    south_brisbane_2010_PM10(isnan(south_brisbane_2010_PM10)) = [];
    south_brisbane_2016_PM10(isnan(south_brisbane_2016_PM10)) = [];

%% Visualsing Data: Scatter Plot - is the data related across sites
x_2010_CBD = (1:8558).';
x_2010_South = (1:7363).';
x_2016_CBD = (1:8418).';
x_2016_South = (1:8290).';

population_CBD_2010 = fit(x_2010_CBD, brisbane_CBD_2010_PM10,'poly1','Normalize','on');
population_South_2010 = fit(x_2010_South, south_brisbane_2010_PM10,'poly1','Normalize','on');
population_CBD_2016 = fit(x_2016_CBD, brisbane_CBD_2016_PM10,'poly1','Normalize','on');
population_South_2016 = fit(x_2016_South, south_brisbane_2016_PM10,'poly1','Normalize','on');

figure
    subplot(2,1,1)
    scatter(x_2010_CBD, brisbane_CBD_2010_PM10, 'r'), hold on
    plot(population_CBD_2010, 'k')
    xlim([-10 8500]), ylim([0 70])
    legend('Pollution Data','Linear Relationship')
    title('Air Pollution Data: Brisbane CBD 2010')
    xlabel('Test Samples'), ylabel('PM10 gm^{3}'), grid on

    subplot(2,1,2)
    scatter(x_2010_South, south_brisbane_2010_PM10, 'g'), hold on
    plot(population_South_2010, 'k')
    xlim([-10 8500]), ylim([0 70])
    legend('Pollution Data','Linear Relationship')
    title('Air Pollution Data: South Brisbane 2010')
    xlabel('Test Samples'), ylabel('PM10 gm^{3}'), grid on

figure
    subplot(2,1,1)
    scatter(x_2016_CBD, brisbane_CBD_2016_PM10, 'r'), hold on
    plot(population_CBD_2016, 'k')
    xlim([-10 8500]), ylim([0 70])
    legend('Pollution Data','Linear Relationship')
    title('Air Pollution Data: Brisbane CBD 2016')
    xlabel('Test Samples'), ylabel('PM10 gm^{3}'), grid on

    subplot(2,1,2)
    scatter(x_2016_South, south_brisbane_2016_PM10, 'g'), hold on
    plot(population_South_2016, 'k')
    xlim([-10 8500]), ylim([0 70])
    legend('Pollution Data','Linear Relationship')
    title('Air Pollution Data: South Brisbane 2016')
    xlabel('Test Samples'), ylabel('PM10 gm^{3}'), grid on

%% Visualsing Data: Scatter Plot - has the data changed from 2010 to 2016
figure
    subplot(2,1,1)
    scatter(x_2010_CBD, brisbane_CBD_2010_PM10, 'r'), hold on
    plot(population_CBD_2010, 'k')
    xlim([-10 8500]), ylim([0 70])
    legend('Pollution Data','Linear Relationship')
    title('Air Pollution Data: Brisbane CBD 2010')
    xlabel('Test Samples'), ylabel('PM10 gm^{3}'), grid on

    subplot(2,1,2)
    scatter(x_2016_CBD, brisbane_CBD_2016_PM10, 'g'), hold on
    plot(population_CBD_2016, 'k')
    xlim([-10 8500]), ylim([0 70])
    legend('Pollution Data','Linear Relationship')
    title('Air Pollution Data: Brisbane CBD 2016')
    xlabel('Test Samples'), ylabel('PM10 gm^{3}'), grid on

figure
    subplot(2,1,1)
    scatter(x_2010_South, south_brisbane_2010_PM10, 'r'), hold on
    plot(population_South_2010, 'k')
    xlim([-10 8500]), ylim([0 70])
    legend('Pollution Data','Linear Relationship')
    title('Air Pollution Data: South Brisbane 2010')
    xlabel('Test Samples'), ylabel('PM10 gm^{3}'), grid on

    subplot(2,1,2)
    scatter(x_2016_South, south_brisbane_2016_PM10, 'g'), hold on
    plot(population_South_2016, 'k')
    xlim([-10 8500]), ylim([0 70])
    legend('Pollution Data','Linear Relationship')
    title('Air Pollution Data: South Brisbane 2016')
    xlabel('Test Samples'), ylabel('PM10 gm^{3}'), grid on
    
%% Correlation Data
    correlation_2010 = corrcoef(brisbane_CBD_2010_PM10, south_brisbane_2010_PM10, 'Rows','Complete');
    correlation_2016 = corrcoef(brisbane_CBD_2016_PM16, south_brisbane_2016_PM10, 'Rows','Complete');
    
%% Mean, Median, Median Absolute Deviation
    mean_CBD_2010 = mean(brisbane_CBD_2010_PM10);
    mean_CBD_2016 = mean(brisbane_CBD_2016_PM10);

    mean_south_2010 = mean(south_brisbane_2010_PM10);
    mean_south_2016 = mean(south_brisbane_2016_PM10);

    
    median_CBD_2010 = median(brisbane_CBD_2010_PM10);
    median_CBD_2016 = median(brisbane_CBD_2016_PM10);

    median_south_2010 = median(south_brisbane_2010_PM10);
    median_south_2016 = median(south_brisbane_2016_PM10);

    
    mad_CBD_2010 = mad(brisbane_CBD_2010_PM10);
    mad_CBD_2016 = mad(brisbane_CBD_2016_PM10);

    mad_south_2010 = mad(south_brisbane_2010_PM10);
    mad_south_2016 = mad(south_brisbane_2016_PM10);