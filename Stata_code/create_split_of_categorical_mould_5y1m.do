*** edited by Chin Yang Shapland on 19/12/2023, changing only mould_5y1m_cat as Khan email (23/11/2023)

***Generate a copy of categorical mould variables for splitting
gen mould_5y1m_binary = k5112_cleaned
  
***Of all created new variables convert 1 to 0
replace mould_5y1m_binary = 0 if mould_5y1m_binary ==1
 
*** Of all created new variables convert 2 to 1
replace mould_5y1m_binary = 1 if mould_5y1m_binary == 2

*** Of all created new variables convert 3 to 1
replace mould_5y1m_binary = 1 if mould_5y1m_binary == 3
   
***Create value label for mould variables with yes or no values
label define mould_splitcat_lb 0 "Not Serious Mould" 1 "Serious Mould"

*** attach number to label
numlabel mould_splitcat_lb, add

***attach value label to mould variables 
label values mould_5y1m_binary mould_splitcat_lb

