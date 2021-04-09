---
layout: post
title:  "Grailed: Scraping Automation & Streamlit"
date:   2021-04-8 15:10:56 +0900
categories: projects
---

<center><img src="https://ferdie.org/images/grailed_banner.png" alt="title" style="zoom: 50%;" /></center>

Recently, I have been selling a large portion of my closet to this community marketplace for men's clothing centered on streetwear & designer clothes, Grailed.



<center><img src="https://ferdie.org/images/grailed1.jpg" alt="ex1" style="zoom: 50%;" /></center>

As an avid user, the platform makes it hard to compare prices easily of current listings and listings that sold for certain items, as you would have to scan through each listing and attempt to capture trends over time. Unfortunately, Grailed does not have a public API, so I though this would be a perfect opportunity to attempt to scrape this data and create relevant features from each listing to visualize these trends through data. 

<!-- more -->

<u>***Disclaimer:***</u> The acceptable use policy for `grailed.com` [does not officially allow for web scrapers or automated processes to gather their data](https://www.grailed.com/acceptable). This project is purely for educational purposes to learn about underlying trends surrounding clothes.

#### **Selenium & BeautifulSoup:**

There are many python packages suitable for web scraping: 

* `BeautifulSoup` (will be referred as bs4 for now on )
* `Scrapy` 
* `Requests` or `LXML`
* `Selenium` and a wrapper that makes it easier, [Helium](https://github.com/mherrmann/selenium-python-helium).

As a static scraper, Python often requires no more than the use of the Beautiful Soup by traversing the `DOM `(document object model) to reach its goal. However, static scraping ignores JavaScript and does not really capture other dynamic elements. Thus, automation through Selenium allows these dynamic elements to be clicked on, updating the static page so new information can be scraped.

There are many [resources](https://www.selenium.dev/) to get started with Selenium and bs4, but I will omit the majority of the set-up and include what was implemented in my code in my GitHub `readme`. However, I would like to detail some things before getting started:

* **Chrome webdriver was used**: different OS can be used with different browsers for automation through Selenium
* **The first run creates cookies to ignore log-in element:** we use pickle to dump and get previous cookies so Selenium remembers our log-in information for future sessions. Each session on grailed will start at this create account screen that will prevent us from filtering listings.

<center><img src="https://ferdie.org/images/grailed_login.jpg" alt="login" style="zoom: 50%;" /></center>

```python
def first_run():
    ##Initialize Selenium
    options = Options()
    options.add_argument("user-data-dir=selenium")
    url = "https://www.grailed.com/users/sign_up"
    driver = webdriver.Chrome(WEBDRIVER_PATH, options=options)
    driver.get(url)
    time.sleep(2)

    #Login to account
    email = "PUT GRAILED EMAIL HERE"
    pw = "PUT GRAILED PWORD HERE"

    og_logxpath = "/html/body/div[3]/div[7]/div/div/div[2]/div/div/p[2]/a"
    login_xpath = "/html/body/div[3]/div[7]/div/div/div[2]/div/div/button[4]"
    driver.find_element_by_xpath(og_logxpath).click()
    time.sleep(1) #adds delay
    driver.find_element_by_xpath(login_xpath).click()
    time.sleep(1)

    email_xpath = "/html/body/div[3]/div[7]/div/div/div[2]/div/div/form/div[1]/input"
    pw_xpath = "/html/body/div[3]/div[7]/div/div/div[2]/div/div/form/div[2]/input"
    driver.find_element_by_xpath(email_xpath).send_keys(email)
    driver.find_element_by_xpath(pw_xpath).send_keys(pw)
    final_login_xpath = "/html/body/div[3]/div[7]/div/div/div[2]/div/div/form/button"
    driver.find_element_by_xpath(final_login_xpath).click()

    #uses pickle to save cookies
    #time.sleep(5)
    pickle.dump(driver.get_cookies() , open(COOKIES_PATH,"wb"))
```

* **Uses package `fake_useragent`:** sometimes, cloud security services like CloudFlare prevents web-scraping due to bot-like behavior. To prevent this, we need to use this package to not look like a bot when using Selenium.

```python
   from fake_useragent import UserAgent
       ua = UserAgent()
    userAgent = ua.random
    #print(str(userAgent)) to see which agent is used
    options.add_argument(f'user-agent={userAgent}')

    url = "https://www.grailed.com/"
    driver = webdriver.Chrome(WEBDRIVER_PATH, options=options)
    driver.get(url)
```

#### **Data Collection Steps:**

The procedure imputes missing data through an iterative series of predictive models. The model in practice is through `regression`.

<u>Step 1:</u> A simple imputation, such as imputing the mean, is performed for every missing value in the dataset. These mean imputations can be thought of as `place-holders`.

<u>Step 2:</u> The `place-holder` mean imputations for one variable `var` are set back to missing.

<u>Step 3:</u> The observed values from the variable `var` in Step 2 are regressed on the other variables in the imputation model, which may or may not consist of all of the variables in the dataset. In other words, `var` is the dependent variable in a regression model and all the other variables are independent variables in the regression model. These regression models operate under the same assumptions that one would make when performing linear, logistic, or Poison regression models outside of the context of imputing missing data.

<u>Step 4:</u> The missing values for `var` are then replaced with predictions (imputations) from the regression model. When `var` is subsequently used as an independent variable in the regression models for other variables, both the observed and these imputed values will be used.

<u>Step 5:</u> Steps 2–4 are then repeated for each variable that has missing data. The cycling through each of the variables constitutes one iteration or `cycle`. At the end of one cycle all of the missing values have been replaced with predictions from regressions that reflect the relationships observed in the data.

<u>Step 6:</u> Steps 2–4 are repeated for a number of cycles, with the imputations being updated at each cycle.

-

One way to evaluate different techniques is to use a known column that has no missing values. Then, you are able to drop certain observations from this column, creating "*fake* missing values" that will be imputed by these techniques. Then, compare the distortion, precision, and errors of these known values to test accuracy.

Although some models do not handle these types of imputation well -- such as when working with timeseries which can create large assumptions that will affect the accuracy of the model. However, when working with quick predictive models like OLS, sometimes imputation with the mean might do the trick. 

Having a holistic understanding on why we impute can help you decide whether to choose a complex method or not to handle missing values.



####  **Future Applications:**

Using different models for more accurate imputation, you can use the following: 

* Use listing descriptions to capture sentiment for further analysis, can also apply `NLP` to create the 'perfect description' for that item
* Create a `binary classifier` to figure out which features are the best to predict which listings will sell for a certain item (we have both sold and unsold listings for each item, can find an item with a lot of listings)
* `Regression model` on price, predict which price is optimal to sell given the features of the item. 

--

For more resources, I suggest looking through these two articles:

1. [Wikipedia (missing data)](https://en.wikipedia.org/wiki/Missing_data)
2. [Wikipedia (imputation in statistics)](https://en.wikipedia.org/wiki/Imputation_%28statistics%29)