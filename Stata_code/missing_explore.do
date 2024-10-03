** Exploring missing lung function **

** Lung function at age 8 **

set trace on

foreach i of varlist prfev1l_8 prfvcl_8 prratiol_8 {
	
	sum age_8 height_8 if `i'!=.
	tab kz021 if `i'!=.
	tab c_smk4 if `i'!=.
	tab mum_highest_ed_2cat if `i'!=.	
	
	sum age_8 height_8 if `i'==.
	tab kz021 if `i'==.
	tab c_smk4 if `i'==.
	tab mum_highest_ed_2cat if `i'==.
 }
 
set trace off

** Lung function at age 15 **

set trace on

foreach i of varlist prfev1l_15 prfvcl_15 prratiol_15 {
	
	sum age_15 height_15 if `i'!=.
	tab kz021 if `i'!=.
	tab c_smk4 if `i'!=.
	tab mum_highest_ed_2cat if `i'!=.	
	
	sum age_15 height_15 if `i'==.
	tab kz021 if `i'==.
	tab c_smk4 if `i'==.
	tab mum_highest_ed_2cat if `i'==.
 }
 
 set trace off

** Lung function at age 24 **

set trace on

foreach i of varlist prfev1l_24 prfvcl_24 prratiol_24 {
	
	sum age_24 height_24 if `i'!=.
	tab kz021 if `i'!=.
	tab c_smk4 if `i'!=.
	tab mum_highest_ed_2cat if `i'!=.	
	
	sum age_24 height_24 if `i'==.
	tab kz021 if `i'==.
	tab c_smk4 if `i'==.
	tab mum_highest_ed_2cat if `i'==.
 }
 
 set trace off

*** Missing data patterns in predictor variables ***

** Lung function at age 8 **

*There was no variable that had complete data
mvpatterns mould_5y1m_binary age_8 height_8 kz021 c_smk4 mum_highest_ed_2cat

*No obvious data patterns
mvpatterns prfev1l_8 mould_5y1m_binary age_8 height_8 kz021 c_smk4 mum_highest_ed_2cat

*No obvious data patterns
mvpatterns prfvcl_8 mould_5y1m_binary age_8 height_8 kz021 c_smk4 mum_highest_ed_2cat

*Only 16 individuals are missing for all variables and 2,614 with complete data 
egen nmiss_age8_fev = rowmiss (prfev1l_8 mould_5y1m_binary age_8 height_8 kz021 c_smk4 mum_highest_ed_2cat)
tab nmiss_age8_fev

*Only 16 individuals are missing for all variables and 2,652 with complete data 
egen nmiss_age8_fvc = rowmiss (prfvcl_8 mould_5y1m_binary age_8 height_8 kz021 c_smk4 mum_highest_ed_2cat)
tab nmiss_age8_fvc

*No significant variable evidence to show MCAR
gen complete_age8_fev=nmiss_age8_fev==0
logistic complete_age8_fev ib(0).mould_5y1m_binary age_8 height_8 kz021 c_smk4 mum_highest_ed_2cat

*No significant variable evidence to show MCAR
gen complete_age8_fvc=nmiss_age8_fvc==0
logistic complete_age8_fvc ib(0).mould_5y1m_binary age_8 height_8 kz021 c_smk4 mum_highest_ed_2cat

** Lung function at age 15 **

*There was no variable that had complete data
mvpatterns mould_5y1m_binary age_15 height_15 kz021 c_smk4 mum_highest_ed_2cat

*No obvious data patterns
mvpatterns prfev1l_15 mould_5y1m_binary age_15 height_15 kz021 c_smk4 mum_highest_ed_2cat

*No obvious data patterns
mvpatterns prfvcl_15 mould_5y1m_binary age_15 height_15 kz021 c_smk4 mum_highest_ed_2cat

*Only 18 individuals are missing for all variables and 1,813 with complete data 
egen nmiss_m1 = rowmiss (prfev1l_15 mould_5y1m_binary age_15 height_15 kz021 c_smk4 mum_highest_ed_2cat)
tab nmiss_m1

*Only 18 individuals are missing for all variables and 1,841 with complete data 
egen nmiss_m2 = rowmiss (prfvcl_15 mould_5y1m_binary age_15 height_15 kz021 c_smk4 mum_highest_ed_2cat)
tab nmiss_m2

*No significant variable evidence to show MCAR
gen complete_m1=nmiss_m1==0
logistic complete_m1 ib(0).mould_5y1m_binary age_15 height_15 kz021 c_smk4 mum_highest_ed_2cat

*No significant variable evidence to show MCAR
gen complete_m2=nmiss_m2==0
logistic complete_m2 ib(0).mould_5y1m_binary age_15 height_15 kz021 c_smk4 mum_highest_ed_2cat

** Lung function at age 24 **

*There was no variable that had complete data
mvpatterns mould_5y1m_binary age_24 height_24 kz021 c_smk4 mum_highest_ed_2cat

*No obvious data patterns
mvpatterns prfev1l_24 mould_5y1m_binary age_24 height_24 kz021 c_smk4 mum_highest_ed_2cat

*No obvious data patterns
mvpatterns prfvcl_24 mould_5y1m_binary age_24 height_24 kz021 c_smk4 mum_highest_ed_2cat

*Only 24 individuals are missing for all variables and 1,457 with complete data 
egen nmiss_age24_fev = rowmiss (prfev1l_24 mould_5y1m_binary age_24 height_24 kz021 c_smk4 mum_highest_ed_2cat)
tab nmiss_age24_fev

*Only 24 individuals are missing for all variables and 1,457 with complete data 
egen nmiss_age24_fvc = rowmiss (prfvcl_24 mould_5y1m_binary age_24 height_24 kz021 c_smk4 mum_highest_ed_2cat)
tab nmiss_age24_fvc

*Some evidence that missingness is related to mum's education 
gen complete_age24_fev=nmiss_age8_fev==0
logistic complete_age24_fev ib(0).mould_5y1m_binary age_24 height_24 kz021 c_smk4 mum_highest_ed_2cat

*Some evidence that missingness is related to mum's education 
gen complete_age24_fvc=nmiss_age8_fvc==0
logistic complete_age24_fvc ib(0).mould_5y1m_binary age_24 height_24 kz021 c_smk4 mum_highest_ed_2cat