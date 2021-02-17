---
layout: post
title:  "Relearning R"
date:   2021-02-12 15:10:56 +0900
categories: notes
---



<center><img src="https://lh3.googleusercontent.com/proxy/mETb1voiHloWE32YW8taweu7EK3Gsw9NeCn1twET9X0R40lGfqstF6UC_ppqrbUHN7ItYOexqryR_1ZW55wCKMzVjIO8tJJaJ67hHjEjvH7bqcB2Hi0PZALn3vSCT6AetSRsjGa_b-FggSLCPHw" alt="title" style="zoom: 50%;" /></center>

A hodgepodge of notes for learning R for my reference, segmented so it is easy to read.

<!-- more -->

--

**Visualisations**

```R
ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(
     mapping = aes(<MAPPINGS>),
     stat = <STAT>, 
     position = <POSITION>
  ) +
  <COORDINATE_FUNCTION> +
  <FACET_FUNCTION>
```

- use `facets`: subplots that display subsets of data (categorical variables)

```R
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
```

- also can use `facet_grid()` to plot combination of two variables:

  ```R
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) + 
    facet_grid(drv ~ cyl)
  ```

- `geom_point` vs `geom_smooth`; which object to map plots; every geom function takes `mapping` as an argument; instead of `linetype` below, can also use `group` to show different types of categories with same linetype

  ```R
  ggplot(data = mpg) + 
    geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
  ```

![img](https://d33wubrfki0l68.cloudfront.net/f6d3025401c2bf94d85e1871ea67cddf48b52504/31750/visualize_files/figure-html/unnamed-chunk-19-1.png)

- repetition isn't necessary:

  ```
  ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_point(mapping = aes(color = class)) + 
    geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
  ```

- changing order of bar chart for categorical mappings (so doesn't order based on increasing frequency):

  ```R
  demo <- tribble(
    ~cut,         ~freq,
    "Fair",       1610,
    "Good",       4906,
    "Very Good",  12082,
    "Premium",    13791,
    "Ideal",      21551
  )
  
  ggplot(data = demo) +
    geom_bar(mapping = aes(x = cut, y = freq), stat = "identity"
    #use  y = stat(prop) for proportion
  ```

![img](https://d33wubrfki0l68.cloudfront.net/81c814ab218bb1c7755393ff5800dc4331fdcf95/99bbd/visualize_files/figure-html/unnamed-chunk-32-1.png)

- lineplots (w stats)/ boxplots:

  ```R
  ggplot(data = diamonds) + 
    stat_summary(
      mapping = aes(x = cut, y = depth),
      fun.min = min,
      fun.max = max,
      fun = median
    )
  
    ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
    geom_boxplot() 
    #add + coord_flip() to make it horizontal
  ```

  ![img](https://d33wubrfki0l68.cloudfront.net/4f7c8830283cb7009346ed85a8196b06959f5abd/78175/visualize_files/figure-html/unnamed-chunk-34-1.png)

- can use `fill` (also for categorical) to fill whole bars, or normal `color` for outlines

- `position = "identity"` will place each object exactly where it falls in the context of the graph. This is not very useful for bars, because it overlaps them. To see that overlapping we either need to make the bars slightly transparent by setting `alpha` to a small value, or completely transparent by setting `fill = NA`; basically doesn't stack like fill, but overlaps on top of each other to see original value compared to y

- `position = "fill"` works like stacking, but makes each set of stacked bars the same height. This makes it easier to compare proportions across groups

  ![img](https://d33wubrfki0l68.cloudfront.net/b714164c434b166e783ee626f26a0272e21d77c3/b0cb0/visualize_files/figure-html/unnamed-chunk-39-1.png)

- `position = "dodge"` places overlapping objects directly *beside* one another. This makes it easier to compare individual values; below image shows this

  ![img](https://d33wubrfki0l68.cloudfront.net/df1b0254da67bacb41a51381d310864d3a5a7dc7/10834/visualize_files/figure-html/unnamed-chunk-40-1.png)

- use position = `jitter` for scatterplot when points over plot with each other; + geom_jitter()

- can use `bar + coord_polar()` to make bar charts into pie charts

- explore labs for tags/titles/etc

--

**The Basics**

1. Do not use `=`, instead do `ALT` + `-` to create `<-` to assign variables

2. Use snake case for styling convention (underscore to separate lowercase):

   example: `i_use_snake_case`

3. Use `CTRL` + `UP_ARROW` to look at all commands executed in terminal (fast-ease to re-do past commands)

4. Variables are case-sensitive -- typos will happen

5. When shifting through different functions using `TAB` autofill,  press `F1` to get more detailed documentation

6. `ALT` + `SHIFT` + `K` to access all keyboard shortcuts

7. `dplyr ` overwrites base functions of R -- to access original, use: `stats::function`

8. Easy access of functions / objects using `::`

   - one example: `nycflights13::flights` to access dataframe

9. To print and save assignments, wrap in parentheses:

   - example: `(dec25 <- filter(flights, month == 12, day == 25))`

10. When using `==` to check for boolean conditions, use `near` instead:

    ```react
    sqrt(2) ^ 2 == 2
    #> [1] FALSE
    1 / 49 * 49 == 1
    #> [1] FALSE
    --
    near(sqrt(2) ^ 2,  2)
    #> [1] TRUE
    near(1 / 49 * 49, 1)
    #> [1] TRUE
    ```

11. Ctrl + Shift + P to resend the complete block that was recently used in console-- useful when editing a block constantly.

**Data Transformation**

* `tibbles` are dataframes but tweaked to work under `tidyverse`

* `&` = "and", `|` = "or", `!` =  "not"

  * Boolean operations in picture:

    ![img](https://d33wubrfki0l68.cloudfront.net/01f4b6d39d2be8269740a3ad7946faa79f7243cf/8369a/diagrams/transform-logical.png)

* the following abbreviations for types of variables:

  - `int`: integer, `dbl`: doubles/real numbers
  - `chr`: character vectors, or strings
  - `dttm`: date-times (date+time)
  - `lgl`: logical (booleans), vectors with only `TRUE` or `FALSE`
  - `fctr`: factors (used to represent categorical variables with fixed possible values)

--

* the basics of `dplyr`, in which the first argument is a `df`: 

  - Pick observations by their values **<u>filter()</u>**.

    - example: 

      ```R
      filter(flights, !(arr_delay > 120 | dep_delay > 120))
      filter(flights, arr_delay <= 120, dep_delay <= 120)
      
      #Demorgans law: !(x & y) is the same as !x | !y, 
      #and !(x | y) is the same as !x & !y
      ```
      
    - can use `between(x, left, right)`instead of boolean condition statements: ` x >= left & x <= right`

  - Reorder the rows: <u>**arrange()**</u>

    - selects rows in ascending order, can use `desc()` to re-order in descending order:  `arrange(flights, desc(dep_delay))`

  - Pick variables by their names: `select()`.

    - Can select columns between two variables: `select(flights, year:day)`
    - Can select columns not between two variables (inclusive): `select(flights, -(year:day))`
    - Some helper functions, see `?select` for more:
      - `starts_with("abc")`
      - `ends_with("xyz")`
      - `contains("ijk")`
      - `everything()` pulls all the other variables to re-order
        - `num_range("x", 1:3)` matches variables `x1` to `x3`
    - Use `rename` to keep all variables not mentioned (as select drops it)
      - `rename(flights, tail_num = tailnum)`

  - Create new variables with functions of existing variables: **<u>mutate()</u>**.

    - similar to `apply()` from python; can also refer to columns that you've created in the same line; <u>ONLY TEMPORARY unless stored</u>

    - function <u>must be vectorized:</u> it must take a vector of values as input, return a vector with the same number of values as output.

    - adds new variable to end of dataset; use `View(df)` to see all columns

    - Example:

      ```R
      flights_sml <- select(flights, 
        year:day, 
        ends_with("delay"), 
        distance, 
        air_time
      )
      mutate(flights_sml,
        gain = dep_delay - arr_delay,
        speed = distance / air_time * 60
      )
      #> # A tibble: 336,776 x 9
      #>    year month   day dep_delay arr_delay distance air_time  gain speed
      #>   <int> <int> <int>     <dbl>     <dbl>    <dbl>    <dbl> <dbl> <dbl>
      #> 1  2013     1     1         2        11     1400      227    -9  370.
      ```

    - if you only want to keep the new variables, use `transmute()`

    - `%/%` = integer division, dividing and then rounding down to nearest integer

    - `%%` = mod, or just remainder

    - Other functions: `lead()`, `lag()` (refers to the number that leads them or is behind them), `cumsum()`, `cumprod()`, `cummin()`, `cummax()`, `cummean()`

    - Also ranking functions: `min_rank()`, `row_number()`, `dense_rank()`, `percent_rank()`, `cume_dist()`, `ntile()`

      ```R
      transmute(flights,
        dep_time,
        hour = dep_time %/% 100,
        minute = dep_time %% 100
      )
      #> # A tibble: 336,776 x 3
      #>   dep_time  hour minute
      #>      <int> <dbl>  <dbl>
      #> 1      517     5     17
      #> 2      533     5     33
      #> 3      542     5     42
      #> 4      544     5     44
      #> 5      554     5     54
      #> 6      554     5     54
      #> # … with 336,770 more rows
      ```

  - Collapse many values down to a single summary: **<u>summarise()</u>**.

    - use in tandem with `group_by` to compute unit of analysis from complete dataset to individual groups.
    - `count  = n()` as a sub function to calculate # of data points
      - `sum(!is.na(x))` as a sub function to calculate # of missing values
      - `n_distinct(x)` for distinct values
    - or can calculate statistics of overall data-frame like mean: `summarise(flights, delay = mean(dep_delay, na.rm = TRUE))`
  
  - And then can operate by groups: **<u>group_by()</u>**.
  
    - use `ungroup()` to ungroup back to one layer
    - also use filters and mutations on groups
  
  - **Piping: ** `%>%` or read as "then," which combines all transformations into one code block and it's easier to read:
  
    - sequential:  `x %>% f(y)` turns into `f(x, y)`, and `x %>% f(y) %>% g(z)` turns into `g(f(x, y), z)` and so on
  
    ```R
    by_dest <- group_by(flights, dest)
    delay <- summarise(by_dest,
      count = n(),
      dist = mean(distance, na.rm = TRUE),
      delay = mean(arr_delay, na.rm = TRUE)
    )
    #> `summarise()` ungrouping output (override with `.groups` argument)
    delay <- filter(delay, count > 20, dest != "HNL")
    
    ## VS. Piping way
    
    delays <- flights %>% 
      group_by(dest) %>% 
      summarise(
        count = n(),
        dist = mean(distance, na.rm = TRUE),
        delay = mean(arr_delay, na.rm = TRUE)
      ) %>% 
      filter(count > 20, dest != "HNL")
    ```
  
  - sum of one variable (total # of miles a certain plane flew)                                           :
  
    ```R
    not_cancelled %>% 
      count(tailnum, wt = distance)
    #> # A tibble: 4,037 x 2
    #>   tailnum      n
    #>   <chr>    <dbl>
    #> 1 D942DN    3418
    #> 2 N0EGMQ  239143
    #> 3 N10156  109664
    #> 4 N102UW   25722
    #> 5 N103US   24619
    #> 6 N104UW   24616
    #> # … with 4,031 more rows
    ```

**Handling Missing Values**

- `NA` represents unknown values, and any operations involving will also be unknown

  - `NA == NA` will result in `NA` given this same premise

  - use `is.na(x)` to determine if value is missing

  - can be persevered when filtering: 

    ```R
    filter(df, is.na(x) | x > 1)
    ```

  - When working with `arrange()`, missing values will always be <u>sorted at the end</u>, use indicators to have them at the beginning: `arrange(flights, desc(is.na(dep_time)), dep_time)`

--

For more resources:

1. Notes taken from an online book [here](https://r4ds.had.co.nz/index.html)

   
