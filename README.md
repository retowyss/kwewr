kwewr - Keywords Everywhere API R client
========================================

<!-- badges: start -->
<!-- badges: end -->

kwewr makes it easy to request keyword data from the Keywords Everywhere
API.

Installation
------------

    remotes::install_github("retowyss/kwewr")
    # or
    # devtools::install_github("retowyss/kwewr")

You need to have your own API key. By default, kwewr will look for your
key in `config.yml` realtive to your working directory.

    default:
      key: "< API KEY >"

Example
-------

In this example I request data for the five keywords: cat, dog, Amazon,
Google, and Youtube.

    library(kwewr)
    kws <- get_keyword_data(c(
      "Cat", 
      "Dog",
      "Amazon",
      "Google",
      "Youtube"
    ))
    str(kws, max.level = 2)

    ## List of 4
    ##  $ data      :'data.frame':  5 obs. of  5 variables:
    ##   ..$ vol        : int [1:5] 7480000 6120000 414000000 618000000 1380000000
    ##   ..$ cpc        :'data.frame':  5 obs. of  2 variables:
    ##   ..$ keyword    : chr [1:5] "cat" "dog" "amazon" "google" ...
    ##   ..$ competition: num [1:5] 0.13 0.14 0.13 0.01 0.01
    ##   ..$ trend      :List of 5
    ##  $ credits   : int 87749
    ##  $ time      : num 0.02
    ##  $ time_stamp: POSIXct[1:1], format: "2020-10-11 06:49:25"

    tibble::as_tibble(kws$data)

    ## # A tibble: 5 x 5
    ##          vol cpc$currency $value keyword competition trend            
    ##        <int> <chr>        <chr>  <chr>         <dbl> <list>           
    ## 1    7480000 $            0.18   cat            0.13 <df[,3] [12 x 3]>
    ## 2    6120000 $            0.84   dog            0.14 <df[,3] [12 x 3]>
    ## 3  414000000 $            0.02   amazon         0.13 <df[,3] [12 x 3]>
    ## 4  618000000 $            0.31   google         0.01 <df[,3] [12 x 3]>
    ## 5 1380000000 $            0.06   youtube        0.01 <df[,3] [12 x 3]>
