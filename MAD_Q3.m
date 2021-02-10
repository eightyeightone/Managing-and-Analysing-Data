%% QUESTION THREE: VIEWING THE GRAPHS
clc, clear, close all
%% Part A: Automotive Excellence: Production Amounts in 2017
% Reading in data set for 3A,
graph_3A = readtable('GraphQ3a.csv');

%% Labelling Data Components
    product = graph_3A(:,1);
    minimum = graph_3A(:,2);
    maximum = graph_3A(:,3);
    median = graph_3A(:,4);

    minimum = minimum{:,:};
    maximum = maximum{:,:};
    median = median{:,:};
    product = product{:,:};

%% Visualising Data: Automotive Excellence: Production Amounts in 2017
x = (1:12);
data = [minimum, maximum, median];
    bar(data), hold on
    set(gca, 'XTick', x, 'XTickLabel', product)
    ylabel('Production Numbers Required'), xlabel('Products')
    title('Automotive Excellence: Production Amounts for January 2017')
    lgd = legend('Minimum', 'Maximum', 'Median');
    title(lgd,'Mesured Data'), grid on


%% Part B: Mean Time to Failure
% Reading in data set for 3B,
graph_3B = readtable('GraphQ3b.csv');

%% Labelling Data Components
    sizes = graph_3B(:,1);
    mean_fail = graph_3B(:,2);
    
    sizes = sizes{:,:};
    mean_fail = mean_fail{:,:};
    
%% Visualising Data: Automotive Excellence: Mean Time to Failure
mean_fail_ascend = [800; 1037; 1263; 1373; 1429; 1459; 2552; 1265; 2106; 2206];

x = [5; 10; 15; 35; 50; 100; 150; 350; 450; 500;];

% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x, mean_fail_ascend );

% Set up fittype and options.
ft = fittype( 'power1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [491.834703038381 0.267152537291136];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure
    plot(fitresult, xData, yData)
    xlabel('Gasket Size (mm)'), ylabel('Mean Time to Failure')
    xlim([-50 600]), ylim([0 3000])
    title('Automotive Excellence: Mean Time to Failure per Gasket Size')
    lgd = legend('Mean Time to Failure', 'Linear Fit: 766.1x^0^.^6^1^1');
    title(lgd,'Mesured Data'), grid on

    