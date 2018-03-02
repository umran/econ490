cd "~/irukandjilabs/econ490"
use "./data/Gujurat_kids_women.dta"
browse v453
gen age = v012
summ age
labelbook v012
labellist v012
codebook v012
summ v012
gen yrs_edu = v133
labellist v133
labelbook v133
recode yrs_edu 97=.
summ yrs_edu
tab v731
gen working_worked = 0
labelbook v731
recode working_worked 0=1 if v731 > 0
browse working_worked v731
tab working_worked
labelbook v744a
labelbook s829f
gen just_unfaithful = s829f
recode just_unfaithful 8 = .
tab just_unfaithful
gen just = 0
recode just 0=1 if v744a==1
recode just 0=1 if v744b==1
recode just 0=1 if v744c==1
recode just 0=1 if v744d==1
recode just 0=1 if v744e==1
recode just 0=1 if s829f==1
recode just 0=1 if s829g==1
labelbook v744a
labelbook s829f
recode just 8=.
browse just v744a v744b v744c v744d v744e s829f s829g
gen wealth = v190
labelbook v190
tab just wealth, row
labelbook v149
labelbook edu_attain = v149
gen edu_attain = v149
corr just yrs_edu
corr just edu_attain
labelbook v202
browse v202 v204 v206
tot_sons = v202 + v204 + v206
gen tot_sons = v202 + v204 + v206
gen bin_sons = 0
recode bin_sons 0=1 if tot_sons > 0
browse bin_sons tot_sons v202 v204 v206
tab bin_sons
labelbook v044
labelbook d005s
browse d005s
corr just bin_sons
corr just tot_sons
pwcorr just bin_sons, sig star(0.05)
pwcorr just tot_sons, sig star(0.05)
labelbook v743
codebook v743
labelbook v743a
gen own_hlth = 0
recode own_hlth 0=1 if v743a < 4
tab own_hlth
pwcorr working_worked own_hlth, sig star(0.05)
browse working_worked v731
browse own_hlth v743a
browse v438 hw3
labelbook hw3
labelbook v438
gen mother_height = v438
gen child_height = hw3
pwcorr mother_height child_height, sig star(0.05)
gen aids = s902a + s902b + s902c + s902d + s902e + s902f + s902g + s902h + s902i + s902j + s902k + s902l + s902m + s902n + s902o + s902p + s902q + s902r + s902s + s902t + s902u + s902v + s902w + s902x
gen aids = s902a + s902b + s902c + s902d + s902e + s902f + s902g + s902h + s902i + s902j + s902k + s902l + s902m + s902n + s902o + s902q + s902r + s902s + s902t + s902u + s902v + s902w + s902x
gen aids = s902a + s902b + s902c + s902d + s902e + s902f + s902g + s902h + s902i + s902j + s902k + s902l + s902m + s902n + s902o s902x
gen aids = s902a + s902b + s902c + s902d + s902e + s902f + s902g + s902h + s902i + s902j + s902k + s902l + s902m + s902n + s902o + s902x
tab aids
