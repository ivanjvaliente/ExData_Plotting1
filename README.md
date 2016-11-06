Exploratory Data Analysis Project 1
================

\`\`\`

This is my repository for the Coursera's course "Exploratory Data Analysisct , Project 1". The repository contains 8 files: 4 scripts and 4 png files

Each script, called "ploti.R" (where i = 1 to 4), generates a plot and save it in a file called "ploti.png".

The scripts read the data from the folder named "project\_1\_data". If the folder doesn't exist, the script creates it, download the zip file from the Url provided in the project, and unzip it in the folder.

After that, the script makes a rough verification that the memory required by the whole data is under the memory limit allocated for R environment. As it was the case. I read the whole dataset.

Then, I created a new data frame extracting from the whole data the period of time that must be displayed in the project. The plots are displayed first on the screen, and then the pictures are copied in png files.

To run those script you need to execute the following steps:

1.  download the scipts in your working directory
2.  run the scripts
3.  display the ploti.png files using your preferred webbroser

P.S.

-   I used the R package "lubridate" to facilitate the time data manipulation in this project. Assure that this library is available in your environment

-   I was facing some difficulties (with the R version 3.2.4) to adjust the text font size in the legend. That's why legend text is not actually readable in the plot4
