
# kwewr - Keywords Everywhere API R client  

<!-- badges: start -->
<!-- badges: end -->

kwewr makes it easy to request keyword data from the Keywords Everywhere API. 

## Installation

``` r
remotes::install_github("retowyss/kwewr")
# or
# devtools::install_github("retowyss/kwewr")
```

You need to have your own API key. By default, kwewr will look for your key in
`config.yml` realtive to your working directory.

```
default:
  key: "< API KEY >"
```

## Example

``` r
get_keyword_data(c("best pen for cooking", "best oven for hamsters"))
```



