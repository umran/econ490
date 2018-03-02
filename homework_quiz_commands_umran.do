clear all
cd "~/irukandjilabs/econ490"
use "./data/Gujurat_kids_women.dta"

* create age variable
gen age = v012

* summarize age to get the mean age of respondents
summ age

* mean age = 26.16996

* create education years variable
gen yrs_edu = v133
recode yrs_edu 97=.

* summarize education years to get the mean years of education
summ yrs_edu

* mean yrs_edu = 4.753024

* create a dummy variable for if a woman is working or has worked in the past
* twelve months
gen working_worked = 0
recode working_worked 0=1 if v731 > 0

* tabulate the variable for if a woman is working or has worked in the last 12
* months in order to work out the proportion of women who have been working or
* have worked in the last 12 months
tab working_worked

* proportion working_worked = 703/1571

* create a variable for whether the respondent justifies domestic violence if
* women have been unfaithful
gen just_unfaithful = s829f
recode just_unfaithful 8 = .

* tabulate variable for whether the respondent justifies domestic violence if
* women have been unfaithful in order to get the number of women who think so
tab just_unfaithful

* total number of women who think domestic violence is justified if they have
* been unfaithful = 508

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

* the group with the highest proportion of women who justify domestic violence
* is the poorest wealth group (group 1) and the proportion is 114/160

* create a variable for educational attainment
gen edu_attain = v149

* get the correlation between whether a woman justifies domestic violence and
* her educational attainment, along with whether the correlation is significant
* at the 0.05 level
pwcorr just edu_attain, sig star(0.05)

* women are less likely to justify domestic violence as educational
* attainment increases. The correlation coefficient is -0.2007 and it is
* significant at the 0.05 level of significance

* create a variable for the total number of sons a woman has given birth to by
* summing up the number of sons who are living with her, the number of sons who
* are living away from her and the number of sons who have died
gen tot_sons = v202 + v204 + v206

* create a dummy variable for whether the woman has ever given birth to a son
gen bin_sons = 0
recode bin_sons 0=. if tot_sons == .
recode bin_sons 0=1 if tot_sons > 0

* tabulate variable for whether the woman has ever given birth to a son to get
* the number of women who have given birth to a son
tab bin_sons

* the number of women who have given birth to a son = 1257

* get the correlation between whether the respondent justifies domestic
* violence and the number of sons she has given birth to
pwcorr just tot_sons, sig star(0.05)

* women are only marginally more likely to justify domestic violence as the
* number of sons they have given birth to increases. The correlation coefficient
* is 0.0777 and it is significant at the 0.05 level

* get the correlation between whether the respondent justifies domestic
* violence and whether she has ever given birth to a son, just in case this
* is what the question really asks
pwcorr just bin_sons, sig star(0.05)

* women are only marginally more likely to justify domestic violence if she has
* given brith to a son. The correlation coefficient is 0.0422, however it is not
* significant at the 0.05 level

* create a variable for whether the respondent has a say in her own health
gen own_hlth = 0
recode own_hlth 0=1 if v743a < 4

* tabulate variable for whether the respondent has a say in her own health in
* order to determine the proportion of women who have a say in their own health
tab own_hlth

* the proportion of women who have a say on their own health = 865/1571

* get correlation between whether a woman is working or has worked and whether
* she has a say in her own health
pwcorr working_worked own_hlth, sig star(0.05)

* whether a woman is working or has worked seems to be weakly negatively
* correlated with whether she has a say on her own health. The correlation
* coefficient is -0.0311, but this result is not significant at the 0.05 level

* create variable for mother's height
gen mother_height = v438

* create variable for child's height
gen child_height = hw3

* get correlation between mother's height and child's height
pwcorr mother_height child_height, sig star(0.05)

* Children's height seem to be weakly positively correlated with their mother's
* height. The correlation coefficient is 0.0825 and this result is significant at
* the 0.05 level

* summarize all sources of information of aids in order to determine the
* proportion of women who had heard about aids from the respective sources
summ s902a s902b s902c s902d s902e s902f s902g s902h s902i s902j s902k s902l s902m s902n s902o s902x

* the most prominent source of information with 558/694 women having heard about
* aids via this medium is television

* create variable for number of sources from which woman has heard of aids
gen aids = s902a + s902b + s902c + s902d + s902e + s902f + s902g + s902h + s902i + s902j + s902k + s902l + s902m + s902n + s902o + s902x

* create a dummy variable for whether the respondent has heard of aids
gen bin_aids = 0
recode bin_aids 0=. if aids == .
recode bin_aids 0=1 if aids > 0

* tabulate bin_aids to see the total number of respondents who have heard of
* aids in order to determine the proportion of women who have heard of aids
tab bin_aids

* the proportion of women who have heard of aids = 694/1571
