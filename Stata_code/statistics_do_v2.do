*** edited by Chin Yang Shapland on 19/12/2023, added SES
*** LUNG FUNCTION AGAINST YES/NO MOULD, COMBINED MOULD AND SPLIT CATEGORICAL MOULD AT 8Y***

** Crude associations **

foreach i of varlist prfev1l_8 prfvcl_8 prratiol_8 prfev1l_15 prfvcl_15 prratiol_15 prfev1l_24 prfvcl_24 prratiol_24 {
	
	xi: regress `i' ib(0).mould_5y1m_binary
 }
 
** Adjusted for other covariates **
 
**Age 8 FEV1**
** Regress raw FEV1 at 8 years against binary mould, adjusting for age, height, sex and exposure to smoking
xi: regress prfev1l_8 ib(0).mould_5y1m_binary age_8 height_8 kz021 c_smk4 
** Regress raw FEV1 at 8 years against binary mould, adjusting for age, height, sex, exposure to smoking and SES
xi: regress prfev1l_8 ib(0).mould_5y1m_binary age_8 height_8 kz021 c_smk4 mum_highest_ed_2cat

**Age 8 FVC**
** Regress raw FVC at 8 years against binary mould, adjusting for age, height, sex and exposure to smoking
xi: regress prfvcl_8 ib(0).mould_5y1m_binary age_8 height_8 kz021 c_smk4
** Regress raw FVC at 8 years against binary mould, adjusting for age, height, sex and exposure to smoking and SES
xi: regress prfvcl_8 ib(0).mould_5y1m_binary age_8 height_8 kz021 c_smk4 mum_highest_ed_2cat

**Age 8 FEV1/FVC RATIO**
** Regress raw FEV1/FVC ratio at 8 years against binary mould, adjusting for age, height, sex and exposure to smoking
xi: regress prratiol_8 ib(0).mould_5y1m_binary age_8 height_8 kz021 c_smk4
** Regress raw FEV1/FVC ratio at 8 years against binary mould, adjusting for age, height, sex and exposure to smoking
xi: regress prratiol_8 ib(0).mould_5y1m_binary age_8 height_8 kz021 c_smk4 mum_highest_ed_2cat


*** LUNG FUNCTION AGAINST YES/NO MOULD, COMBINED MOULD AND SPLIT CATEGORICAL MOULD AT 15Y***

**Age 15 FEV1**
** Regress raw FEV1 at 15 years against binary mould, adjusting for age, height, sex and exposure to smoking
xi: regress prfev1l_15 ib(0).mould_5y1m_binary age_15 height_15 kz021 c_smk4 
** Regress raw FEV1 at 8 years against binary mould, adjusting for age, height, sex, exposure to smoking and SES
xi: regress prfev1l_15 ib(0).mould_5y1m_binary age_15 height_15 kz021 c_smk4 mum_highest_ed_2cat

**Age 15 FVC**
** Regress raw FVC at 8 years against binary mould, adjusting for age, height, sex and exposure to smoking
xi: regress prfvcl_15 ib(0).mould_5y1m_binary age_15 height_15 kz021 c_smk4
** Regress raw FVC at 8 years against binary mould, adjusting for age, height, sex and exposure to smoking and SES
xi: regress prfvcl_15 ib(0).mould_5y1m_binary age_15 height_15 kz021 c_smk4 mum_highest_ed_2cat

**Age 15 FEV1/FVC RATIO**
** Regress raw FEV1/FVC ratio at 8 years against binary mould, adjusting for age, height, sex and exposure to smoking
xi: regress prratiol_15 ib(0).mould_5y1m_binary age_15 height_15 kz021 c_smk4
** Regress raw FEV1/FVC ratio at 8 years against binary mould, adjusting for age, height, sex and exposure to smoking
xi: regress prratiol_15 ib(0).mould_5y1m_binary age_15 height_15 kz021 c_smk4 mum_highest_ed_2cat



*** LUNG FUNCTION AGAINST YES/NO MOULD, COMBINED MOULD AND SPLIT CATEGORICAL MOULD AT 24Y***

**Age 24 FEV1**
** Regress raw FEV1 at 15 years against binary mould, adjusting for age, height, sex and exposure to smoking
xi: regress prfev1l_24 ib(0).mould_5y1m_binary age_24 height_24 kz021 c_smk4 
** Regress raw FEV1 at 8 years against binary mould, adjusting for age, height, sex, exposure to smoking and SES
xi: regress prfev1l_24 ib(0).mould_5y1m_binary age_24 height_24 kz021 c_smk4 mum_highest_ed_2cat

**Age 24 FVC**
** Regress raw FVC at 8 years against binary mould, adjusting for age, height, sex and exposure to smoking
xi: regress prfvcl_24 ib(0).mould_5y1m_binary age_24 height_24 kz021 c_smk4
** Regress raw FVC at 8 years against binary mould, adjusting for age, height, sex and exposure to smoking and SES
xi: regress prfvcl_24 ib(0).mould_5y1m_binary age_24 height_24 kz021 c_smk4 mum_highest_ed_2cat

**Age 24 FEV1/FVC RATIO**
** Regress raw FEV1/FVC ratio at 8 years against binary mould, adjusting for age, height, sex and exposure to smoking
xi: regress prratiol_24 ib(0).mould_5y1m_binary age_24 height_24 kz021 c_smk4
** Regress raw FEV1/FVC ratio at 8 years against binary mould, adjusting for age, height, sex and exposure to smoking
xi: regress prratiol_24 ib(0).mould_5y1m_binary age_24 height_24 kz021 c_smk4 mum_highest_ed_2cat


*** LUNG FUNCTION TRAJECTORIES AGAINST YES/NO MOULD, COMBINED MOULD AND SPLIT CATEGORICAL MOULD ***

*** multinomial logistic regression comparing raw fev1/fvc ratio trajectories of lung function against binary mould exposure at 5, adjusting for heigh, age, sex and exposure to smoking 
xi: mlogit rawratio_class4 ib(0).mould_5y1m_binary , baseoutcome(2) rrr

gen sex = kz021
replace sex = . if sex==-1


*** multinomial logistic regression comparing raw fev1/fvc ratio trajectories of lung function against binary mould exposure at 5, adjusting for heigh, age, sex and exposure to smoking 
xi: mlogit rawratio_class4 ib(0).mould_5y1m_binary height_8 age_8 ib(1).sex c_smk4 , baseoutcome(2) rrr
*** multinomial logistic regression comparing raw fev1/fvc ratio trajectories of lung function against cat_split mould exposure at 5, adjusting for heigh, age, sex, exposure to smoking and SES
xi: mlogit rawratio_class4 ib(0).mould_5y1m_binary height_8 age_8 ib(1).sex c_smk4 mum_highest_ed_2cat, baseoutcome(2) rrr





*** DOCTOR DIAGNOSED ASTHMA AGAINST YES/NO MOULD, COMBINED MOULD AND SPLIT CATEGORICAL MOULD AT 7.5Y, 15Y AND 24Y ***

**Age 7.5**
xi: logistic dda_91 ib(0).mould_5y1m_binary
***logistic regression comparing doctor ever diagnosed asthma at 7.5y against binary mould exposure, adjusting for sex, exposure to smoking and SES(by mums highest education)
xi: logistic dda_91 ib(0).mould_5y1m_binary ib(1).sex c_smk4 mum_highest_ed_2cat

**Age 15**
xi: logistic dda_185 ib(0).mould_5y1m_binary 
***logistic regression comparing doctor ever diagnosed asthma at 15y against binary mould exposure, adjusting for sex, exposure to smoking and SES(by mums highest education)
xi: logistic dda_185 ib(0).mould_5y1m_binary ib(1).sex c_smk4 mum_highest_ed_2cat

*Age 24** 
xi: logistic dda_276 ib(0).mould_5y1m_binary
***logistic regression comparing doctor ever diagnosed asthma at 24y against binary mould exposure, adjusting for sex, exposure to smoking and SES(by mums highest education)
xi: logistic dda_276 ib(0).mould_5y1m_binary ib(1).sex c_smk4 mum_highest_ed_2cat






