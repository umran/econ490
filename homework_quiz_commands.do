cd "~/irukandjilabs/econ490"
use "./data/Gujurat_kids_women.dta"

* create age variable
gen age = v012

* summarize age to get the mean age of respondents
summ age

* create education years variable
gen yrs_edu = v133
recode yrs_edu 97=.

* summarize education years to get the mean years of education
summ yrs_edu

* create a dummy variable for if a woman is working or has worked
gen working_worked = 0
recode working_worked 0=1 if v731 > 0

* create a variable for whether the respondent justifies domestic violence if
* women have been unfaithful
gen just_unfaithful = s829f
recode just_unfaithful 8 = .

* create a dummy variable for whether the respondent justifies domestic violence
* for any reason
gen just = 0
recode just 0=1 if v744a==1
recode just 0=1 if v744b==1
recode just 0=1 if v744c==1
recode just 0=1 if v744d==1
recode just 0=1 if v744e==1
recode just 0=1 if s829f==1
recode just 0=1 if s829g==1
recode just 8=.

* create a variable for wealth index
gen wealth = v190

* tabulate whether the respondent justifies domestic violence against wealth
* index in order to find the proportion of women in each wealth group who
* justify domestic violence and therefore also to determine which group has the
* highest proportion of women who justify domestic violence
tab just wealth, row

* create a variable for educational attainment
gen edu_attain = v149

* get the correlation between whether a woman justifies domestic violence and
* her educational attainment, along with whether the correlation is significant
* at the 0.05 level
pwcorr just edu_attain, sig star(0.05)

* create a variable for the total number of sons a woman has given birth to by
* summing up the number of sons who are living with her, the number of sons who
* are living away from her and the number of sons who have died
gen tot_sons = v202 + v204 + v206

* create a dummy variable for whether the woman has ever given birth to a son
gen bin_sons = 0
recode bin_sons 0=. if tot_sons == .
recode bin_sons 0=1 if tot_sons > 0

* get the correlation between whether the respondent justifies domestic
* violence and the number of sons she has given birth to
pwcorr just tot_sons, sig star(0.05)

* get the correlation between whether the respondent justifies domestic
* violence and whether she has ever given birth to a son, just in case this
* is what the question really asks
pwcorr just bin_sons, sig star(0.05)

* create a variable for whether the respondent has a say in her own health
gen own_hlth = 0
recode own_hlth 0=1 if v743a < 4

* get correlation between whether a woman is working or has worked and whether
* she has a say in her own health
pwcorr working_worked own_hlth, sig star(0.05)

* create variable for mother's height
gen mother_height = v438

* create variable for child's height
gen child_height = hw3

* get correlation between mother's height and child's height and
pwcorr mother_height child_height, sig star(0.05)

* create variable for number of sources from which woman has heard of aids
gen aids = s902a + s902b + s902c + s902d + s902e + s902f + s902g + s902h + s902i + s902j + s902k + s902l + s902m + s902n + s902o + s902x

* create a dummy variable for whether the respondent has heard of aids
gen bin_aids = 0
recode bin_aids 0=. if aids == .
recode bin_aids 0=1 if aids > 0

* tabulate bin_aids to see the total number of respondents who have heard of
* aids in order to determine the proportion of women who have heard of aids
tab bin_aids
