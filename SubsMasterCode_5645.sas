
* First, clean the log and results windows;
ODS HTML CLOSE ;
ODS HTML ;
DM 'LOG; CLEAR; ODSRESULTS; CLEAR' ;


* The next block of code reads the data file from the E drive;
PROC IMPORT DATAFILE = ' E:/Timmy Toms/Data/Subs2_5645.csv ' 
   OUT = SUBS1
   DBMS = CSV
   REPLACE ;
   GETNAMES = YES ;
   RUN ;

TITLE 'All Observations';

* The next block of code sorts Sales and prints sales, store ID and year_open ;
PROC SORT;
   BY SALES;
   RUN;

PROC PRINT;
   VAR Store_ID SALES YEAR_OPEN;
   RUN;

* The next block of code computes the 5 basic summary statistics for sales, to two decimals ;
PROC MEANS MAXDEC=2;
   VAR SALES;
   RUN;

TITLE 'After Removing Unreasonable Observations';

* The next block of code deletes observation for sales that take on values of zero ;
DATA SUBS2;
   SET SUBS1;
   IF SALES=0 THEN DELETE;
   RUN;

* The next block of code computes the 5 basic summary statistics for non-zero sales, to two decimals ;
PROC MEANS MAXDEC=2;
   VAR SALES;
   RUN;

TITLE 'After Removing Unreasonable & Outlier Observations'; 

* The next block of code deletes outlier sales values ;
DATA SUBS2;
   SET SUBS1;
   IF SALES > 1939160 THEN DELETE;
   RUN;

* The next block of code computes the 5 basic summary statistics and the CV for "cleaned up" Sales, to two decimals ;
PROC MEANS MAXDEC=2 N MEAN STDDEV MIN MAX CV;
   VAR SALES;
   RUN;

TITLE ' ';

* The next block of code computes summary statistis, to 2 decimals, for all variables in the data set. ;
PROC MEANS N MEAN STDDEV MIN MAX CV MAXDEC=2;
   RUN;

* The next several blocks of code generate scatter plots for all the independent variables;
PROC PLOT;
PLOT SALES * Food_away_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Food_away_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_GE_18_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_GE_18_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_18_21_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_18_21_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_21_39_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_21_39_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_40_49_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_40_49_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_50_69_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_50_69_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_70_85_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_70_85_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Likely_customers_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Likely_customers_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Competitor_A_index = '*';
RUN;

PROC PLOT;
PLOT SALES * Competitor_B_index = '*';
RUN;

PROC PLOT;
PLOT SALES * Competitor_C_index = '*';
RUN;

PROC PLOT;
PLOT SALES * Competitor_D_index = '*';
RUN;

PROC PLOT;
PLOT SALES * Bakeries_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Casual_dining_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Fast_food_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Low_grocery_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Mid_grocery_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Big_box_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Big_box_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Sandwich_shop_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Fast_food_8T = '*';
RUN;

PROC PLOT;
PLOT SALES * Big_box_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Associates_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Associates_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Bachelors_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Bachelors_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Doctorate_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Doctorate_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_grades_9_12_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_grades_9_12_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_grad_school_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_grad_school_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_in_school_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_in_school_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_undergrads_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_undergrads_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Masters_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Masters_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_some_college_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_some_college_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Tot_HH_Expend_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Tot_HH_Expend_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Cust_value = '*';
RUN;

PROC PLOT;
PLOT SALES * Cust_value_per_cap = '*';
RUN;

PROC PLOT;
PLOT SALES * Cust_value_per_cap = '*';
RUN;

PROC PLOT;
PLOT SALES * Cust_value_region = '*';
RUN;

PROC PLOT;
PLOT SALES * Cust_value_per_cap_region = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_LT_25K_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_LT_25K_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_25_49K_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_25_49K_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_50_74K_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_50_74K_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_75_99K_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_75_99K_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_GE_100K_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_GE_100K_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Avg_HHinc_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Avg_HHinc_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Med_HHinc_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Med_HHinc_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_1person_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_1person_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_2person_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_2person_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_3person_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_3person_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_4person_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_4person_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_5person_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_5person_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_6person_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_6person_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Brady_Bunch_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Brady_Bunch_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * med_home_value_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * med_home_value_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * med_home_value_adj_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * med_home_value_adj_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * per_cap_inc_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * per_cap_inc_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * labor_blue_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * labor_blue_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * labor_farm_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * labor_farm_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * labor_white_col_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * labor_white_col_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * avg_LOR_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_married_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_married_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Distance_hwy = '*';
RUN;

PROC PLOT;
PLOT SALES * Distance_hwy_interstate = '*';
RUN;

PROC PLOT;
PLOT SALES * Distance_interstate = '*';
RUN;

PROC PLOT;
PLOT SALES * restaurants_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * retail_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * restaurants_retail_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Asian_HH_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Asian_HH_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Asian_pop_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Asian_pop_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Black_HH_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Black_HH_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Black_pop_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Black_pop_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Hispanic_HH_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Hispanic_HH_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Hispanic_pop_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Hispanic_pop_5T = '*';
RUN;


*Next Correlation;
PROC CORR;
  VAR Sales Food_away_3R Food_away_5T ;
  RUN;

PROC CORR;
  VAR Sales Likely_customers_1R Likely_customers_5T ;
  RUN;


PROC CORR;
  VAR Sales Pop_GE_18_3R Pop_GE_18_5T Pop_18_21_3R ;
  RUN;

PROC CORR;
  VAR Sales Pop_18_21_5T Pop_21_39_3R Pop_21_39_5T;
  RUN;


PROC CORR;
  VAR Sales Pop_40_49_3R Pop_40_49_5T Pop_50_69_3R ;
  RUN;

PROC CORR;
  VAR Sales Pop_50_69_5T Pop_70_85_3R Pop_70_85_5T;
  RUN;

PROC CORR;
  VAR Sales Competitor_A_index Competitor_B_index;
  RUN;

 PROC CORR;
  VAR Sales Competitor_C_index Competitor_D_index;
  RUN;

PROC CORR;
  VAR Sales Casual_dining_index_1R Fast_food_index_1R ;
  RUN;

PROC CORR;
  VAR Sales Bakeries_index_1R Low_grocery_index_1R Mid_grocery_index_1R ;
  Run;

PROC CORR;
  VAR Sales Big_box_index_1R Sandwich_shop_index_1R;
  RUN;

PROC CORR;
  VAR Sales Pop_Associates_3R Pop_Associates_5T ;
  RUN;

PROC CORR;
  VAR Sales Pop_Bachelors_3R Pop_Bachelors_5T;
  RUN;

PROC CORR;
  VAR Sales Pop_Doctorate_3R Pop_Doctorate_5T ;
  RUN;

PROC CORR;
  VAR Sales Pop_grades_9_12_3R Pop_grades_9_12_5T;
  RUN;

PROC CORR;
  VAR Sales Pop_grad_school_3R Pop_grad_school_5T ;
  RUN;

PROC CORR;
  VAR Sales Pop_in_school_3R Pop_in_school_5T;
  RUN;

PROC CORR;
  VAR Sales Pop_undergrads_3R Pop_undergrads_5T ;
  RUN;

PROC CORR;
  VAR Sales Pop_Masters_3R Pop_Masters_5T;
  RUN;

PROC CORR;
  VAR Sales Pop_some_college_3R Pop_some_college_5T ;
  RUN;

PROC CORR;
  VAR Sales Tot_HH_expend_3R Tot_HH_expend_5T;
  RUN;

PROC CORR;
  VAR Sales Cust_value Cust_value_per_cap Cust_value_region;
  RUN;

PROC CORR;
  VAR Sales Cust_value_per_cap_region HHinc_LT_25K_3R ;
  RUN;

PROC CORR;
  VAR Sales  HHinc_LT_25K_5T HHinc_25_49K_3R HHinc_25_49K_5T;
  RUN;

PROC CORR;
  VAR Sales HHinc_50_74K_3R HHinc_50_74K_5T HHinc_75_99K_3R HHinc_75_99K_5T;
  RUN;

PROC CORR;
  VAR Sales HHinc_GE_100K_3R HHinc_GE_100K_5T Avg_HHinc_3R Avg_HHinc_5T;
  RUN;

PROC CORR;
  VAR Sales Med_HHinc_3R Med_HHinc_5T per_cap_inc_3R per_cap_inc_5T;
  RUN;

PROC CORR;
  VAR Sales HH_1person_3R HH_1person_5T HH_2person_3R HH_2person_5T;
  RUN;

PROC CORR;
  VAR Sales HH_3person_3R HH_3person_5T HH_4person_3R HH_4person_5T;
  RUN;

PROC CORR;
  VAR Sales HH_5person_3R HH_5person_5T HH_6person_3R HH_6person_5T;
  RUN;

PROC CORR;
  VAR Sales Brady_Bunch_3R Brady_Bunch_5T med_home_value_3R;
  RUN;

PROC CORR;
  VAR Sales med_home_value_5T med_home_value_adj_3R med_home_value_adj_5T;
  RUN;

PROC CORR;
  VAR Sales labor_blue_3R labor_blue_5T labor_farm_3R labor_farm_5T;
  RUN;

PROC CORR;
  VAR Sales labor_white_col_3R labor_white_col_5T avg_LOR_3R;
  RUN;

PROC CORR;
  VAR Sales pop_married_3R pop_married_5T distance_hwy;
  RUN;

PROC CORR;
  VAR Sales distance_hwy_interstate distance_interstate ;
  RUN;

PROC CORR;
  VAR Sales restaurants_3R retail_3R restaurants_retail_3R;
  RUN;

PROC CORR;
  VAR Sales Asian_HH_3R Asian_HH_5T Asian_pop_3R Asian_pop_5T;
  RUN;

PROC CORR;
  VAR Sales Black_HH_3R Black_HH_5T Black_pop_3R Black_pop_5T;
  RUN;

PROC CORR;
  VAR Sales Hispanic_HH_3R Hispanic_HH_5T Hispanic_pop_3R Hispanic_pop_5T;
  RUN;
*Project 8;
*Summary statistics before doing anything;
PROC MEANS MAXDEC=2;
VAR HV south central west HD free_standing strip_mall;
RUN;

*Redefining these variables;
DATA SUBS3;
  SET SUBS2;
  high_visibility=0;
  IF HV=1 THEN high_visibility=1;
  high_density=0;
  IF HD=1 then high_density=1;
  RUN;

* The next block of code computes the 5 basic summary statistics for the new variables ;
PROC MEANS MAXDEC=2 N MEAN STDDEV MIN MAX;
   VAR high_visibility south central west high_density free_standing strip_mall
   Big_box_0_5R Sandwich_shop_8T All_malls_1R 
   Competitor_A_0_5R Competitor_A_1R Competitor_B_0_5R Competitor_B_1R  
   Competitor_C_0_5R Competitor_C_1R Competitor_D_0_5R Competitor_D_1R  
   Bakeries_0_5R Bakeries_1R Low_grocery_0_5R Low_grocery_1R 
   Mid_grocery_0_5R Mid_grocery_1R Malls_300K_0_5R Malls_300K_1R 
   Universities_0_5R Universities_1R Universities_3R Universities_5T Universities_8T  ;
   RUN;

*Correlation between Sales and the significant dummy variables;
PROC CORR;
VAR Sales south central west high_density free_standing strip_mall;
RUN;

* The next block of code generates frequency tables for the potential LIV variables;
PROC FREQ;
  TABLES Big_box_0_5R Sandwich_shop_8T All_malls_1R 
Competitor_A_0_5R Competitor_A_1R Competitor_B_0_5R Competitor_B_1R Competitor_C_0_5R Competitor_C_1R Competitor_D_0_5R Competitor_D_1R
Bakeries_0_5R Bakeries_1R 
Low_grocery_0_5R Low_grocery_1R 
Mid_grocery_0_5R Mid_grocery_1R 
Malls_300K_0_5R Malls_300K_1R 
Universities_0_5R Universities_1R Universities_3R Universities_5T Universities_8T;
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

* The next block of code generates summary statistics for the newly created dummy variables;
PROC MEANS MAXDEC=2 N MEAN STDDEV MIN MAX CV;
   VAR big_box_0_5R sandwich_shop_8T all_malls_1R Competitor_A_0_5R_dum Competitor_A_1R_dum Bakeries_0_5R_dum Bakeries_1R_dum Low_grocery_1R_dum 
   Mid_grocery_0_5R_dum Malls_300K_0_5R_dum Malls_300K_1R_dum Universities_3R_dum Universities_8T_dum
big_box_0_5R sandwich_shop_8T All_malls_1R;
   RUN;

* The next blocks of code generate correlation coefficients between sales and all proper variables;
PROC CORR;
	Var Sales 
Big_box_0_5R 
Sandwich_shop_8T 
All_malls_1R ;
RUN;

PROC CORR;
  VAR Sales high_visibility south central west  ;
  RUN;

PROC CORR;
  VAR Sales high_density free_standing strip_mall ;
  RUN; 

PROC CORR;
  VAR Sales Big_box_0_5R Sandwich_shop_8T All_malls_1R  ;
  RUN;

PROC CORR;
  VAR Sales Competitor_C_1R Competitor_D_1R ;
  RUN;

PROC CORR;
  VAR Sales Competitor_A_0_5R_dum Competitor_A_1R_dum ;
  RUN;

PROC CORR;
  VAR Sales Bakeries_0_5R_dum Bakeries_1R_dum ;
  RUN;

PROC CORR;
  VAR Sales Low_grocery_1R_dum Mid_grocery_0_5R_dum ;
  RUN; 

PROC CORR;
  VAR Sales Mid_grocery_1R_dum ;
  RUN;

PROC CORR;
  VAR Sales Malls_300K_0_5R_dum Malls_300K_1R_dum ;
  RUN; 

PROC CORR;
  VAR Sales Universities_3R_dum Universities_8T_dum ;
  RUN; 

  *Project 9 regressions;
  *WR indicates "Without Region" for joint F test of retion variables;
PROC REG;
A: MODEL Sales = food_away_3R pop_in_school_3R cust_value_per_cap_region 
	HHinc_LT_25K_3R HHinc_25_49K_3R HHinc_50_74K_3R HHinc_75_99K_3R 
	labor_blue_3R labor_farm_3R labor_white_col_3R
	Black_HH_3R Black_pop_3R Hispanic_HH_3R Hispanic_pop_3R;

	B: MODEL Sales = food_away_3R pop_in_school_3R cust_value_per_cap_region 
	HHinc_LT_25K_5T HHinc_25_49K_5T HHinc_50_74K_3R HHinc_75_99K_3R 
	labor_blue_5T labor_farm_5T labor_white_col_3R
	Black_HH_5T Black_pop_5T Hispanic_HH_5T Hispanic_pop_5T;

	C: MODEL Sales = pop_21_39_3R pop_40_49_3R pop_50_69_3R pop_70_85_3R 
	HH_1person_3R HH_2person_3R HH_3person_3R HH_5person_3R HH_6person_3R Brady_Bunch_3R
	Black_pop_3R Black_HH_3R Hispanic_HH_3R Hispanic_pop_3R;

	D: MODEL Sales = pop_21_39_5T pop_40_49_5T pop_50_69_5T pop_70_85_5T 
	HH_1person_5T HH_3person_5T HH_4person_5T HH_5person_5T HH_6person_5T Brady_Bunch_5T
	Black_pop_5T Black_HH_5T Hispanic_HH_5T Hispanic_pop_5T;

	E: MODEL Sales = pop_grades_9_12_3R pop_some_college_3R pop_associates_3R pop_bachelors_3R pop_grad_school_3R pop_masters_3R pop_doctorate_3R
	HH_1person_3R HH_2person_3R HH_3person_3R HH_5person_3R HH_6person_3R Brady_Bunch_3R
	labor_blue_3R labor_farm_3R labor_white_col_3R;

	F: MODEL Sales = pop_grades_9_12_5T pop_some_college_5T pop_associates_5T
	HH_1person_5T HH_2person_5T HH_4person_5T HH_5person_5T HH_6person_5T Brady_Bunch_5T
	labor_blue_5T labor_farm_5T labor_white_col_3R;

	G: MODEL Sales = Food_away_3R Likely_customers_1R
	mid_grocery_index_1R big_box_index_1R
	tot_HH_expend_3R cust_value_per_cap_region
	restaurants_3R retail_3R
	central west
	free_standing strip_mall;

	H: MODEL Sales = Food_away_3R Likely_customers_1R
	tot_HH_expend_3R cust_value_per_cap_region
	restaurants_3R retail_3R
	south west
	strip_mall
	mid_grocery_1R_dum malls_300K_0_5_dum;

	I: MODEL Sales = pop_21_39_3R pop_40_49_3R pop_50_69_3R pop_70_85_3R
	pop_in_school_3R
	med_HHinc_3R
	restaurants_retail_3R
	south west;

	J: MODEL Sales = pop_grades_9_12_3R pop_some_college_3R pop_associates_3R pop_bachelors_3R pop_grad_school_3R pop_masters_3R pop_doctorate_3R
	pop_married_3R
	tot_HH_expend_3R;

	K: MODEL Sales = pop_in_school_3R
	cust_value_per_cap_region
	HH_1person_3R HH_2person_3R HH_3person_3R HH_5person_3R HH_6person_3R Brady_Bunch_3R
	strip_mall;

	L: MODEL Sales = HH_1person_3R HH_2person_3R HH_3person_3R HH_5person_3R HH_6person_3R Brady_Bunch_3R
	labor_blue_3R labor_farm_3R labor_white_col_3R
	strip_mall;

	M: MODEL Sales = big_box_index_1R
	pop_grades_9_12_3R pop_some_college_3R pop_associates_3R pop_bachelors_3R pop_grad_school_3R pop_masters_3R pop_doctorate_3R
	cust_value_per_cap_region
	med_HHinc_3R
	strip_mall
	mid_grocery_1R_dum malls_300k_0_5R_dum;

	N: MODEL Sales = pop_21_39_3R pop_40_49_3R pop_50_69_3R pop_70_85_3R
	labor_blue_3R labor_farm_3R labor_white_col_3R
	pop_married_3R
	restaurants_3R
	strip_mall;

	O: MODEL Sales = pop_in_school_3R
	HH_1person_5T HH_3person_5T HH_4person_5T HH_5person_5T HH_6person_5T Brady_Bunch_5T
	Labor_blue_5T labor_farm_5T
	pop_married_3R;

	P: MODEL Sales =  pop_some_college_3R pop_associates_3R pop_bachelors_3R
	med_HHinc_3R
	Restaurants_3R
	South West
	strip_mall;

	Q: MODEL Sales = pop_some_college_3R pop_associates_3R pop_bachelors_3R
	mid_grocery_index_1R big_box_index_1R
	med_HHinc_3R
	Black_pop_3R hispanic_pop_3R;

	R: MODEL Sales = pop_some_college_3R pop_associates_3R pop_bachelors_3R
	mid_grocery_index_1R big_box_index_1R
	med_HHinc_3R
	Black_pop_3R hispanic_pop_3R
	strip_mall
	Mid_grocery_1R_dum;

	S: MODEL Sales = pop_GE_18_3R pop_21_39_3R
	labor_white_col_3R
	Restaurants_3R
	strip_mall
	mid_grocery_1R_dum
	South West;

	SWR: MODEL Sales = pop_GE_18_3R pop_21_39_3R
	labor_white_col_3R
	Restaurants_3R
	strip_mall
	mid_grocery_1R_dum;

	T: MODEL Sales = pop_in_school_3R
	labor_white_col_3R
	med_HHinc_3R
	black_pop_3R hispanic_pop_3R
	strip_mall
	mid_grocery_1R_dum malls_300K_0_5R_dum;

	U: MODEL Sales = food_away_3R
	Pop_21_39_3R
	Pop_50_69_3R
	big_box_index_1R
	cust_value_per_cap_region
	HH_2person_3R
	labor_white_col_3R
	restaurants_3R
	black_pop_3R
	South West
	strip_mall;

	V: MODEL Sales = food_away_3R
	pop_50_69_3R
	Big_box_index_1R
	cust_value_per_cap_region
	HH_2person_3R
	Restaurants_3R
	South West
	strip_mall;

	VWR:MODEL Sales = food_away_3R
	pop_50_69_3R
	Big_box_index_1R
	cust_value_per_cap_region
	HH_2person_3R
	Restaurants_3R
	strip_mall;

	W: MODEL Sales = pop_21_39_3R pop_50_69_3R
	Big_box_index_1R
	HH_2person_3R
	med_HHinc_3R
	South West
	strip_mall;

	WWR: MODEL Sales = pop_21_39_3R pop_50_69_3R
	Big_box_index_1R
	HH_2person_3R
	med_HHinc_3R
	strip_mall;

	X: MODEL Sales = pop_50_69_3R
	mid_grocery_index_1R Big_box_index_1R
	cust_value_per_cap_region
	HH_2person_3R
	med_HHinc_3R
	labor_blue_3R labor_farm_3R
	Black_pop_3R
	South West
	strip_mall;

	Y: MODEL Sales = pop_50_69_3R
	mid_grocery_index_1R Big_box_index_1R
	HH_2person_3R
	med_HHinc_3R
	South West
	strip_mall;

	YWR: MODEL Sales = pop_50_69_3R
	mid_grocery_index_1R Big_box_index_1R
	HH_2person_3R
	med_HHinc_3R
	strip_mall;

	Z: MODEL Sales = pop_50_69_3R
	Big_box_index_1R
	cust_value_per_cap_region
	HH_2person_3R
	med_HHinc_3R
	Black_pop_3R
	mid_grocery_1R_dum
	South West
	strip_mall;

	AA: MODEL Sales = pop_50_69_3R
	Big_box_index_1R
	pop_bachelors_3R
	cust_value_per_cap_region
	HH_2person_3R HH_5person_5T
	med_HHinc_3R
	Black_pop_3R
	mid_grocery_1R_dum
	South West
	strip_mall;

	AB: MODEL Sales = pop_50_69_3R
	Big_box_index_1R
	HH_2person_3R
	med_HHinc_3R
	mid_grocery_1R_dum
	South West
	strip_mall;

	ABWR: MODEL Sales = pop_50_69_3R
	Big_box_index_1R
	HH_2person_3R
	med_HHinc_3R
	mid_grocery_1R_dum
	strip_mall;


*Correlation between variables in top 5 models;	

*Correlation AB;
PROC CORR;
	VAR  pop_50_69_3R
	Big_box_index_1R
	HH_2person_3R
	med_HHinc_3R
	mid_grocery_1R_dum
	South West
	strip_mall;
RUN;
*Y;
PROC CORR;
	VAR pop_50_69_3R
	mid_grocery_index_1R Big_box_index_1R
	HH_2person_3R
	med_HHinc_3R
	South West
	strip_mall;
RUN;
*W;
PROC CORR;
	VAR pop_21_39_3R pop_50_69_3R
	Big_box_index_1R
	HH_2person_3R
	med_HHinc_3R
	South West
	strip_mall;
RUN;
*v;
PROC CORR;
	VAR food_away_3R
	pop_50_69_3R
	Big_box_index_1R
	cust_value_per_cap_region
	HH_2person_3R
	Restaurants_3R
	South West
	strip_mall;
RUN;
*S;
PROC CORR;
	VAR pop_GE_18_3R pop_21_39_3R
	labor_white_col_3R
	Restaurants_3R
	strip_mall
	mid_grocery_1R_dum
	South West;
RUN;

*Project 10;

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

*I have commented this stuff temporarily because it took way to long for SAS to print;
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
