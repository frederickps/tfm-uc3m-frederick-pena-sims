# Welcome!

Welcome to the GitHub page on my Master Thesis "Evaluating Local Government Spending Efficiency on Labour Market Outcomes during the Covid-19 Pandemic in Spain: A Two-Stage Approach using DEA and ML".

## Instructions 

My work's code is split up into two Quarto .qmd files.
To reproduce my work, follow the subequent steps:

### 1 Download missing data files

Two files containing data are too large to upload them to GitHub. Follow the instructions to download them. Store the files in the folder 'Data_2020'

_Budget and revenue data (CONPREL)_

To download the correct file choose the option "Liquidaciones" from the year "2020". Download the file available below "2 - Datos por Entidad Local. Máximo nivel de desglose (Formato ACCESS)" (see picture below).

<img width="1117" alt="Screenshot 2024-06-21 140038" src="https://github.com/frederickps/master-thesis/assets/144943264/bfe29539-93c2-414e-81b4-2c9e9536c6f0">



_Age data per municipality_

Go to https://www.ine.es/jaxiT3/Tabla.htm?t=33575&L=0 and download the entire file. Store the file under 'avg_age_2020'. This step is not strictly necessary. A cleaned up version is stored in 'Data_2020' as 'avg_age_final'.

### 2 Data preprocessing

The file 'tfm_fetching_and_processing.qmd' contains the R-script used to read, transform, and create the ultimate data frame used in the analysis step. Explanations of non-intuitve code and important decisions is provided. This is especially relevant for understanding how the budgetary information was operationalized.


### 3 Analysis

The file 'tfm_analysis.qmd' contains the R-script to reproduce the analysis and reports on non-included steps inbetween. Figures and tables produced during the process are already stored in 'Figures' and 'Tables' respectively, but can be repoduced by going through the code.


### 4 Doubts and questions

If you have any doubts or would like to read my thesis, do not hesistate and contact me under:

frederick.penasims@web.de
