%% QUESTION FIVE: PREDICTING MISSING BIKEWAY DATA
clc, clear, close all
%% Reading in Data Set - BIKE DATA
bike_counts_2014 = readtable('Bike-Ped-Auto-Counts-2014.csv');
bike_counts_2015 = readtable('Bike-Ped-Auto-Counts-2015.csv');
bike_counts_2016 = readtable('Bike-Ped-Auto-Counts-2016.csv');
bike_counts_location = readtable('Bikeway-counts---Counter-locations.csv');

%% Reading in Data Set - WEATHER DATA
rainfall_2014 = readtable('IDCJAC0009_040913_2014_Data.csv');
max_temp_2014 = readtable('IDCJAC0010_040913_2014_Data.csv');
min_temp_2014 = readtable('IDCJAC0011_040913_2014_Data.csv');
solar_exposure_2014 =readtable('IDCJAC0016_040913_2014_Data.csv');

rainfall_2015 = readtable('IDCJAC0009_040913_2015_Data.csv');
max_temp_2015 = readtable('IDCJAC0010_040913_2015_Data.csv');
min_temp_2015 = readtable('IDCJAC0011_040913_2015_Data.csv');
solar_exposure_2015 =readtable('IDCJAC0016_040913_2015_Data.csv');

rainfall_2016 = readtable('IDCJAC0009_040913_2016_Data.csv');
max_temp_2016 = readtable('IDCJAC0010_040913_2016_Data.csv');
min_temp_2016 = readtable('IDCJAC0011_040913_2016_Data.csv');
solar_exposure_2016 =readtable('IDCJAC0016_040913_2016_Data.csv');

%% Data for 2014 csv Set - BIKE 
bi_centennial_2014 = bike_counts_2014.BicentennialBikewayCyclistsInbound;
go_between_2014 = bike_counts_2014.GoBetweenBridgeCyclistsInbound;
kangaroo_point_2014 = bike_counts_2014.KangarooPointBikewayCyclistsInbound;
norman_park_2014 = bike_counts_2014.NormanParkCyclistsInbound;
riverwalk_2014 = bike_counts_2014.RiverwalkCyclistsInbound;
story_bridge_west_2014 = bike_counts_2014.StoryBridgeWestCyclistsInbound;

%% Data for 2015 csv Set - BIKE
bi_centennial_2015 = bike_counts_2015.BicentennialBikewayCyclistsInbound;
go_between_2015 = bike_counts_2015.GoBetweenBridgeCyclistsInbound;
kangaroo_point_2015 = bike_counts_2015.KangarooPointBikewayCyclistsInbound;
norman_park_2015 = bike_counts_2015.NormanParkCyclistsInbound;
riverwalk_2015 = bike_counts_2015.RiverwalkCyclistsInbound;
story_bridge_west_2015 = bike_counts_2015.StoryBridgeWestCyclistsInbound;

%% Data for 2016 csv Set - BIKE
bi_centennial_2016 = bike_counts_2016.BicentennialBikewayCyclistsInbound;
go_between_2016 = bike_counts_2016.GoBetweenBridgeCyclistsInbound;
kangaroo_point_2016 = bike_counts_2016.KangarooPointBikewayCyclistsInbound;
norman_park_2016 = bike_counts_2016.NormanParkCyclistsInbound;
riverwalk_2016 = bike_counts_2016.RiverwalkCyclistsInbound;
story_bridge_west_2016 = bike_counts_2016.StoryBridgeWestCyclistsInbound;

%% Visualsing Data: Scatter Plot for 2014 Raw Data
x = (1:365);
figure
    h1 = subplot(6,1,1);
    scatter(x, bi_centennial_2014)
    xlim([0 375])
    title('Bi-Centennial Bikeway'), grid on

    h2 = subplot(6,1,2);
    scatter(x, go_between_2014)
    xlim([0 375])
    title('Go-Between Bikeway'), grid on

    h3 = subplot(6,1,3);
    scatter(x, kangaroo_point_2014)
    xlim([0 375])
    title('Kangaroo Point Bikeway'), grid on

    h4 = subplot(6,1,4);
    scatter(x, norman_park_2014)
    xlim([0 375])
    title('Norman Park Bikeway'), grid on

    h5 = subplot(6,1,5);
    scatter(x, riverwalk_2014)
    xlim([0 375])
    title('Riverwalk Bikeway'), grid on

    h6 = subplot(6,1,6);
    scatter(x, story_bridge_west_2014)
    xlim([0 375])
    title('Story Bridge West Bikeway'), grid on
    xlabel('Days in the Year')
    
suptitle('\bfRaw Data Collected in 2014');

p1 = get(h1,'position');
p3 = get(h6,'position');
height = p1(2)+p1(4)-p3(2);
h3 = axes('position',[p3(1) p3(2) p3(1) height],'visible','off');
h_label=ylabel('Number of Bikes in use Per Day', 'visible', 'on');

%% Visualsing Data: Scatter Plot for 2015 Raw Data
figure
    h1 = subplot(6,1,1);
    scatter(x, bi_centennial_2015)
    xlim([0 375])
    title('Bi-Centennial Bikeway'), grid on

    h2 = subplot(6,1,2);
    scatter(x, go_between_2015)
    xlim([0 375])
    title('Go-Between Bikeway'), grid on

    h3 = subplot(6,1,3);
    scatter(x, kangaroo_point_2015)
    xlim([0 375])
    title('Kangaroo Point Bikeway'), grid on

    h4 = subplot(6,1,4);
    scatter(x, norman_park_2015)
    xlim([0 375])
    title('Norman Park Bikeway'), grid on

    h5 = subplot(6,1,5);
    scatter(x, riverwalk_2015)
    xlim([0 375])
    title('Riverwalk Bikeway'), grid on

    h6 = subplot(6,1,6);
    scatter(x, story_bridge_west_2015)    
    xlim([0 375])
    title('Story Bridge West Bikeway'), grid on
    xlabel('Days in the Year')
    
suptitle('\bfRaw Data Collected in 2015');

p1 = get(h1,'position');
p3 = get(h6,'position');
height = p1(2)+p1(4)-p3(2);
h3 = axes('position',[p3(1) p3(2) p3(1) height],'visible','off');
h_label=ylabel('Number of Bikes in use Per Day', 'visible', 'on');

%% Visualsing Data: Scatter Plot for 2016 Raw Data
x1 = (1:366);
figure
    h1 = subplot(6,1,1);
    scatter(x1, bi_centennial_2016)
    xlim([0 375])
    title('Bi-Centennial Bikeway'), grid on

    h2 = subplot(6,1,2);
    scatter(x1, go_between_2016)
    xlim([0 375])
    title('Go-Between Bikeway'), grid on

    h3 = subplot(6,1,3);
    scatter(x1, kangaroo_point_2016)
    xlim([0 375])
    title('Kangaroo Bikeway'), grid on

    h4 = subplot(6,1,4);
    scatter(x1, norman_park_2016)
    xlim([0 375])
    title('Norman Park Bikeway'), grid on

    h5 = subplot(6,1,5);
    scatter(x1, riverwalk_2016)
    xlim([0 375])
    title('Riverwalk Bikeway'), grid on

    h6 = subplot(6,1,6);
    scatter(x1, story_bridge_west_2016)
    xlim([0 375])
    title('Story Bridge West Bikeway'), grid on
    xlabel('Days in the Year')
    
suptitle('\bfRaw Data Collected in 2016');

p1 = get(h1,'position');
p3 = get(h6,'position');
height = p1(2)+p1(4)-p3(2);
h3 = axes('position',[p3(1) p3(2) p3(1) height],'visible','off');
h_label=ylabel('Number of Bikes in use Per Day', 'visible', 'on');

%% First Dot Point: Counter for missing data
%% Finding the Correlation in the Counters: 2014
corell_2014 = corrcoef([bike_counts_2014.BicentennialBikewayCyclistsInbound,...
                        bike_counts_2014.GoBetweenBridgeCyclistsInbound,...
                        bike_counts_2014.KangarooPointBikewayCyclistsInbound,...
                        bike_counts_2014.NormanParkCyclistsInbound,...
                        bike_counts_2014.RiverwalkCyclistsInbound,...
                        bike_counts_2014.StoryBridgeWestCyclistsInbound], 'Rows', 'pairwise');
                    
%% Finding the Correlation in the Counters: 2015
corell_2015 = corrcoef([bike_counts_2015.BicentennialBikewayCyclistsInbound,...
                        bike_counts_2015.GoBetweenBridgeCyclistsInbound,...
                        bike_counts_2015.KangarooPointBikewayCyclistsInbound,...
                        bike_counts_2015.NormanParkCyclistsInbound,...
                        bike_counts_2015.RiverwalkCyclistsInbound,...
                        bike_counts_2015.StoryBridgeWestCyclistsInbound], 'Rows', 'pairwise');

%% Finding the Correlation in the Counters: 2016
corell_2016 = corrcoef([bike_counts_2016.BicentennialBikewayCyclistsInbound,...
                        bike_counts_2016.GoBetweenBridgeCyclistsInbound,...
                        bike_counts_2016.KangarooPointBikewayCyclistsInbound,...
                        bike_counts_2016.NormanParkCyclistsInbound,...
                        bike_counts_2016.RiverwalkCyclistsInbound,...
                        bike_counts_2016.StoryBridgeWestCyclistsInbound], 'Rows', 'pairwise');

                    
%% Second & Third Dot Point: Introduce Weather Variables to Support Above Prediction & Modelling a Complete Database
%% Generating a more Complete Database: Bi-Centennial Bikeway: 2014
model_2014_variables_bi_1st_itt = [bike_counts_2014.GoBetweenBridgeCyclistsInbound,...
                                   bike_counts_2014.KangarooPointBikewayCyclistsInbound,...
                                   rainfall_2014.RainfallAmount_millimetres_,...
                                   max_temp_2014.MaximumTemperature_DegreeC_,...
                                   min_temp_2014.MinimumTemperature_DegreeC_,...
                                   solar_exposure_2014.DailyGlobalSolarExposure_MJ_m_m_];
                    
model_2014_bi_1 = fitlm(model_2014_variables_bi_1st_itt, bike_counts_2014.BicentennialBikewayCyclistsInbound);

model_2014_variables_bi_2nd_itt = [bike_counts_2014.GoBetweenBridgeCyclistsInbound,...
                                   bike_counts_2014.KangarooPointBikewayCyclistsInbound,...
                                   min_temp_2014.MinimumTemperature_DegreeC_,...
                                   solar_exposure_2014.DailyGlobalSolarExposure_MJ_m_m_];
                    
model_2014_bi_2 = fitlm(model_2014_variables_bi_2nd_itt, bike_counts_2014.BicentennialBikewayCyclistsInbound);

figure
    plot(model_2014_bi_2)
    
figure
    plot([bike_counts_2014.BicentennialBikewayCyclistsInbound, model_2014_bi_2.predict])
    xlabel('Day of the Year'), ylabel('Number of Bikes in use Per Day'), xlim([0 400])
    legend('Actual', 'Predicted'), grid on
    title('Bi-Centennial Bikeway 2014: Predicted vs. Actual Data')

%% Generating a more Complete Database: Go-Between: 2014
model_2014_variables_go_1 = [bike_counts_2014.BicentennialBikewayCyclistsInbound,...
                             rainfall_2014.RainfallAmount_millimetres_,...
                             max_temp_2014.MaximumTemperature_DegreeC_,...
                             min_temp_2014.MinimumTemperature_DegreeC_,...
                             solar_exposure_2014.DailyGlobalSolarExposure_MJ_m_m_];
                          
model_2014_go_1 = fitlm(model_2014_variables_go_1, bike_counts_2014.GoBetweenBridgeCyclistsInbound);


model_2014_variables_go_2 = [bike_counts_2014.BicentennialBikewayCyclistsInbound,...
                             rainfall_2014.RainfallAmount_millimetres_,...
                             solar_exposure_2014.DailyGlobalSolarExposure_MJ_m_m_];
                          
model_2014_go_2 = fitlm(model_2014_variables_go_2, bike_counts_2014.GoBetweenBridgeCyclistsInbound);

figure
    plot(model_2014_go_2)
    
figure
    plot([bike_counts_2014.GoBetweenBridgeCyclistsInbound, model_2014_go_2.predict])
    xlabel('Day of the Year'), ylabel('Number of Bikes in use Per Day'), xlim([0 400])
    legend('Actual', 'Predicted'), grid on
    title('Go-Between Bikeway 2014: Predicted vs. Actual Data')
    
%% Generating a more Complete Database: Kangaroo Point: 2014
model_2014_variables_kangaroo = [rainfall_2014.RainfallAmount_millimetres_,...
                                 max_temp_2014.MaximumTemperature_DegreeC_,...
                                 min_temp_2014.MinimumTemperature_DegreeC_,...
                                 solar_exposure_2014.DailyGlobalSolarExposure_MJ_m_m_];
                    
model_2014_kangaroo = fitlm(model_2014_variables_kangaroo, bike_counts_2014.KangarooPointBikewayCyclistsInbound);

figure
    plot(model_2014_kangaroo)
    
figure
    plot([bike_counts_2014.KangarooPointBikewayCyclistsInbound, model_2014_kangaroo.predict])
    xlabel('Day of the Year'), ylabel('Number of Bikes in use Per Day'), xlim([0 400])
    legend('Actual', 'Predicted'), grid on
    title('Kangaroo Point Bikeway 2014: Predicted vs. Actual Data')

   
%% Generating a more Complete Database: Bi-Centennial: 2016
model_2016_variables_norman = [bike_counts_2016.KangarooPointBikewayCyclistsInbound,...
                                 bike_counts_2016.RiverwalkCyclistsInbound,...
                                 bike_counts_2016.StoryBridgeWestCyclistsInbound,...
                                 rainfall_2016.RainfallAmount_millimetres_,...
                                 max_temp_2016.MaximumTemperature_DegreeC_,...
                                 min_temp_2016.MinimumTemperature_DegreeC_,...
                                 solar_exposure_2016.DailyGlobalSolarExposure_MJ_m_m_];
                    
model_2016_norman = fitlm(model_2016_variables_norman, bike_counts_2016.BicentennialBikewayCyclistsInbound);


model_2016_variables_norman_2 = [bike_counts_2016.KangarooPointBikewayCyclistsInbound,...
                             bike_counts_2016.RiverwalkCyclistsInbound,...
                             bike_counts_2016.StoryBridgeWestCyclistsInbound,...
                             rainfall_2016.RainfallAmount_millimetres_,...
                             max_temp_2016.MaximumTemperature_DegreeC_,...
                             solar_exposure_2016.DailyGlobalSolarExposure_MJ_m_m_];
                    
model_2016_bi_2 = fitlm(model_2016_variables_norman_2, bike_counts_2016.BicentennialBikewayCyclistsInbound);

figure
    plot(model_2016_bi_2)
    
figure
    plot([bike_counts_2016.BicentennialBikewayCyclistsInbound, model_2016_bi_2.predict])
    xlabel('Day of the Year'), ylabel('Number of Bikes in use Per Day'), xlim([0 400])
    legend('Actual', 'Predicted'), grid on
    title('Bi-Centennial Bikeway 2016: Predicted vs. Actual Data')

%% Generating a more Complete Database: Norman Park: 2016
model_2016_variables_norman = [bike_counts_2016.KangarooPointBikewayCyclistsInbound,...
                               bike_counts_2016.RiverwalkCyclistsInbound,...
                               bike_counts_2016.StoryBridgeWestCyclistsInbound,...
                               rainfall_2016.RainfallAmount_millimetres_,...
                               max_temp_2016.MaximumTemperature_DegreeC_,...
                               min_temp_2016.MinimumTemperature_DegreeC_];     
                       
model_2016_norman = fitlm(model_2016_variables_norman, bike_counts_2016.NormanParkCyclistsInbound);


model_2016_variables_norman_2 = [bike_counts_2016.KangarooPointBikewayCyclistsInbound,...
                                 bike_counts_2016.RiverwalkCyclistsInbound,...
                                 bike_counts_2016.StoryBridgeWestCyclistsInbound,...
                                 rainfall_2016.RainfallAmount_millimetres_,...
                                 max_temp_2016.MaximumTemperature_DegreeC_,...
                                 solar_exposure_2016.DailyGlobalSolarExposure_MJ_m_m_];
                    
model_2016_norman_2 = fitlm(model_2016_variables_norman_2, bike_counts_2016.NormanParkCyclistsInbound);

model_2016_variables_norman_3 = [bike_counts_2016.KangarooPointBikewayCyclistsInbound,...
                                 bike_counts_2016.RiverwalkCyclistsInbound,...
                                 bike_counts_2016.StoryBridgeWestCyclistsInbound,...
                                 max_temp_2016.MaximumTemperature_DegreeC_,...
                                 solar_exposure_2016.DailyGlobalSolarExposure_MJ_m_m_];
                     
model_2016_norman_3 = fitlm(model_2016_variables_norman_3, bike_counts_2016.NormanParkCyclistsInbound);

model_2016_variables_norman_4 = [bike_counts_2016.KangarooPointBikewayCyclistsInbound,...
                                 bike_counts_2016.RiverwalkCyclistsInbound,...
                                 bike_counts_2016.StoryBridgeWestCyclistsInbound,...
                                 max_temp_2016.MaximumTemperature_DegreeC_];
                         
model_2016_norman_4 = fitlm(model_2016_variables_bi_4, bike_counts_2016.NormanParkCyclistsInbound);

figure
    plot(model_2016_norman_4)
    
figure
    plot([bike_counts_2016.NormanParkCyclistsInbound, model_2016_norman_4.predict])
    xlabel('Day of the Year'), ylabel('Number of Bikes in use Per Day'), xlim([0 400])
    legend('Actual', 'Predicted'), grid on
    title('Norman Park Bikeway 2016: Predicted vs. Actual Data')

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
