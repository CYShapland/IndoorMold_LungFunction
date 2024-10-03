**make new variable for maternal social class, but consolidate missing and separate military to missing
gen Maternal_Social_Class = c755
replace Maternal_Social_Class=. if Maternal_Social_Class<0
replace Maternal_Social_Class=. if Maternal_Social_Class>10
** create a new variable splitting the Maternal_Social_Class variable into 3 categories called Maternal_Social_Class_3cat
gen Maternal_Social_Class_3cat = Maternal_Social_Class
replace Maternal_Social_Class = 0 if Maternal_Social_Class_3cat ==6
replace Maternal_Social_Class = 0 if Maternal_Social_Class_3cat ==5
replace Maternal_Social_Class = 1 if Maternal_Social_Class_3cat ==4
replace Maternal_Social_Class = 1 if Maternal_Social_Class_3cat ==3
replace Maternal_Social_Class = 2 if Maternal_Social_Class_3cat ==2
replace Maternal_Social_Class = 2 if Maternal_Social_Class_3cat ==1
label define Social_Class_3cat_lb 0 "Highest Classes" 1 "Middle Classes" 2 "Lowest Classes"
numlabel Social_Class_3cat_lb, add
label values Maternal_Social_Class_3cat Social_Class_3cat_lb
