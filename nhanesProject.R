
``
library(nhanesA)
library(NHANES)
library(plyr)

hbv <- nhanes('HEQ_H')
hbanti <- nhanes('HEPBD_H')
hbsAnti <- nhanes('HEPB_S_H')
demo <- nhanes('DEMO_H')
insu <- nhanes('HIQ_H')
home <- nhanes('HOQ_H')
sex <- nhanes('SXQ_H')
smoke <- nhanes('SMQ_H')
genHelth <- nhanes('HSQ_H')

demo1 <- demo[c("SEQN", "DMDBORN4")]
demo.vars <- names(demo1)
demo2 <- nhanesTranslate("DEMO_H", demo.vars, data=demo1)

hbv1 <- hbv[c("SEQN", "HEQ010")]
hbv.vars <- names(hbv1)
hbv2 <- nhanesTranslate("HEQ_H", hbv.vars, data=hbv1)

insu1 <- insu[c("SEQN", "HIQ011")]
insu.vars <- names(insu1)
insu2 <- nhanesTranslate("HIQ_H", insu.vars, data=insu1)

home1 <- home[c("SEQN", "HOQ065")]
home.vars <- names(home1)
home2 <- nhanesTranslate("HOQ_H", home.vars, data=home1)

sex1 <- sex[c("SEQN", "SXD021")]
sex.vars <- names(sex1)
sex2 <- nhanesTranslate("SXQ_H", sex.vars, data=sex1)

smoke1 <- smoke[c("SEQN", "SMQ078")]
smoke.vars <- names(smoke1)
smoke2 <- nhanesTranslate("SMQ_H", smoke.vars, data=smoke1)

genHealth1 <- genHelth[c("SEQN", "HSD010")]
genHealth.vars <- names(genHealth1)
genHealth2 <- nhanesTranslate("HSQ_H", genHealth.vars, data=genHealth1)

hbanti1 <- hbanti[c("SEQN", "LBDHBG")]
hbanti.vars <- names(hbanti1)
HBSAntigen2 <- nhanesTranslate("HEPBD_H", hbanti.vars, data=hbanti1)

hbs1 <- hbsAnti[c("SEQN", "LBXHBS")]
hbs.vars <- names(hbs1)
HBSAntibody2 <- nhanesTranslate("HEPB_S_H", hbs.vars, data=hbs1)

all.data <- join_all(list(demo2, insu2, home2, sex2, smoke2, genHealth2, hbv2, HBSAntibody2, HBSAntigen2), by = "SEQN", type = 'full')
names(all.data) <- c("id", "Birth Country", "Health Insurance", "Type of Home", 
                     "Had Sex", "How Soon Smoke", "General Health", "Core Antigen", 
                     "Surface Antigen", "Surface Antibody")



``

