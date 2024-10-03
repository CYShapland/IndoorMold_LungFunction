** creating a variable  mum_highest_ed which is cleaned version of mums highest ed qualification (c645a)
gen mum_highest_ed = c645a
replace mum_highest_ed=. if mum_highest_ed <0
replace mum_highest_ed= mum_highest_ed-1
**create two category maternal education called mum_highest_ed_2cat
gen mum_highest_ed_2cat = mum_highest_ed
replace mum_highest_ed_2cat = 0 if mum_highest_ed_2cat==1
replace mum_highest_ed_2cat = 0 if mum_highest_ed_2cat==2
replace mum_highest_ed_2cat = 1 if mum_highest_ed_2cat==3
replace mum_highest_ed_2cat = 1 if mum_highest_ed_2cat==4
label define educat_2cat 0 "at most O level" 1 "A level or degree"
numlabel educat_2cat, add
label values mum_highest_ed_2cat educat_2cat
