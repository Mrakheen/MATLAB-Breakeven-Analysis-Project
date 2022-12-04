%{
Aditya Ravishankar  UTA ID:1001733555 
Mubtasim Ahmed Rakheen UTA ID:1001848135
ENGR-1250 Project
Breakeven Analysis Project 
Date: 11/7/2020

Variables:
Data - Cell Array of information given on the 3 construction materials
CIF - Conversion of inches to feet
L_C - List of Construction Materials
SA - Surface Area of Wall [square feet]
FC - Fixed cost [$]
Data1 - selection of data of the material of choice
VE - Variable Energy Cost per week [$]
VL - Variable Labor Cost per week [$]
VM - Variable Maintenance Cost per week [$]
VL_f - Variable Landfill Cost per week [$]
OW - Number of weeks per year the zoo will operate
OY - Number of Years the analysis should include
PP - Price of admission per person [$/person]
NP - Number of people per week that will visit the zoo
ED - Expected donations per week [$/week]
Y - Vector of Number of Years of Analysis
VC - Total Variable Cost per week [$]
TC  - Total Cost [$]
TR - Total Revenue [$]
TP - Total Profit [$]
Breakeven - Breakeven Point in months
Breakeven_y - Breakeven Point in years
BreakY_cord - Y co-ordinate of Breakeven Point (Cost) [$] 
OD - One-time donation it would take to “breakeven” at the end of 7 months [$]
Material - Variable used to display material choosen
Revenue - Variable used to display total Revenue per year
Cost - Variable used to display total Cost per year
Profit - Variable used to display total Profit 
%}
clear; close all; clc;

%Calculation Procedure for Construction (Fixed Cost)
%Given data of fixed costs
Data={'Concrete' 16 30 96000 900 5 5;'Wood' 23 53 115000 800 12 11;'Adobe' 18 42 68000 600 6 5};
SA=3000;
CIF=12 ;
%menu option for choice of material
L_C=menu('Please choose material',Data(:,1)');
%Code for calculating fixed cost
Data1 =Data((L_C),:);
FC = (Data1{2}/CIF)*SA*Data1{3}+Data1{4}+Data1{5}*Data1{6}*Data1{7};

%Breakeven Analysis (Variable Costs and Revenue Details)
%Allowing the user to enter the variable costs
VE= input('Please enter energy cost per week [$/week]: ');
VL= input('Please enter labour cost per week [$/week]: ');
VM = input('Please enter maintenance cost per week [$/week]: ');
VL_f = input('please enter landfill cost per week [$/week]: ');
OW = input('Please enter the number of weeks the zoo will remain operational in a year: ');
OY = input('Please enter the number of years the analysis should include : ');
%Allowing the user to enter the zoo's anticipated public interest (Revenue Costs)
PP = input('Please enter the price of admission per person [$/person]: ');
NP = input('Please enter number of visitors for the zoo per week: ');
ED = input('Please enter expected donations per week [$/week]: ');
fprintf('\n')

%Breakeven Analysis (Process)
%FC - Total Fixed Cost of Chosen Material
Y=[0:1:OY];
%Calculating the variable cost
VC=VE+VL+VM+VL_f;
%Calculation of Total cost vector 
TC=VC.*OW.*Y+FC;
%Calculation of Total Revenue vector
TR=PP.*NP.*OW.*Y+ED.*OW.*Y;
%Calculation of Total Profit vector
TP=TR-TC;
% Breakeven point in months 
Breakeven=(FC/((PP*NP*OW+ED*OW)-(VC*OW)))*12;
%One-time Donation 
OD=FC-7/12*((PP*NP*OW+ED*OW)-(VC*OW));

%Summary of Results
%Output Statements
Material=Data1{1};
Revenue=TR(1,end)/OY;
Cost=TC(1,end)/OY;
Profit=TP(1,end);
fprintf('Material: %s\n\tOperating %0.0f weeks per year will generate per year:\n\t\tRevenue:\t$%0.0f\n\t\tCost:\t\t$%0.0f\n\tThe breakeven time is %0.2f months\n\tThe total profit after %0.0f years is $%0.3e.\n',Material,OW,Revenue,Cost,Breakeven,OY,Profit)
fprintf('It will take a one-time donation of $%08.2f to breakeven in seven months.\n',OD)
 
%Graph Figures
%Plot of Total Revenue & Total Cost
Breakeven_y=FC/((PP*NP*OW+ED*OW)-(VC*OW));
BreakY_cord=VC*OW*Breakeven_y+FC;
figure('color','w')
plot(Y,TC,'-r','LineWidth',3)
hold on
plot(Y,TR,'--b','LineWidth',3)
hold on
plot(Breakeven_y,BreakY_cord,'ob','MarkerSize',11,'MarkerFaceColor','c','LineWidth',1,'MarkerEdgeColor','b')
grid on
axis([0 OY 0 TR(1,end)])
xlabel('Number of Years (Y)','FontWeight','bold','color','k','FontSize',12);
ylabel('Total Revenue (R) [$] & Total Cost (C) [$]','FontWeight','bold','color','k','FontSize',12);
title('Breakeven Analysis 1','FontWeight','bold','color','k','FontSize',15);
L=legend('\color{red} Total Cost', '\color{blue} Total Revenue','\color{black}Breakeven Point', 'location', 'NorthWest');
set(L,'FontWeight','bold','color','w','FontSize',12,'EdgeColor','k','LineWidth',1);

%Plot of Profit 
figure('color','w')
plot(Y,TP,'-.k','LineWidth',3);
hold on
plot(Breakeven_y,BreakY_cord,'or','MarkerSize',11,'MarkerFaceColor','r','LineWidth',1,'MarkerEdgeColor','k');
grid on
axis([0 OY 0 TR(1,end)])
xlabel('Number of Years (Y)','FontWeight','bold','color','k','FontSize',12);
ylabel('Total Profit (P) [$]','FontWeight','bold','color','k','FontSize',12);
title('Breakeven Analysis 2','FontWeight','bold','color','k','FontSize',15);
L=legend('\color{black}Total Profit','\color{black}Breakeven Point', 'location', 'NorthWest');
set(L,'FontWeight','bold','color','w','FontSize',12,'EdgeColor','k','LineWidth',1);
















