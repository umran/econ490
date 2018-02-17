

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
cd "~/irukandjilabs/490/data"
use "Women_complete_3states.dta"


*for Doohyeun's computer
clear all
use "/Users/doo-hyeunroh/Downloads/Women_complete_3states.dta"


*for Brandon's computer
clear all


*add your own command here Brandon


*The code from this point on, you can run using copy/paste.
*this way, we will all have the same recoded variables when doing our analysis.


*3 PARTS - ADD IN YOUR EDITS IN YOUR OWN SECTINO, SO THEY DON'T CREATE A HUGE CONFLICT LATER WHEN WE MERGE

*DOO-HYEUN'S PART
*Doo-Hyeun: caseid ~ h11b_1 (not including h11b_1)






*UMRAN'S PART
*Umran: H11b_1 ~ idxml_1 (not including idxml_1)


//generate relevant variables
generate urban = v025
generate watertime = v115
generate childrenever = v201
generate children5under = v137
generate childrenideal = v613
generate eduyrs = v133
generate eduyrspart = v715

v025

//not so relevant variables
generate fpref = v602

generate wateronpremises = 0
recode wateronpremises 0=1 if watertime == 996




*BRANDON'S PART
*Brandon: Idxml_1 ~ s590c_4 (including s590c_4)





