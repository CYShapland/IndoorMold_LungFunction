 ***Generate a copy of categorical mould variables for splitting
 foreach var of varlist mould_preg_cat mould_8m_cat mould_1y9m_cat mould_2y9m_cat mould_5y1m_cat mould_7y1m_cat mould_10y2m_cat {
  generate `var'_split = `var'
  }
  ***Of all created new variables convert 1 to 0
 foreach var of varlist mould_preg_cat_split-mould_10y2m_cat_split {
    replace `var' = 0 if `var' ==1
  }
  *** Of all created new variables convert 2 to 1
foreach var of varlist mould_preg_cat_split-mould_10y2m_cat_split {
     replace `var' = 1 if `var' == 2
   }
    *** Of all created new variables convert 3 to 1
foreach var of varlist mould_preg_cat_split-mould_10y2m_cat_split {
     replace `var' = 1 if `var' == 3
   }
   
   
***Create value label for mould variables with yes or no values
label define mould_splitcat_lb 0 "Not Serious Mould" 1 "Serious Mould"
*** attach number to label
numlabel mould_splitcat_lb, add
***attach value label to mould variables 
label values  mould_preg_cat_split-mould_10y2m_cat_split mould_splitcat_lb

