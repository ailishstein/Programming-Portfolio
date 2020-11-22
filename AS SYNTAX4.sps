﻿* Encoding: UTF-8.
SET RNG = MT MTINDEX = 548695.
SAMPLE .90.

COMPUTE RVV = MEAN.3(H4RD18,H4RD19,H4RD21).
EXECUTE.

COMPUTE RVP = MEAN.3(H4RD22,H4RD23, H4RD25).
EXECUTE.

DATASET ACTIVATE DataSet1.
GLM RVV RVP BY H4RD13 BIO_SEX4
  /WSFACTOR=Violence_Perception 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(H4RD13*BIO_SEX4*Violence_Perception) TYPE=LINE ERRORBAR=CI MEANREFERENCE=NO 
    YAXIS=AUTO
  /EMMEANS=TABLES(H4RD13*BIO_SEX4*Violence_Perception)
   /EMMEANS=TABLES(H4RD13*BIO_SEX4*Violence_Perception) compare(H4RD13)
    /EMMEANS=TABLES(BIO_SEX4)
     /EMMEANS=TABLES(H4RD13)
      /EMMEANS=TABLES(Violence_Perception)
  /PRINT=DESCRIPTIVE ETASQ HOMOGENEITY 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Violence_Perception 
  /DESIGN=H4RD13 BIO_SEX4 H4RD13*BIO_SEX4.
