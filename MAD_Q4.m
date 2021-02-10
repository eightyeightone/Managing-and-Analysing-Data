%% QUESTION FOUR: ESTIMATING CONCRETE STRENGTH
clc, clear, close all
%% Reading in Data Set
concrete_data = readtable('Concrete_Data.xls');

%% Concrete Strength
concrete_strength = concrete_data.ConcreteCompressiveStrength_MPa_Megapascals_;

%% Visualising Data: Scatter Plot for Concrete Data
    figure
    h1 = subplot(3,3,1);
    scatter(concrete_data.Cement_component1__kgInAM_3Mixture_, concrete_strength, 'b')
    title('Concrete: Cement'), xlabel('Cement kgInAM'), grid on

    h2 = subplot(3,3,2);
    scatter(concrete_data.BlastFurnaceSlag_component2__kgInAM_3Mixture_, concrete_strength, 'b')
    title('Concrete: Blast Furnace Slag'), xlabel('Blast Furnace Slag kgInAM'), grid on

    h3 = subplot(3,3,3);
    scatter(concrete_data.FlyAsh_component3__kgInAM_3Mixture_, concrete_strength, 'b')
    title('Concrete: Fly Ash'), xlabel('Fly Ash kgInAM'), grid on

    h4 = subplot(3,3,4);
    scatter(concrete_data.Water_component4__kgInAM_3Mixture_, concrete_strength, 'b')
    title('Concrete: Water Based'), xlabel('Water Based kgInAM'), grid on

    h5 = subplot(3,3,5);
    scatter(concrete_data.Superplasticizer_component5__kgInAM_3Mixture_, concrete_strength, 'b')
    title('Concrete: Super Plasticizer'), xlabel('Super Plasticizer kgInAM'), grid on

    h6 = subplot(3,3,6);
    scatter(concrete_data.CoarseAggregate_component6__kgInAM_3Mixture_, concrete_strength, 'b')
    title('Concrete: Coarse Aggregate'), xlabel('Coarse Aggregate kgInAM'), grid on

    h7 = subplot(3,3,7);
    scatter(concrete_data.FineAggregate_component7__kgInAM_3Mixture_, concrete_strength, 'b')
    title('Concrete: Fine Aggregate'), xlabel('Fine Aggregate kgInAM'), grid on

p1 = get(h1,'position');
p7 = get(h7,'position');
height = p1(2)+p1(4)-p7(2);
h3 = axes('position',[p7(1) p7(2) p7(3) height],'visible','off');
h_label=ylabel('Concrete Strength MPa', 'visible', 'on');

%% Part A: Concrete Strength from the Single Best Indicator Variable
%% Correlation Data for Concrete Types
    concrete_cement = corrcoef(concrete_strength, concrete_data.Cement_component1__kgInAM_3Mixture_);
    
    concrete_blast = corrcoef(concrete_strength, concrete_data.BlastFurnaceSlag_component2__kgInAM_3Mixture_);
    
    concrete_fly = corrcoef(concrete_strength, concrete_data.FlyAsh_component3__kgInAM_3Mixture_);
    
    concrete_water = corrcoef(concrete_strength, concrete_data.Water_component4__kgInAM_3Mixture_);
    
    concrete_super = corrcoef(concrete_strength, concrete_data.Superplasticizer_component5__kgInAM_3Mixture_);
    
    concrete_coarse = corrcoef(concrete_strength, concrete_data.CoarseAggregate_component6__kgInAM_3Mixture_);
    
    concrete_fine = corrcoef(concrete_strength, concrete_data.FineAggregate_component7__kgInAM_3Mixture_);
    
%% Using the Cement Component as the Best Indicator Variable
model_compressive_strength = fitlm(concrete_data.Cement_component1__kgInAM_3Mixture_, concrete_strength)
                               
figure
    plot(model_compressive_strength), grid on
    title('Linear Regression Model: Cement-Based Concrete')
    
figure
    plot(concrete_strength), hold on
    plot(model_compressive_strength.predict)
    xlabel('Samples'), ylabel('Compressive Strength MPa')
    legend('Actual', 'Predicted'), grid on
    title('Regression Model: Cement-Based Concrete')

%% Part B: Concrete Strength from all Variables
concrete_variables = [concrete_data.Cement_component1__kgInAM_3Mixture_,...
                      concrete_data.BlastFurnaceSlag_component2__kgInAM_3Mixture_,...
                      concrete_data.FlyAsh_component3__kgInAM_3Mixture_,...
                      concrete_data.Water_component4__kgInAM_3Mixture_,...
                      concrete_data.Superplasticizer_component5__kgInAM_3Mixture_,...
                      concrete_data.CoarseAggregate_component6__kgInAM_3Mixture_,...
                      concrete_data.FineAggregate_component7__kgInAM_3Mixture_,...
                      concrete_data.Age_day_];

model_compressive_strength_all_variables = fitlm(concrete_variables, concrete_strength);


concrete_variables_1st_itt = [concrete_data.Cement_component1__kgInAM_3Mixture_,...
                              concrete_data.BlastFurnaceSlag_component2__kgInAM_3Mixture_,...
                              concrete_data.FlyAsh_component3__kgInAM_3Mixture_,...
                              concrete_data.Water_component4__kgInAM_3Mixture_,...
                              concrete_data.Superplasticizer_component5__kgInAM_3Mixture_,...
                              concrete_data.CoarseAggregate_component6__kgInAM_3Mixture_,...
                              concrete_data.Age_day_];

model_compressive_strength_1st_itt = fitlm(concrete_variables_1st_itt, concrete_strength);


concrete_variables_2nd_itt = [concrete_data.Cement_component1__kgInAM_3Mixture_,...
                              concrete_data.BlastFurnaceSlag_component2__kgInAM_3Mixture_,...
                              concrete_data.FlyAsh_component3__kgInAM_3Mixture_,...
                              concrete_data.Water_component4__kgInAM_3Mixture_,...
                              concrete_data.Superplasticizer_component5__kgInAM_3Mixture_,...
                              concrete_data.Age_day_];

model_compressive_strength_final = fitlm(concrete_variables_2nd_itt, concrete_strength,'RobustOpts','on');

figure
    plot(concrete_strength), hold on
    plot(model_compressive_strength_final.predict)
    xlabel('Samples'), ylabel('Compressive Strength MPa')
    legend('Actual', 'Predicted'), grid on
    title('Regression Model: Multiple Indicators')
