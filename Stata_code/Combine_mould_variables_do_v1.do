**creates the variable "countmouldnomiss" with values 0 to 5 of number of variables NOT missing for each individual
egen countmouldnomiss=rownonmiss(f400_cleaned g440_cleaned h315_cleaned k5110_cleaned m2110_cleaned)
**excluding individuals with a count not missing of <5
** create variable "yes_mould_count" for number of variables for which yes was response
egen yes_mould_count=anycount(f400_cleaned g440_cleaned h315_cleaned k5110_cleaned m2110_cleaned), v(1)
**create variable "no_mould_count" for number of variables for which no was response
egen no_mould_count=anycount(f400_cleaned g440_cleaned h315_cleaned k5110_cleaned m2110_cleaned), v(0)
** create new variable with value 0 if all no response
gen mould0to7=0 if no_mould_count==5
** create new variable with value 1 if all yes response
replace mould0to7=1 if yes_mould_count==5
** create new variable with value 2 if countmouldnomiss has all 5 values present and mould0to7 currently has a missing values
replace mould0to7=2 if countmouldnomiss==5 & mould0to7==.
