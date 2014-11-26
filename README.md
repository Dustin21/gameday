# Overview of Gameday
Dustin Johnson  
`r Sys.Date()`  

## Introduction to gameday

The gameday package enables you to stay up-to-date with your NHL needs without diverting your eyes from an R coding project. Check if your favourite NHL team is playing, or glance at the scores of the day to monitor your pool!

## Installation

You can install the `gameday` package simply as follows:


```r
library(devtools)
install_github("Dustin21/gameday")
```

Then load it from your library.


```r
library(gameday)
```

```
## Loading required package: RCurl
## Loading required package: bitops
## Loading required package: assertthat
```


## Using gameday

#### gday()
Use the function `gday()` to find the times that your favourite hockey team is playing. For instance, I would like to know if the Vancouver Canucks are playing today:


```r
# Check if Canucks are playing today
gday() # default is set to today's date and 'Canucks'.
```

```
## [1] TRUE
```

Perhaps I would like to know if the Nashville Predators played on November 22, 2014. This can easily be done by setting the team and date:


```r
# Did the Predators play on November 22, 2014
gday(team = "predators", date = "2014-11-22")
```

```
## [1] TRUE
```

How easy!

#### score()
The `score()` function is self-explanatory, as the only input is `date`. It simply provides the scores of all teams that played (or are playing) on a given date. This means, your scores can be update in real time! Let's say I wanted to know the scores of all games played today:


```r
score()
```

```
##                    home               away home_score away_score
## 1 COLUMBUS BLUE JACKETS      WINNIPEG JETS          2          4
## 2        ST LOUIS BLUES    OTTAWA SENATORS          2          3
## 3   NASHVILLE PREDATORS  LOS ANGELES KINGS          4          3
## 4          DALLAS STARS    EDMONTON OILERS          3          2
## 5       ARIZONA COYOTES COLORADO AVALANCHE          3          4
## 6     VANCOUVER CANUCKS  NEW JERSEY DEVILS          2          0
## 7         ANAHEIM DUCKS     CALGARY FLAMES          3          2
```

Or perhaps, I would like to know the scores of all teams that played on November 22, 2014.


```r
score(date = "2014-11-22")
```

```
##                      home                  away home_score away_score
## 1         OTTAWA SENATORS        ST LOUIS BLUES          2          3
## 2           BOSTON BRUINS    MONTREAL CANADIENS          0          2
## 3     TORONTO MAPLE LEAFS     DETROIT RED WINGS          4          1
## 4     TAMPA BAY LIGHTNING        MINNESOTA WILD          2          1
## 5  NY ISLANDERS ISLANDERS   PITTSBURGH PENGUINS          4          1
## 6     PHILADELPHIA FLYERS COLUMBUS BLUE JACKETS          4          2
## 7     WASHINGTON CAPITALS        BUFFALO SABRES          1          2
## 8     NASHVILLE PREDATORS      FLORIDA PANTHERS          3          2
## 9            DALLAS STARS     LOS ANGELES KINGS          5          4
## 10     COLORADO AVALANCHE   CAROLINA HURRICANES          4          3
## 11         CALGARY FLAMES     NEW JERSEY DEVILS          5          4
## 12        EDMONTON OILERS    CHICAGO BLACKHAWKS          1          7
## 13        SAN JOSE SHARKS       ARIZONA COYOTES          3          4
```

If the entries are black, either no games have been played or you are attempting to predict the future.

#### Winners of the Day

We can also determine the winners of the day with the help of the `dplyr` package and make a nice plot of the points gap with `ggplot2` to judge the magnitude of the win. 


```r
suppressPackageStartupMessages(library(dplyr))
library(ggplot2)

win.dat <- score("2014-11-22") %>%
	mutate(winner = ifelse(home_score > away_score, as.character(home), as.character(away))) %>%
	mutate(diff = ifelse(home_score > away_score, home_score-away_score, away_score-home_score)) %>%
	mutate(winner = reorder(winner, diff)) %>%
	select(winner, diff) %>%
	ggplot(aes(diff, winner)) + geom_point(aes(colour = winner), size = 3) + 
	theme(legend.position="none")
win.dat
```

![](./overview_files/figure-html/unnamed-chunk-7-1.png) 
	
Use the `gameday` package and stay up to date with your game-to-game needs.

## Reflections

Reworking this Gameday package really helped me understand the details of building a package, which inspired me to build my own. Incorporating and running the tests were my biggest source of confusion, but after some trial and error, I feel I got the hang of it. I am still wondering about more sophisticated functions. For instance, our gameday package required us to simply enter a country, but what if our function was more complex and required functions that depended on other data sets and functions, etc. Perhaps someone can give me some insight into how this would work?

Follow this link for the second part of this homework - I will attempt to build my own package.
