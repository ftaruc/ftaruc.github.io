---
layout: post
title:  "Relearning R"
date:   2021-02-12 15:10:56 +0900
categories: notes
---

A hodgepodge of notes for learning R for my reference, segmented so it is easy to read.

<!-- more -->

--

**Visualisations**

```
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

  ```
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

   - one example: `nycflights13::flights` to access df

9. To print and save assignments, wrap in parantheses:

   - example: `(dec25 <- filter(flights, month == 12, day == 25))`

10. When using `==` to check for boolean conditions, use `near` instead:

    ```
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

**Data Transformation**

* `tibbles` are dataframes but tweaked to work under `tidyverse`

* `&` = "and", `|` = "or", `!` =  "not"

* the following abbreviations for types of variables:

  - `int`: integer, `dbl`: doubles/real numbers
  - `chr`: character vectors, or strings
  - `dttm`: date-times (date+time)
  - `lgl`: logical (booleans), vectors with only `TRUE` or `FALSE`
  - `fctr`: factors (used to represent categorical variables with fixed possible values)

* the basics of `dplyr`, in which the first argument is a `df`: 

  - Pick observations by their values (`filter()`).

    - example: 

      ```R
      filter(flights, !(arr_delay > 120 | dep_delay > 120))
      filter(flights, arr_delay <= 120, dep_delay <= 120)
      
      #Demorgans law: !(x & y) is the same as !x | !y, 
      #and !(x | y) is the same as !x & !y
      ```

  - Reorder the rows (`arrange()`).

  - Pick variables by their names (`select()`).

  - Create new variables with functions of existing variables (`mutate()`).

  - Collapse many values down to a single summary (`summarise()`).

  - And then can operate by groups, using `group_by()`

--

For more resources:

1. Notes taken from an online book [here](https://r4ds.had.co.nz/index.html)

   
