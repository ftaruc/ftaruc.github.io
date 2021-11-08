## Yipit Take Home Assignment



### Go.com Application Exercise

Before explaining my answer, I want to  highlight some data irregularities:

![image-20210701114405859](C:\Users\ferdi\AppData\Roaming\Typora\typora-user-images\image-20210701114405859.png)

* For data from 1q15, there are 256 data points (which is strange since there should be 270 total points for the 3 month period from January to March, 90 points for each category sold). 
  * Also want to note that from the table above, there seems to be no irregularities of the range of daily revenue sold for each category (based on my understanding of the costs of boats, cars, and planes). 

* If we look closely from the data, there is a two week span, from 2/7 (Saturday) to 2/20 (Friday), where there was no daily revenue for boats. This is either a mistake when the data was ingested, or we can safely assume that no boats were sold in this two week period (and thus no revenue). However, it's strange to assume the latter as that means no consumers were interested in boats in this two week period, or that there was no stock available on the website, and is especially weird since this happened in the middle of the month of February when boats were sold before and after this period.

  * Thus, we can assume that we are under-estimating total revenue for the boats category for 1q15.

* From the historical data, I want to note that we see a large spike of revenue from 3q14 to 4q14 due to the influx of revenue from the sales of planes (an increase of almost $10,000). It's hard to tell if this spike is seasonal from the Q4 without data from previous years. However, this is interesting as from 1q15, the total revenue for planes drops back to the average revenue seen across quarters (around $35,000), but the total revenue for cars spikes (an increase of almost $10,000) from the previous quarter.

  * This effect was not seen from 4q13 to 1q14, and we should be speculative on inferring why we see a large shift of sources of revenue.

  ---

  **Calculating profit for 1q15:**

  * Note: I thought about using a forecasting model (some time series) to calculate profits based on past revenue and profits, but due to the lack of data points, the model would be somewhat biased and inaccurate. Thus, I decided to base it on reasoning.

* After calculating the total revenue for each category in 1q15, we get the following:

  ![image-20210701115659501](C:\Users\ferdi\AppData\Roaming\Typora\typora-user-images\image-20210701115659501.png)

* By working backwards using historical data, we can find total cost for all quarter for 2014 (Total Revenue - Total Profits = Total Cost):

![image-20210701120144812](C:\Users\ferdi\AppData\Roaming\Typora\typora-user-images\image-20210701120144812.png)

* Although it's strange that go.com does not have data for total costs of 1q15 (as it would make it easier to calculate profits), we now have to infer the costs of 1q15 based on prior assumptions to calculate total profits for this quarter.
  * Now, I have to infer from historical data from total costs (have we increased or decreased stock for certain categories). This proves difficult without a general understanding of why costs increased or decreased for certain quarters, and especially why there was a large increase of revenue from 3q14 to 4q14 from planes, and the shift of revenue from 4q14 to 1q15 from planes to cars. Based on the shift of revenue, it's safe to assume that cost for planes have decreased for 1q15 and cost for cars have increased dramatically for this quarter, or else go.com would incur millions of dollars in lost profit (which seems unnatural based on profits from previous quarters). We can hopefully assume that go.com can predict customer behavior and buys appropriate stock for that quarter (despite this assumption not being made from the exercise)
  * For boats, we will take the average cost across the past 5 quarters as there were no significant changes. Thus, the assumed cost for boats for 1q15 is $4,594,206.48.
  * For planes, we have to revert the increased cost from 4q14 due to fact revenue dropped for this quarter. By taking the closest cost for planes based on past quarter's revenue, we see that based on 4q13, we will impute this cost for 1q15 as       $32,177,705.99.
  * For cars, we account for the increased revenue by increasing the cost from 4q14 by this shift of revenue. Thus, the assumed cost for cars for 1q15 is $10,851,172.8 (increased revenue from the past quarter) + $4,725,081.60 (cost of cars for q414) = $15,576,254.4
* By not accounting for the missing revenue points for boats in the two week span of Feburary, we get the total estimated profits for 1q15 to be **$1,675,448.40:**

![image-20210701125043456](C:\Users\ferdi\AppData\Roaming\Typora\typora-user-images\image-20210701125043456.png)

---

### Questions

1. What is your undergraduate GPA, both overall and for your major?

   **Undergraduate GPA: **3.55; **Economics GPA: **3.78; **Data Science GPA**: 3.36

2. What are the scores for your undergraduate standardized tests (eg. SAT) and graduate standardized tests (eg. GRE)?

   **SAT Scores:**  <u>Math</u>: 750, <u>Reading</u>: 640, <u>Writing</u>: 630

3. What are you looking for in your next role? (Please keep responses to 50 words or less)

   **To build foundational skills and sharpen my own skills related with data in the tech and finance world; and specifically, to understand more about how investors think about companies and necessary questions to make stock portfolio decisions (so I grow my business acumen in investing).**

4. What job do you see yourself having in 10 years? (Please keep responses to 50 words or less)

   **Transitioning into a Data Scientist role that will produce insights and holistic understanding of the consumers and their needs and find opportunities to improve and innovate on our product and features (in a tech-related or digital media sector).** 