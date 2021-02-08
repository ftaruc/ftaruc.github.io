---
layout: post
title:  "Understanding the Stock Market"
date:   2021-02-31 15:10:56 +0900
categories: notes

---



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

For more resources:

1. [Taken from online book:](https://r4ds.had.co.nz/index.html)	

2. 

   