# Curriculum

## Introduction

This tutorial shows you how to use `bookdown` to quickly create interactive data documentation for large datasets with many components and filetypes. Parts of this tutorial are adapted from the bookdown GitHub repository.

Questions for live interaction are included as callouts.

## Prerequisites

### Software

* [R](https://cran.rstudio.com/) (3.3.0+)
* [RStudio IDE](https://posit.co/download/rstudio-desktop/) 9
* TeX installed in RStudio

### Knowledge and experience

We assume no experience with YAML or LaTeX. Experience with GitHub, R, and R Markdown are helpful, but not necessary.

## Motivation

bookdown is an extension of the R Markdown format, which is itself an extension of the Markdown language. 

Why is it useful for us as data scientists and data-adjacent practitioners? Because we can self-publish professional-looking materials that help us to organize things like this:

[image of process data project prior to new documentation]

Into this:

[image of new bookdown, GIF for emphasis on interactivity]

## Getting started

Open RStudio Desktop.

Go to *File > New Project > New Directory > Book project using bookdown*.

![File menu in RStudio to create a new project](C:\Users\kyi\OneDrive - American Institutes for Research in the Behavioral Sciences\Documents\GitHub\dsaa-ncme-2024\resources\file-new-project)

We see that we've been given an example book with all the requisite files. If you want you can edit the `.Rmd` files directly and have a functioning book ready to go, but for data documentation purposes, we will dive a little deeper.

## Navigating bookdown

Here we take an overview of the main filetypes involved in bookdown and what they are used for.

> Who has worked with `.Rmd`, `.yml`, or `.css` before? What are these filetypes used for?

### `.Rmd`

 book content

### `.yml`

Controls meta-structure for the gitbook, as well as PDF appearances, via Pandoc and YAML. (If you have a background in web design, think of YAML like CSS for LaTeX, and of LaTeX as HTML for PDFs.)

`_output.yml` is sourced as an `output:` YAML tag

1. has all options for the book structure, including download formats, sharing buttons, splitting pages by section, where output is located, and [appearance](https://bookdown.org/yihui/rmarkdown/html-document.html#appearance-and-style)

### `.css`

controls appearance in the gitbook (HTML/online book).

This piece is optional, especially for branded materials that may need to align with. I also needed this file format to handle wide tables. Let's see an example

```css
```



## Output formats

bookdown can publish to PDF and EPUB (e-book, such as Kindle), but we are going to focus on.

### Publishing to the web

### Hosting on GitHub



## Interactivity

## Crowd-sourced edits

 ## Appearance



## Appendix

* [Bookdown gallery](https://bookdown.org/home/archive/)
  * I like browsing others' books for features I like and then 
* [Bookdown reference](https://bookdown.org/yihui/bookdown/)

## Troubleshooting

### Operating system differences

iOS, Windows, Linux



. 

This will create a new directory with an example book as template. You can build the HTML version of this example book without doing any modification:

- Go into the Build Pane in the RStudio IDE
- Click on *Build Book > bookdown::gitbook*

You can also run `bookdown::render_book()` in the R console.

Learn more about using bookdown in the [Getting started section](https://pkgs.rstudio.com/bookdown/articles/bookdown.html).