*The parts to work on each.
*Doo-Hyeun: caseid ~ h11b_1 (not including h11b_1)
*Umran: H11b_1 ~ idxml_1 (not including idxml_1)
*Brandon: Idxml_1 ~ s590c_4 (including s590c_4)

*things we need to do
*1.	Find variables that you think is directly related to our topic (urban-rural fertility differences) or the main factors
*look for missing values or odd/unusual/outlier data
	*some useful codes;
	label list variable
	tab variable
	codebook variable
	gen variable = variableindataset

*once you've found all variables u think is directly related/that we will examine closely, go over them and clean them
	*(check for missing values, recode to get rid of missing values, make notes of unusal data.
	*check for variable values such as 998, 98 that represent 'DK' (meaning don't know); these are usually observations we want to drop.

*when you've done all that, update your changes into the master branch in github.
*https://github.com/umran/econ490

*DUE DATE:

*NOTE; each of us will open our datasets from a different file (since we have different computers)

*so, when u run this do-file, make sure you use the codes for YOUR OWN computer.
*for Umran's computer
clear all
cd "~/irukandjilabs/econ490"
use "data/Women_complete_3states.dta"

*for Doohyeun's computer
clear all
cd "~/Documents/Github/econ490"
use "data/Women_complete_3states.dta"

*for Brandon's computer
clear all
*add your own command here Brandon

*The code from this point on, you can run using copy/paste.
*this way, we will all have the same recoded variables when doing our analysis.

*3 PARTS - ADD IN YOUR EDITS IN YOUR OWN SECTINO, SO THEY DON'T CREATE A HUGE CONFLICT LATER WHEN WE MERGE

*DOO-HYEUN'S PART
*Doo-Hyeun: caseid ~ h11b_1 (not including h11b_1)

*v025 = urban-rural   (v102 is the same)
*v026 = more specific place of residence
	*v134 and v141 = de facto and de jure place of residence. 

gen years_lived_in_residence = v104 
	*proxy for migration? use with v105 (previous residence type)
	recode years_lived_in_residence = . if v104 == 98
	*note 95 = always, 96 = visitor, 97 = inconsistent <-- what to do with them? 

*v106 and v107 and v133 and v149 = education
tab v106
label list v106
tab v107
label list v107
tab v133
label list v133
	*97 = inconsistent
tab v149
label list v149
*the rest are clean


*v113 and v115 = drinking water
tab v113
label list v113
	*96 = other, 97 = not de jure resident 
tab v115
label list v115
	*996 = on premise, 997 = not de jure resident, 998 = don't know. 

	
gen cat_religion = v130
gen cat_literacy = v155
gen cat_wealth_index = v190
gen total_children_born = v201
gen age_of_resp_at_first_birth = v212
gen number_of_living_children = v218
gen cat_current_pregnancy_wanted = v225



gen cat_knowledge_of_method = v301
*note, 'method' = contraceptive method: this is traditional, modern, or no knowledge.  

gen cat_currently_used_method_type = v313
	*I assume this is method for contraception, but need to check in questionnaire. 

	
gen bin_currently_pregnant = 1
recode bin_currently_pregnant = 0 if v213 == 0

gen cat_current_contraceptive = v312 
	*note, if you are already pregnant no need for contraceptives
	*proof; 
	tab bin_currently_pregnant cat_current_contraceptive
	*this shows crosstab of the two, shows all those who are pregnant also don't use contraceptives. 
	*it might be better to remove those who are pregnant; 
	recode cat_current_contraceptive = 0 if bin_currently_pregnant==0


*v318~v3a09b are more in depth questions about each contraceptive method. 
gen cost_of_current_contraceptive = v325a
	*remove the don't knows
	recode cost_of_current_contraceptive = . if v325a==9999998
	
	*note; this is for ALL contraceptive methods, not just condoms; 
		tab cost_of_current_contraceptive cat_current_contraceptive 


gen cat_source_for_current_contraceptive = v326
	*when you use label list on v326, you have the value '97' that is blank; i presume this is the 7k+ missing values. 
	*'98' = 'dk', so remove
	recode cat_source_for_current_contraceptive = . if v326==98

gen cat_pattern_of_use = v361

gen bin_knowledge_of_ovulatory_cycle = 1
recode bin_knowledge_of_ovulatory_cycle = 0 if v217 == 8
	*note v217 is a cat var, showing which stage (during/before/after period) woman is at. 
	*i changed it to a binary of whether woman knows her ovulatory cycle or not. 

gen cat_reason_not_using_contraceptive = v376
*98 = 'dk', '21' is blank. 
*note, 11k values are 'missing', so 21 might represent that. 
	recode cat_reason_not_using_contraceptive = . if v376==98

*v3a00a~v3a00z shows the source of family planning for non users (don't know what 'non-users' mean)
*if they mean non-users of media, then media sources are v384a,b,c

gen cat_anemia_level = v457

*v467b~i shows the difficulty of various factors related to getting medical help for oneself. 






*UMRAN'S PART
*Umran: H11b_1 ~ idxml_1 (not including idxml_1)

//generate relevant variables

generate bin_urban = 0
recode bin_urban 0 = 1 if v025 == 1
*note that v025, v115, v201, v137, v133 are actually in my section of the data, but since you already recoded it i left it out. 
*i left out the urban variable, but the rest i think i already included in my section. 


generate time_to_water_source = v115
generate children_ever_born = v201
generate children_under_5 = v137
generate ideal_children = v613
generate education_years = v133
generate education_years_partner = v715

// generate derivative variables
generate bin_water_on_premises = 0
recode bin_water_on_premises 0 = 1 if watertime == 996

//generate not so relevant variables
generate cat_fertility_pref = v602

*BRANDON'S PART

*Brandon: Idxml_1 ~ s590c_4 (including s590c_4)

gen antibiotic =0 (ml13n_1)
recode antibiotic 0=1 if ml13n_1==1
gen control = d102
gen unexpectedforcedsex =0 (d124)
recode enexpectedforcedsex 0=1 if d124==1
gen ageforcedsex = d126
gen treatmentfacility = s42
gen caste = s45
recode caste 8=.
gen dwellingpolu = s58ef 
s64  
*(not sure delete dejure resident or not)
recode s64 8=.
recode s64 7=.
gen healthinsu=0
recode healthinsu 0=1 if s64==1
gen lsindex = ssli 
gen notcohab = s304
*35 nonmissing values are not labeled
gen toldavoid =0 (s353)
recode toldavoid 0=1 if s353==1
gen mediself =0 (s369g)
recode mediself 0=1 if s369g==1
gen drinkalcohol = 0 (s569)
recode drinkalcohol 0=1 if s569==1
gen frequencyalcohol = s570
gen boystaughtcondom = 0 (s936ag)
recode boystaughtcondom 0=1 if s936ag==1
gen benefitpregnancy = 0 (s587_1)
recode benefitpregnancy 0=1 if s587_1==1
gen foodpregnancy =0 (s588a_1)
recode foodpregnancy 0=1 if s588a_1==1

