**make new variable for maternal social class, but consolidate missing and separate military to missing
gen Maternal_Social_Class = c755
replace Maternal_Social_Class=. if Maternal_Social_Class<0
replace Maternal_Social_Class=. if Maternal_Social_Class>10
