clear all
cd "~/irukandjilabs/econ490"
use "data/Women_complete_3states.dta"

gen cat_current_marital_status = v501

gen cat_ever_married = v502

gen cat_number_of_unions = v503

gen cat_lives_with_husband = v504

gen cat_number_of_other_wives = v505
  * 0 = no other wives, 98 = don't know

gen month_of_first_marriage = v507
  * values from 1-12, with 12 unique values each corresponding to a month

gen year_of_first_marriage = v508
  * values from 1965-2006, with 40 unique years

gen age_at_first_marriage = v511
  * values from 3-44, with 40 unique values

gen years_since_first_marriage = v512
  * values from 0-40, with 39 unique values

gen cat_duration_of_marriage = v513
  * 0 = never married, rest are grouped into 7 categories

gen age_at_first_intercourse = v525
  * 96 = at first union, 97 = inconsistent, 98 = don't know

gen cat_recent_sexual_activity = v536
  * 4 types of recent sexual activity

gen months_of_abstinence = v537
  * 60 = 60+, 96 = before last birth, 97 = inconsistent, 98 = don't know

gen cat_fertility_pref = v602
  * 6 fertility choices

gen cat_preferred_waiting_time = v603
  * 996 = other (non numeric), 997 = inconsistent, 998 = don't know

gen cat_desire_for_more_children = v605
  * 8 choices

gen ideal_number_of_children = v613
  * 96 = non-numeric responce, 98 = don't know

gen cat_time_for_future_birth = v616
  * 996 = other, 998 = don't know

gen cat_husband_desire_for_children = v621
  * 8 = dk, 3 choices expressing husband's desire for more children relative to the respondent

gen cat_exposure = v623
  * 4 choices: fecund, pregnanr, amenorrheic, infecund or menopausal

gen cat_unmet_need = v624
  * 10 choices: never had sex, unmet need to space, unmet need to limit, etc.

gen ideal_number_of_boys = v627
  * 96 = other, 97 = undefined, 98 = don't know

gen ideal_number_of_girls = v628
  * 96 = other, 97 = undefined, 98 = don't know

gen ideal_number_of_either = v629
  * 96 = other, 97 = undefined, 98 = don't know

gen cat_dec_maker_for_contr_use = v632
  * 6 = other, 3 choices expressing degree of independence of choosing contraceptive

gen cat_husb_std_as_reason_no_sex = v633a
  * 8 = don't know, 2 choices: 1 = yes, 0 = no

gen cat_other_women_as_reason_no_sex = v633b
  * 8 = don't know, 2 choices: 1 = yes, 0 = no

gen cat_being_tired_as_reason_no_sex = v633d
  * 8 = don't know, 2 choices: 1 = yes, 0 = no

gen cat_husband_knows_using_contra = v634
  * 8 = don't know, 2 choices: 1 = yes, 0 = no, (does the husband know that the respondent is using contraceptives)

gen cat_part_edu_level = v701
  * 8 = don't know, 4 choices: no education, primary, secondary, higher, (partner's education level)

gen cat_part_highest_edu_year = v702
  * 98 = don't know

gen cat_part_specific_occupation = v704
  * 96 = other, 97 = no occupation, 98 = don't know, (partner's specific occupation)

gen cat_part_general_occupation = v705
  * 98 = don't know

gen cat_specific_occupation = v716
  * 96 = other, 97 = no occupation, 98 = don't know, (partner's specific occupation)

gen cat_general_occupation = v717
  * 98 = don't know

gen degree_final_say_on_healthcare = v743a
  * 5 = someone else, 6 = other, (degree of final say on healthcare relative to husband and others)

gen bin_ever_heard_of_std = v751

gen cat_ever_heard_of_aids = v750
  * 9 = don't know

gen cat_think_can_prev_aids_no_sex = v754bp
  * 8 = don't know, (does the respondent think she can reduce the chances of aids by not having sex)

gen cat_think_prev_aids_condoms = v754cp
  * 8 = don't know, (does the respondent think she can reduce the chances of aids by always using condoms)

gen cat_think_prev_aids_one_sex_part = v754dp
  * 8 = don't know, (does the respondent think she can reduce the chances of aids by having only 1 sex partner)

gen cat_used_condom_last_intercourse = v761
  * 8 = don't know, (did the respondent use a condom during her last sexual intercourse)

* v762xx represent binary variables indicating source of condom per source

gen num_sex_part_excl_husb_past_year = v766a
  * 98 = don't know

gen num_sex_part_past_year = v766b
  * 98 = don't know

gen cat_relationship_with_last_part = v767a
  * 96 = other, (type of relationship with last sexual partner)

gen cat_relationship_with_other_part = v767b
  * 96 = other, (type of relationship with other sexual partners)

gen cat_duration_known_last_partner = v768a

gen cat_duration_known_other_partner = v768b

gen cat_could_get_condom = v769
  * 8 = don't know

gen cat_condom_used_first_sex = v820
  * 8 = don't know or don't remember

gen age_of_first_sex_partner = v830
  * 95 = 95+, 98 = don't know

gen bin_condom_with_last_part = v833a

gen bin_condom_with_nxt_to_last_part = v833b

gen age_of_last_sexual_partner = v834a
  * 95 = 95+, 98 = don't know

gen age_of_nxt_to_last_sex_part = v834b
  * 95 = 95+, 98 = don't know

gen tot_no_of_sex_partners = v836
  * 95 = 95+, 98 = don't know
