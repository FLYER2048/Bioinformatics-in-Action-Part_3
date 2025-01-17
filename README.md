# Bioinformatics-in-Action-Part_3

## Warning!

**Academic misconduct is strictly regulated and punished at Haide College and the University of Adelaide. The individual report of this assignment will be reviewed and those who engage in academic misconduct may be subject to grade cancellation and other actions. This repository in GitHub is only for sharing solutions and academic communication and in no way encourages or condones academic misconduct!**

**海德学院和阿德莱德大学对学术不端行为进行严格管理和处罚。本次作业的个人报告将接受查重，有学术不端行为者可能会被取消成绩。GitHub上的此仓库仅用于分享解决方案和学术交流，绝不鼓励或纵容学术不端行为！**

## Introduction to this assignment

**Bioinformatics in Action**

One application of bioinformatics is in the use of whole-genome sequencing for clinical microbiology diagnostics. Bacteria from an infection can be isolated and sequenced. The genomic data can then be queried for specific features in order to guide the most effective treatment. These features include antibiotic resistance genes, as well as markers that identify which species the bacterial isolate belongs to. This information can then be used to inform the most appropriate antibiotic(s) for treating the infection.

In this project, you will be given whole-genome sequencing data from several bacterial infections. Your job is to determine which bacterial species is responsible for each infection and which antibiotics could be used for treatment.

**Bioinformatics in Action** assessment consists of **three parts**:

- **Part 1:** Group oral presentation

- **Part 2:** Group peer feedback

- **Part 3**: Individual short report

---

**Bioinformatics in Action: Part 3 Individual Short Report (400-500 words)**

You will be given **one additional dataset** to analyse individually. These **individual** datasets will be different for each student.
You should repeat the steps you used in your group analysis on your individual dataset, and then write a report based on your individual results.

The report should include the following **headings**:

- **Introduction**In this section you should provide relevant background on the research area and define the research question to be answered.

- **Methods**In this section you should describe the analysis steps. For each step, please specify the code that you ran, and explain what each command is doing.

- **Results**In this section you should summarise the important features of the outputs produced from your analysis steps.

- This may include images (e.g. screenshots from your RStudio terminal or screenshots from IGV) not counted towards the word limit.
Remember that some of your output files may be very large. If so, you should focus on presenting the information that is needed to form your conclusions. You do ***not*** need to include the whole output files in your report. Screenshots showing the relevant sections are fine. Part of the challenge here is in learning how to **be concise** and only present the aspects of your result files that are relevant to the research question you are addressing.

- **Conclusions**In this section you should briefly summarise your overall findings in the context of the research question being addressed.

Note: This is an **individual** assessment. Make sure you do not breach the Academic Integrity Policy.

**Weighting**: 20%
**Due**: 03/12/2024, 10:00pm.

---

Want to see Part 1? Click [here](https://github.com/FLYER2048/Bioinformatics-in-Action-Part_1)

## De-weighting

This assignment provides each student with a copy of the Illumina bidirectional sequencing file named after their student number. We can calculate the SHA256 hash value for the forward chain (run 1) of each sequencing sample in the job. Since the hash values of the same file must be the same, we obtained 9 different hash values based on the de-weighting of the calculation results.

- bddda50f5597a76b482e99921ff5da67abb5c1bddea1b03fcc8655ce6da8f1bf

- f7b81e905bf5149691cc83b5dde8acdbecc790eed3c2b35a667394cb4caf0d85

- 27e09a6618221d3f1a92dab93a7984993ec7dfaf8962edb190244f0d9640573f

- 86c4bb3a7f2e219c1c41bd1742ce3058bbe07f791bacd9faf03481c4ce0cf31f

- b7c5efd66d75db79bdd8d2db27be24816563b7251cc72d078fb3e830c16b2499

- d7bc3b4b89593aac893fa937375f90888fec0e3108e00ac47a937588a64f8719

- fe54373b8ea611b8ff2b557f6a4dbdebc10d0349fc712f877c8ae8eada08fcae

- 91901d98abf305cec0b9f6bf433c3c753766fefd244ddf679885a02a3885696c

- d7053f9947f8d349becd1b9f0bcd96fa2a343b4ebe0b7a4207507cca5ed6502d

The corresponding student IDs are:

- 20220001023

- 22220001001

- 22220001002

- 22220001004

- 22220001005

- 22220001009

- 22220001011

- 22220001012

- 22220001025

Accordingly, we only need to run the code using samples from these nine students to get the results for the entire class.

Want to see the description of the bash file? Go to [Part 1](https://github.com/FLYER2048/Bioinformatics-in-Action-Part_1)
