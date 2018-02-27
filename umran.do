clear all
cd "~/irukandjilabs/econ490"
use "data/Women_complete_3states.dta"

gen cat_current_marital_status = v501

gen cat_ever_married = v502

gen cat_number_of_unions = v503

gen cat_lives_with_husband = v504

gen cat_number_of_other_wives = v505

gen cat_month_of_first_marriage = v507

gen cat_year_of_first_marriage = v508

gen age_at_first_marriage = v511

gen years_since_first_marriage = v512

gen cat_duration_of_marriage = v513

gen age_at_first_intercourse = v525

gen cat_recent_sexual_activity = v536

gen months_of_abstinence = v537

gen cat_fertility_pref = v602

gen cat_preferred_waiting_time = v603

gen cat_desire_for_more_children = v605

gen ideal_number_of_children = v613

gen cat_time_for_future_birth = v616

gen cat_husband_desire_for_children = v621

gen cat_exposure = v623

gen cat_unmet_need = v624

gen ideal_number_of_boys = v627

gen ideal_number_of_girls = v628

gen ideal_number_of_either = v629

gen cat_dec_maker_for_contr_use = v632

gen cat_husb_std_as_reason_no_sex = v633a

gen cat_other_women_as_reason_no_sex = v633b

gen cat_being_tired_as_reason_no_sex = v633d

gen cat_husband_knows_using_contra = v634

gen cat_part_edu_level = v701

gen cat_part_highest_edu_year = v702

gen cat_part_specific_occupation = v704

gen cat_part_general_occupation = v705

gen cat_specific_occupation = v716

gen cat_general_occupation = v717

gen degree_final_say_on_healthcare = v743a

gen cat_ever_heard_of_std = v751

gen cat_ever_heard_of_aids = v750

gen cat_think_can_prev_aids_no_sex = v754bp

gen cat_think_prev_aids_condoms = v754cp

gen cat_think_prev_aids_one_sex_part = v754dp

gen cat_used_condom_last_intercourse = v761

* v762xx represent binary variables indicating source of condom per source

gen num_sex_part_excl_husb_past_year = v766a

gen num_sex_part_past_year = v766b

gen cat_relationship_with_last_part = v767a

gen cat_relationship_with_other_part = v767b

gen cat_duration_known_last_partner = v768a

gen cat_duration_known_other_partner = v768b

gen cat_could_get_condom = v769

gen cat_condom_used_first_sex = v820

gen age_of_first_sex_partner = v830

gen cat_condom_with_last_part = v833a

gen cat_condom_with_nxt_to_last_part = v833b

gen age_of_last_sexual_partner = v834a

gen age_of_nxt_to_last_sex_part = v834b

gen tot_no_of_sex_partners = v836
