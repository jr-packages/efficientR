# Efficient R Programming Tutorial
[![Build Status](https://travis-ci.org/jr-packages/efficientTutorial.svg?branch=master)](https://travis-ci.org/jr-packages/efficientTutorial)

This repository contains the slides and associated questions
for the [useR!2017](https://www.user2017.brussels/uploads/gillespie_efficient_R_tutorial_170112_152605_1.html) 
tutorial. All material is contained within an R package (very efficient).

The material in this tutorial is based on the [Efficient R Programming](http://shop.oreilly.com/product/0636920047995.do) book
and the [Jumping Rivers](https://www.jumpingrivers.com) one day course.

## Package Installation

The package lives in a `drat` on GitHub. Installation is straightforward

```
install.packages("drat")
drat::addRepo("jr-packages")
install.packages("efficientTutorial")
```

## Accessing Course Material

The slides and questions are package vignettes. These can be viewed in the usual way
```
browseVignettes(package = "efficientTutorial")
```
or
```
vignette("slides_welcome", package = "efficientTutorial")
```

![](vignettes/graphics/rule1.jpg )

