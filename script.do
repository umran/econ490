cd "~/irukandjilabs/490/data"
use "Women_complete_3states.dta"

*The parts to work on each. 
*Doo-Hyeun: caseid ~ h11b_1 (not including h11b_1)
*Umran: H11b_1 ~ idxml_1 (not including idxml_1)
*Brandon: Idxml_1 ~ s590c_4 (including s590c_4)






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

testing brandon
