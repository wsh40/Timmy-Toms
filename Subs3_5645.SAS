* This program is called Subs3_5645.SAS. ;

* The next block of code cleans the windows each time you run this program. ;
ODS HTML CLOSE ;
ODS HTML ;
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;' ;

* The next block of code reads the data file from the D drive. ;
PROC IMPORT DATAFILE = ' E:/Timmy Toms/Data/Subs2_5645.CSV ' 
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
*WR indicates "Without Region" for joint F test of retion variables;
PROC REG;
/*	A: MODEL Sales = food_away_3R pop_in_school_3R cust_value_per_cap_region 
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
*/
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
/*
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
*/

*Correlation between variables in top 5 models;	
/* *Correlation AB;
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
*/

* End with a QUIT statement, even though Jeff Banister says NEVER EVER QUIT! ;
QUIT;
