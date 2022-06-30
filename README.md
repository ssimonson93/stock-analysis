# Overview of Project
This project was conducted to find trends in data regarding how well 12 different alternative energy stocks performed from in 2017 and 2018.   An individual, Steve, is looking to investigate these stocks to accurately advise his parents whether or not they should invest in them.  As such, each stock was analyzed to determine how good of a return they produced in 2017 and 2018, in order to best predict which stocks would be worth buying. 

# Results
In order to automate and perform this analysis quickly, as well as to allow this process to be potentially applicable to other stock data beyond these 12 energy companies, VBA code was utilized.  An index of the tickers associated with each stock was created, and a For loop was used to cycle each stock and find the starting price, ending price, and total volume of shares traded over the course of the year.  Each stock’s performance can be seen below for 2017 and 2018, in Figures 1 and 2 respectively.  Originally, the code used to find these utilized [a nested For loop](https://github.com/ssimonson93/stock-analysis/blob/main/Original%20yearValueAnalysis%20Code.bas), which cycled through and output the price and volume data for each ticker before moving onto the next ticker.  However, this code was refactored into [a single For loop](https://github.com/ssimonson93/stock-analysis/blob/main/Refactored%20AllStocksAnalysis%20Code.bas) that was able to cycle through and record the price and volume data for each ticker and move onto the next without outputting data first, instead outputting the data collectively at the end.  This was able to save a significant amount of time, as shown below.  Figure 3 shows the time it took to run the original code for 2017 and 2018, while Figure 4 shows the time it took to run the refactored code.

## Figure 1

![This is an image](https://github.com/ssimonson93/stock-analysis/blob/main/Performance%20of%20Stocks%202017.PNG)

## Figure 2

![This is an image](https://github.com/ssimonson93/stock-analysis/blob/main/Performance%20of%20Stocks%202018.PNG)

## Figure 3

![This is an image](https://github.com/ssimonson93/stock-analysis/blob/main/Speed%20of%20Original%202017%20Code%20Run.PNG)
![This is an image](https://github.com/ssimonson93/stock-analysis/blob/main/Speed%20of%20Original%202018%20Code%20Run.PNG)

## Figure 4

![This is an image](https://github.com/ssimonson93/stock-analysis/blob/main/Speed%20of%20Refactored%202017%20Code%20Run.PNG)
![This is an image](https://github.com/ssimonson93/stock-analysis/blob/main/Speed%20of%20Refactored%202018%20Code%20Run.PNG)

#  Summary
There are a number of benefits and drawbacks to refactoring code.  On one hand, updating the process the code is carrying out can make things smoother and improve efficiency.  Additionally, the act of cleaning up code can help one further understand what its doing, and make it more easily readable by anyone else who may need to utilize it.  However, refactoring code requires further time and work spent on a project for which the intended result has already been achieved.  It can also cause confusion, were an original line of code to be misunderstood and implemented improperly after refactoring an entire subroutine could be broken.

These disadvantages were seen in this project as well, as extra work was done to remove the nested loop and clean up the process despite the code already producing the desired data in under one second.  However, while it did require extra time, refactoring the code ultimately proved advantageous in this project, increasing the speed with which the code was able to output the desired data tenfold.  More importantly, this improved efficiency will allow the code to handle much greater numbers of stocks or other types of data better than the original code could have.
