

* First, clean the log and results windows;
ODS HTML CLOSE ;
ODS HTML ;
DM 'LOG; CLEAR; ODSRESULTS; CLEAR' ;


* The next block of code reads the data file from the D drive;
PROC IMPORT DATAFILE = ' E:/Timmy Toms/Data/Subs2_5645.csv ' 
   OUT = SUBS1
   DBMS = CSV
   REPLACE ;
   GETNAMES = YES ;
   RUN ;

* The next block of code deletes sales values in excess of 1,939,159 ;
DATA SUBS2;
   SET SUBS1;
   IF SALES = 0 or SALES > 1939159 THEN DELETE;
   RUN;

* The following block of code converts improper LIV variables into 0/1 dummy variables;
DATA SUBS3;
   SET SUBS2;
   high_visibility=0;
  IF HV=1 THEN high_visibility=1;
  high_density=0;
  IF HD=1 then high_density=1;
  RUN;


* The following block of code converts improper LIV variables into 0/1 dummy variables;
DATA SUBS4;
   SET SUBS3;
   Competitor_A_0_5R_dum = 0;
   IF Competitor_A_0_5R > 0 THEN Competitor_A_0_5R_dum = 1;
   Competitor_A_1R_dum = 0;
   IF Competitor_A_1R > 0 THEN Competitor_A_1R_dum = 1;
   Bakeries_0_5R_dum = 0;
   IF Bakeries_0_5R > 0 THEN Bakeries_0_5R_dum = 1;
   Bakeries_1R_dum = 0;
   IF Bakeries_1R > 0 THEN Bakeries_1R_dum = 1;
   Low_grocery_1R_dum = 0;
   IF Low_grocery_1R > 0 THEN Low_grocery_1R_dum = 1;
   Mid_grocery_0_5R_dum = 0;
   IF Mid_grocery_0_5R > 0 THEN Mid_grocery_0_5R_dum = 1;
   Mid_grocery_1R_dum = 0;
   IF Mid_grocery_1R > 0 THEN Mid_grocery_1R_dum = 1;
   Malls_300K_0_5R_dum = 0;
   IF Malls_300K_0_5R > 0 THEN Malls_300K_0_5R_dum = 1;
   Malls_300K_1R_dum = 0;
   IF Malls_300K_1R > 0 THEN Malls_300K_1R_dum = 1;
   Universities_3R_dum = 0;
   IF Universities_3R > 0 THEN Universities_3R_dum = 1;
   Universities_8T_dum = 0;
   IF Universities_8T > 0 THEN Universities_8T_dum = 1;
   RUN;

ODS GRAPHICS OFF;

* Forward-selection method;
PROC REG;
   Forward: MODEL SALES = 
Food_away_3R Likely_customers_1R 
Pop_GE_18_3R Pop_GE_18_5T Pop_21_39_3R Pop_21_39_5T Pop_40_49_3R Pop_40_49_5T Pop_50_69_3R Pop_50_69_5T Pop_70_85_3R Pop_70_85_5T 
Mid_grocery_index_1R Big_box_index_1R 
Pop_some_college_3R Pop_some_college_5T	Pop_Associates_3R Pop_Associates_5T Pop_Bachelors_3R Pop_Masters_3R Pop_Doctorate_3R Pop_grades_9_12_3R Pop_grades_9_12_5T Pop_grad_school_3R Pop_in_school_3R
Tot_HH_Expend_3R Cust_value_per_cap_region 
HHinc_LT_25K_3R HHinc_LT_25K_5T HHinc_25_49K_3R HHinc_25_49K_5T HHinc_50_74K_3R HHinc_75_99K_3R Med_HHinc_3R 
HH_1person_3R HH_1person_5T HH_2person_3R HH_3person_3R HH_3person_5T HH_4person_3R HH_4person_5T HH_5person_3R HH_5person_5T HH_6person_3R HH_6person_5T Brady_Bunch_3R Brady_Bunch_5T 
labor_blue_3R labor_blue_5T labor_farm_3R labor_farm_5T labor_white_col_3R 
Pop_married_3R
restaurants_3R retail_3R restaurants_retail_3R
Black_HH_3R Black_HH_5T Black_pop_3R Black_pop_5T 
Hispanic_HH_3R Hispanic_HH_5T Hispanic_pop_3R Hispanic_pop_5T
strip_mall
Mid_grocery_1R_dum Malls_300K_0_5R_dum / SELECTION=FORWARD SLENTRY=0.20  ;
   RUN;

*Forward Selection with multi-trait dummies;
PROC REG;
	MODEL Sales =
strip_mall
Brady_Bunch_3R
Food_away_3R
Mid_grocery_1R_dum
Malls_300K_0_5R_dum
Black_HH_3R
labor_farm_5T
HH_6person_3R
Brady_Bunch_5T
Cust_value_per_cap_region
West South;
RUN;

 
*Stepwise selection method;
PROC REG;
   STEPWISE: MODEL SALES = 
Food_away_3R Likely_customers_1R 
Pop_GE_18_3R Pop_GE_18_5T Pop_21_39_3R Pop_21_39_5T Pop_40_49_3R Pop_40_49_5T Pop_50_69_3R Pop_50_69_5T Pop_70_85_3R Pop_70_85_5T 
Mid_grocery_index_1R Big_box_index_1R 
Pop_some_college_3R Pop_some_college_5T	Pop_Associates_3R Pop_Associates_5T Pop_Bachelors_3R Pop_Masters_3R Pop_Doctorate_3R Pop_grades_9_12_3R Pop_grades_9_12_5T Pop_grad_school_3R Pop_in_school_3R
Tot_HH_Expend_3R Cust_value_per_cap_region 
HHinc_LT_25K_3R HHinc_LT_25K_5T HHinc_25_49K_3R HHinc_25_49K_5T HHinc_50_74K_3R HHinc_75_99K_3R Med_HHinc_3R 
HH_1person_3R HH_1person_5T HH_2person_3R HH_3person_3R HH_3person_5T HH_4person_3R HH_4person_5T HH_5person_3R HH_5person_5T HH_6person_3R HH_6person_5T Brady_Bunch_3R Brady_Bunch_5T 
labor_blue_3R labor_blue_5T labor_farm_3R labor_farm_5T labor_white_col_3R 
Pop_married_3R
restaurants_3R retail_3R restaurants_retail_3R
Black_HH_3R Black_HH_5T Black_pop_3R Black_pop_5T 
Hispanic_HH_3R Hispanic_HH_5T Hispanic_pop_3R Hispanic_pop_5T
Strip_mall
Mid_grocery_1R_dum Malls_300K_0_5R_dum	
/ SELECTION=STEPWISE SLENTRY=0.20 SLSTAY=0.20;
   RUN;

*stepwise with multi-trait dummies;
PROC REG;
	MODEL Sales =
strip_mall
Food_away_3R
Mid_grocery_1R_dum
Malls_300K_0_5R_dum
Black_HH_3R
labor_farm_5T
HH_6person_3R
West South;
RUN;

* Backward selection method;
PROC REG;
   Backward: MODEL SALES = 
Food_away_3R Likely_customers_1R 
Pop_GE_18_3R Pop_GE_18_5T Pop_21_39_3R Pop_21_39_5T Pop_40_49_3R Pop_40_49_5T Pop_50_69_3R Pop_50_69_5T Pop_70_85_3R Pop_70_85_5T 
Mid_grocery_index_1R Big_box_index_1R 
Pop_some_college_3R Pop_some_college_5T	Pop_Associates_3R Pop_Associates_5T Pop_Bachelors_3R Pop_Masters_3R Pop_Doctorate_3R Pop_grades_9_12_3R Pop_grades_9_12_5T Pop_grad_school_3R Pop_in_school_3R
Tot_HH_Expend_3R Cust_value_per_cap_region 
HHinc_LT_25K_3R HHinc_LT_25K_5T HHinc_25_49K_3R HHinc_25_49K_5T HHinc_50_74K_3R HHinc_75_99K_3R Med_HHinc_3R 
HH_1person_3R HH_1person_5T HH_2person_3R HH_3person_3R HH_3person_5T HH_4person_3R HH_4person_5T HH_5person_3R HH_5person_5T HH_6person_3R HH_6person_5T Brady_Bunch_3R Brady_Bunch_5T 
labor_blue_3R labor_blue_5T labor_farm_3R labor_farm_5T labor_white_col_3R 
Pop_married_3R
restaurants_3R retail_3R restaurants_retail_3R
Black_HH_3R Black_HH_5T Black_pop_3R Black_pop_5T 
Hispanic_HH_3R Hispanic_HH_5T Hispanic_pop_3R Hispanic_pop_5T
Strip_mall
Mid_grocery_1R_dum Malls_300K_0_5R_dum	
/ SELECTION=BACKWARD SLSTAY=0.20 ;
   RUN;

/*
* Maximum R-square improvement selection method;
PROC REG;
   Max_R_square: MODEL SALES = 
Food_away_3R Likely_customers_1R 
Pop_GE_18_3R Pop_GE_18_5T Pop_21_39_3R Pop_21_39_5T Pop_40_49_3R Pop_40_49_5T Pop_50_69_3R Pop_50_69_5T Pop_70_85_3R Pop_70_85_5T 
Mid_grocery_index_1R Big_box_index_1R 
Pop_some_college_3R Pop_some_college_5T	Pop_Associates_3R Pop_Associates_5T Pop_Bachelors_3R Pop_Masters_3R Pop_Doctorate_3R Pop_grades_9_12_3R Pop_grades_9_12_5T Pop_grad_school_3R Pop_in_school_3R
Tot_HH_Expend_3R Cust_value_per_cap_region 
HHinc_LT_25K_3R HHinc_LT_25K_5T HHinc_25_49K_3R HHinc_25_49K_5T HHinc_50_74K_3R HHinc_75_99K_3R Med_HHinc_3R 
HH_1person_3R HH_1person_5T HH_2person_3R HH_3person_3R HH_3person_5T HH_4person_3R HH_4person_5T HH_5person_3R HH_5person_5T HH_6person_3R HH_6person_5T Brady_Bunch_3R Brady_Bunch_5T 
labor_blue_3R labor_blue_5T labor_farm_3R labor_farm_5T labor_white_col_3R 
Pop_married_3R
restaurants_3R retail_3R restaurants_retail_3R
Black_HH_3R Black_HH_5T Black_pop_3R Black_pop_5T 
Hispanic_HH_3R Hispanic_HH_5T Hispanic_pop_3R Hispanic_pop_5T
Strip_mall
Mid_grocery_1R_dum Malls_300K_0_5R_dum / SELECTION=MAXR;
BEST = 5;
   RUN;


* Adjusted R-square selection method;
PROC REG;
	Adj_R_square: MODEL SALES =
Food_away_3R Likely_customers_1R 
Pop_GE_18_3R Pop_GE_18_5T Pop_21_39_3R Pop_21_39_5T Pop_40_49_3R Pop_40_49_5T Pop_50_69_3R Pop_50_69_5T Pop_70_85_3R Pop_70_85_5T 
Mid_grocery_index_1R Big_box_index_1R 
Pop_some_college_3R Pop_some_college_5T	Pop_Associates_3R Pop_Associates_5T Pop_Bachelors_3R Pop_Masters_3R Pop_Doctorate_3R Pop_grades_9_12_3R Pop_grades_9_12_5T Pop_grad_school_3R Pop_in_school_3R
Tot_HH_Expend_3R Cust_value_per_cap_region 
HHinc_LT_25K_3R HHinc_LT_25K_5T HHinc_25_49K_3R HHinc_25_49K_5T HHinc_50_74K_3R HHinc_75_99K_3R Med_HHinc_3R 
HH_1person_3R HH_1person_5T HH_2person_3R HH_3person_3R HH_3person_5T HH_4person_3R HH_4person_5T HH_5person_3R HH_5person_5T HH_6person_3R HH_6person_5T Brady_Bunch_3R Brady_Bunch_5T 
labor_blue_3R labor_blue_5T labor_farm_3R labor_farm_5T labor_white_col_3R 
Pop_married_3R
restaurants_3R retail_3R restaurants_retail_3R
Black_HH_3R Black_HH_5T Black_pop_3R Black_pop_5T 
Hispanic_HH_3R Hispanic_HH_5T Hispanic_pop_3R Hispanic_pop_5T
Strip_mall
Mid_grocery_1R_dum Malls_300K_0_5R_dum / SELECTION=ADJRSQ BEST=10;
	RUN;

*/

* End end with a QUIT statement ;
QUIT;
