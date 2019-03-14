warmup01-Sylvia-Li.Rmd
================
Sylvia
2/2/2019

R Markdown
----------

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

``` r
summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

Including Plots
---------------

You can also embed plots, for example:

![](warmup01-Sylvia-Li_files/figure-markdown_github/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

Star Wars
---------

> A famous quote: "I am a Jedi, like my father before me."

![](https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg/revision/latest?cb=20170927034529)

| Description | Value |
|-------------|-------|
| Species     | Human |
| Gender      | Male  |
| Eye Color   | Blue  |
| Skin Color  | Light |

Cooking Recipe for plush coconut cake
-------------------------------------

### Ingredients

-   2 cups plus 3 tablespoons (285 grams) all-purpose flour
-   1 1/2 teaspoons baking soda
-   1/2 teaspoon fine sea salt
-   1 cup (200 grams) granulated sugar
-   1/2 cup (110 grams) coconut oil, warmed just enough to liquefy
-   1 1/2 cups full- or low-fat coconut milk (see Note)
-   1 tablespoon (15 ml) plain vinegar

### Special Kitchen Tools

-   parchment paper
-   cake pan
-   wire rack

### Steps

1.  Heat oven to 350 degrees F. Line the bottom of 9-inch round cake pan with a fitted round of parchment paper and coat the bottoms and sides with nonstick cooking spray.

2.  Whisk together flour, baking soda, salt and granulated sugar in the bottom of a large mixing bowl. Add coconut oil, coconut milk, and vinegar and whisk until batter is smooth.

3.  Pour into prepared pan. Bake for 25 to 30 minutes \[updated to note: it’s sounding in the comments like it’s taking some people a bit longer — it’s not done until the center is set, even if it’s longer than it took me\], or until the top is springy and a tester inserted in the center comes out batter-free. Cool the cake in the pan on a wire rack for 10 minutes, then cut around it with a knife to ensure it is loosened and flip it out onto a cooling rack to cool the rest of the way.

![](https://smittenkitchendotcom.files.wordpress.com/2019/01/plush-coconut-cake-vegan.jpg?w=1500)

### Variations

*If you wish to make a glaze*: Whisk together 3/4 cup powdered sugar with 1 to 2 tablespoons of the leftover coconut milk, adding a little at a time, until it is smooth but not too runny. Add a pinch of salt, if you wish. Once cake is fully cool, spread over the top of the cake and smooth to the edges with a knife or small offset spatula, where it will find its way down the sides decoratively on its own. I added some white confetti sprinkles, but toasted coconut chips would be nice here too.

**Note: there is no special season of the year for it!**

### More Cakes

[chocolate olive oil cake + more book tour!](https://smittenkitchen.com/2017/10/chocolate-olive-oil-cake-more-book-tour/)

[bakery-style butter cookies + the new book is here!](https://smittenkitchen.com/2017/10/bakery-style-butter-cookies-the-new-book-is-here/)

Euclidean Distance
------------------

### Definition

------------------------------------------------------------------------

The **Euclidean distance** between points **p** and **q** is the length of the line segment connecting them ($\\overline {\\mathbf {pq}}$).

<br/>In Cartesian coordinates, if **p** = (*p*<sub>1</sub>,*p*<sub>2</sub>,..., *p*<sub>*n*</sub>) and **q** = (*q*<sub>1</sub>, *q*<sub>2</sub>,..., *q*<sub>*n*</sub>) are two points in Euclidean *n*-space, then the distance (d) from **p** to **q**, or from **q** to **p** is given by the Pythagorean formula:

$$\\textit{d}(\\textbf{p},\\textbf{q}) = \\textit{d}(\\textbf{q},\\textbf{p}) = \\sqrt{(q\_1 - p\_1)^2 + (q\_2 - p\_2)^2 + \\dots + (q\_n - p\_n)^2}$$

$$= \\sqrt{\\sum\_{i=1}^{n}(q\_i - p\_i)^2}. $$

The position of a point in a Euclidean *n*-space is a Euclidean vector. So, **p** and **q** may be represented as Euclidean vectors, starting from the origin of the space (initial point) with their tips (terminal points) ending at the two points. The **Euclidean norm**, or **Euclidean length**, or **magnitude** of a vector measures the length of the vector:
$$\\| \\textbf{p} \\| = \\sqrt{p\_1^2 + p\_2^2 + \\dots + p\_n^2} = \\sqrt{\\textbf{p·p}},$$
 where the last expression involves the dot product.
