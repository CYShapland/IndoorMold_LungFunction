 ***Generate a copy of mould variables for cleaning
 foreach var of varlist a080-q2112 {
  generate `var'_cleaned = `var'
  }
  ***Of all created new variables convert all missing terms <0 to "."
 foreach var of varlist a080_cleaned-q2112_cleaned {
    replace `var' = . if `var' <0
  }
  *** for all yes or no variables code No as "0" as was previously "2". Yes remains as "1"
foreach var of varlist a080_cleaned f400_cleaned g440_cleaned h315_cleaned k5110_cleaned m2110_cleaned pk2110_cleaned q2110_cleaned {
     replace `var' = 0 if `var' == 2
   }
   ***for all variables on a scale ensure that scale starts at 0, as previously started at 1.
   foreach var of varlist a082_cleaned f402_cleaned g442_cleaned h317_cleaned k5112_cleaned m2112_cleaned pk2112_cleaned q2112_cleaned  {
     replace    `var' = `var' - 1
      }
***Create value label for mould variables with yes or no values
label define mould_noyes_lb 0 "No" 1 "Yes"
*** attach number to label
numlabel mould_noyes_lb, add
***attach value label to mould variables with yes or no
label values  a080_cleaned f400_cleaned g440_cleaned h315_cleaned k5110_cleaned m2110_cleaned pk2110_cleaned q2110_cleaned mould_noyes_lb
***Create value label for mould variables with categorical scale
label define mould_categorical_lb 0 "No Mould" 1 "Not Serious" 2 "Fairly Serious" 3 "Very Serious"
***attach number to label
numlabel mould_categorical_lb, add
***attach value label to mould variables with categorical scale
label values  a082_cleaned f402_cleaned g442_cleaned h317_cleaned k5112_cleaned m2112_cleaned pk2112_cleaned q2112_cleaned mould_categorical_lb



