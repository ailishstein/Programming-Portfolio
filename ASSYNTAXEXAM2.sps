﻿* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=H4SP3H H4SP3M H4SP3T H4SP4H H4SP4M H4SP4T H4RD7A H4RD7B H4RD7C H4RD7D H4RD7E 
    H4RD7F H4RD7G H4SP7
  /ORDER=ANALYSIS.


RECODE H4RD7A H4RD7B H4RD7C H4RD7D H4RD7E H4RD7F H4RD7G (1=5) (2=4) (3=3) (4=2) (5=1) INTO H4RD7AR 
    H4RD7BR H4RD7CR H4RD7DR H4RD7ER H4RD7FR H4RD7GUSE ALL.

COMPUTE VarianceRQ=VARIANCE(H4RD7AR,H4RD7BR,H4RD7CR,H4RD7DR,H4RD7ER,H4RD7FR,H4RD7GR).
EXECUTE.

COMPUTE TotalRQ=H4RD7AR+H4RD7BR+H4RD7CR+H4RD7DR+H4RD7ER+H4RD7FR+H4RD7GR.
EXECUTE.

USE ALL.
COMPUTE filter_$=(VarianceRQ = 0).
VARIABLE LABELS filter_$ 'VarianceRQ = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

SUMMARIZE
  /TABLES=AID TotalRQ BY VarianceRQ
  /FORMAT=VALIDLIST NOCASENUM
  /TITLE='Case Summaries'
  /MISSING=VARIABLE
  /CELLS=COUNT.

filter off.

DATASET ACTIVATE DataSet1.
T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=TotalRQ
  /CRITERIA=CI(.90).

COMPUTE WakeUpTime.Dec=H4SP3H + (H4SP3M / 60).
EXECUTE.

COMPUTE SleepTime.Dec=H4SP4H + (H4SP4M / 60).
EXECUTE.

IF (H4SP3T = H4SP4T & SleepTime.Dec = WakeUpTime.Dec)Sleep_Duration=24.
IF (H4SP3T ~= H4SP4T & SleepTime.Dec = WakeUpTime.Dec)Sleep_Duration=12.
IF (H4SP3T = 1 & H4SP4T = 2 & SleepTime.Dec ~= WakeUpTime.Dec & SleepTime.Dec ~= 12)Sleep_Duration= (WakeUpTime.Dec) + (12 - SleepTime.Dec).
IF (H4SP3T = 1 & H4SP4T = 1 & SleepTime.Dec ~= WakeUpTime.Dec & SleepTime.Dec = 12)Sleep_Duration = WakeUpTime.Dec.
IF (H4SP3T = 1 & H4SP4T = 2 & SleepTime.Dec ~= WakeUpTime.Dec & SleepTime.Dec = 12)Sleep_Duration = WakeUpTime.Dec + 12.
IF (H4SP3T = 1 & H4SP4T = 1 & SleepTime.Dec ~= WakeUpTime.Dec & SleepTime.Dec ~= 12)Sleep_Duration = WakeUpTime.Dec - SleepTime.Dec.
IF (H4SP3T = 2 & H4SP4T = 1 & SleepTime.Dec ~= WakeUpTime.Dec & WakeUpTime.Dec = 12)Sleep_Duration = WakeUpTime.Dec - SleepTime.Dec.
IF (H4SP3T = 1 & H4SP4T = 1 & SleepTime.Dec ~= WakeUpTime.Dec & 12< SleepTime.Dec)Sleep_Duration = WakeUpTime.Dec + 12 - SleepTime.Dec.
IF (H4SP3T = 1 & H4SP4T = 1 & SleepTime.Dec ~= WakeUpTime.Dec & SleepTime.Dec ~= 12) Sleep_Duration = WakeUpTime.Dec - SleepTime.Dec.
IF (H4SP3T = 2 & H4SP4T = 2 & SleepTime.Dec ~= WakeUpTime.Dec & WakeUpTime.Dec = 12) Sleep_Duration = WakeUpTime.Dec +12 - SleepTime.Dec.
IF (H4SP3T = 2 & H4SP4T = 1 & SleepTime.Dec ~= WakeUpTime.Dec) Sleep_Duration = WakeUpTime.Dec + SleepTime.Dec.
IF (H4SP3T = 2 & H4SP4T = 2 & SleepTime.Dec ~= WakeUpTime.Dec) Sleep_Duration = WakeUpTime.Dec + SleepTime.Dec.
IF (H4SP3T = 1 & H4SP4T = 1 & SleepTime.Dec > WakeUpTime.Dec & SleepTime.Dec ~= 12) Sleep_Duration = 24 - (SleepTime.Dec - WakeUpTime.Dec). 
EXECUTE.
                                                                                                                               
DESCRIPTIVES VARIABLES=Sleep_Duration
    /STATISTICS=MEAN STDDEV MIN MAX.
    
T-TEST
    /TESTVAL=8
    /MISSING=ANALYSIS
    /VARIABLES=Sleep_Duration
    /CRITERIA=CI(.95).
    
FREQUENCIES VARIABLES=Sleep_Duration
    /ORDER=ANALYSIS.
    
                                                                                                                                              
