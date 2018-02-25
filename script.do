cd "~/document/490/data"
use "Women_complete_3states.dta"

gen antibiotic =0 (ml13n_1)
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
recode s64 8=.
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
gen foodpregnancy =0 (s588a_1)
recode foodpregnancy 0=1 if s588a_1==1
