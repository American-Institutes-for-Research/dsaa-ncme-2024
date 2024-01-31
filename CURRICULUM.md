# Curriculum

## Introduction

This tutorial demonstrates how to use `bookdown`, an extension of R Markdown, to quickly create interactive data documentation for large datasets with many components and filetypes. Parts of this tutorial are adapted from the bookdown GitHub repository.

Questions for live interaction are included as callouts.

## Prerequisites

All software used in this tutorial is available for free.

### Software

* [R](https://cran.rstudio.com/) (3.3.0+)
* [RStudio IDE](https://posit.co/download/rstudio-desktop/) 9
* [TeX installed in RStudio](https://bookdown.org/yihui/rmarkdown-cookbook/install-latex.html)

To publish online:

* GitHub
  * [GitHub Desktop](https://docs.github.com/en/desktop/installing-and-configuring-github-desktop/overview/getting-started-with-github-desktop) is an easy introduction to git without requiring command line

### Knowledge and experience

We assume no experience with YAML or LaTeX. Experience with GitHub, R, and R Markdown are helpful, but not necessary.

## Motivation

Why is `bookdown` useful for us as data scientists and data-adjacent practitioners? Because we can self-publish professional-looking materials that help us to organize things like this:

[image of process data project prior to new documentation]

Into this:

[image of new bookdown, GIF for emphasis on interactivity]

You can imagine `bookdown` as a format designed to combine the features of data tables, textual explanations, and code.

The following table summarizes some features of R Markdown and `bookdown` as compared to familiar alternatives.

| Features                             | Microsoft Word/Google Docs                                   | R Markdown                 | bookdown                   |
| ------------------------------------ | ------------------------------------------------------------ | -------------------------- | -------------------------- |
| Multiple editors                     | Yes                                                          | Yes, via GitHub            | Yes, via GitHub            |
| Formats and runs code snippets       | No                                                           | Yes, R code                | Yes, R code                |
| Formats math                         | Yes                                                          | Yes, with LaTeX            | Yes, with LaTeX            |
| Consistent appearance and formatting | Haha                                                         | Yes                        | Yes                        |
| PDF accessibility                    | Yes, via tagged PDF export                                   | No, requires customization | No, requires customization |
| Web accessibility                    | Yes, [with some exceptions](https://www.colorado.edu/digital-accessibility/google-docs-and-accessibility) | Yes, via HTML output       | Yes, via HTML output       |

As stated in the table, I would like to make a note about accessibility: Microsoft Word has a great tool  for exporting documents as tagged PDFs, a format that helps users who use screen readers, such as users with visual disabilities. I have found in my personal experience that R Markdown and bookdown require minimal to moderate customization to follow common accessibility practices, such as color contrast and tagging. My company was able to follow 508 requirements.

## Getting started

Open RStudio Desktop.

Go to *File > New Project > New Directory > Book project using bookdown*

![File menu in RStudio to create a new project](resources\file-new-project.png)

![Click on Book project using bookdown](resources\bookdown-project.png)

We now have an example book with all the requisite files. If you want you can simply edit the `.Rmd` files the same way you would edit a Word document and have a functioning book ready to go, but for data documentation purposes, we will dive a little deeper.

## Navigating bookdown

Here we take an overview of the main filetypes involved in bookdown and what they are used for.

> Who has worked with `.Rmd`, `.yml`, or `.css` before? What are these filetypes used for?

### `.Rmd`

bookdown is an extension of the R Markdown format, which is itself an extension of the Markdown markup language. 

But you don't need to know Markdown to get started. Toggle the options on the top left of the document window to switch between visual mode, which is similar to a Google Docs or Microsoft Word interface:

![R Markdown in visual mode](resources\visual-mode.png)

And source mode:

![R Markdown in source mode](resources\source-mode.png)

See [Resources](#resources) for links to learning R Markdown.

### `.yml`

These files control meta-structure for the book, as well as PDF appearances, via Pandoc and YAML. (If you have a background in web design, think of YAML like CSS for LaTeX, and of LaTeX as HTML for PDFs.)

`_bookdown.yml` controls high-level settings for the book. Let's change where the book outputs to:

```yaml
output_dir: "./MY_DIRECTORY"
```

Sometimes we have a lot of YAML code for one specific section, so we separate this out into another file. For example, `_output.yml` is sourced from `_bookdown.yml` as an `output:` YAML tag

The `output:` tag controls detailed options for the book structure, including download formats, sharing buttons, splitting pages by section, where output is located, and [appearance](https://bookdown.org/yihui/rmarkdown/html-document.html#appearance-and-style).

You can source other files here, such as custom CSS files:

```yaml
---
bookdown::gitbook:
  css: style.css
---
```

### `.css`

Cascading Style Sheets (CSS) are used across the web to control aesthetics. 

This piece is optional, especially for branded materials that may need to align with organizational guidelines. 

It can also be used to customize your output to handle specific cases. For example, I wanted. Let's see an example of how I dealt with this:



Another example is increasing the visible page width for wide content such as tables:

```css
/*Expand table width if needed*/

.book .book-body .page-wrapper .page-inner section.normal {
  overflow: visible !important;
}
.page-inner, .bookbody {
  max-width: 90% !important;
}
.page-inner p, .page-inner h1, .page-inner h2, .page-inner h3, .page-inner h4, .page-inner h5, .page-inner h6, .page-inner li, .page-inner .sourceCode, .page-inner table, .ref, .page-inner .figure, .page-inner .csl-entry {
  max-width: 800px;
  margin-left: auto;
  margin-right: auto;
}
#codebook table, .wide table {
  max-width: 98% !important;
}
```

[insert how I referenced these in the book]

## Interactive content

The `bookdown` format is compatible with many JavaScript-based packages such as `shiny` and `plotly`. This means that we can create books where users can interact with graphs, dashboards, and more!

In this section we focus on `reactable`, a package that allows users to interactively sort and filter tables, similarly to an Excel workbook. 

[describe reactable and kable]

## Integrating regular data updates

Each update to the underlying data may require us to update text in dozens or hundreds of places regarding sample size, missing values, and more. Integrating code directly into the text allows us to save time and prevent typos by calculating summary statistics from the data itself. 

It is likely we are not allowed to store data in the same place as the documentation, but uploading a summary `.csv` or `.xlsx` data file into our working directory allows us to accomplish the same task.

For example, we write the below as inline R code:

[insert code snippet of inline R]

Which renders as:

[insert image of rendered result]



## Publishing as a website

`bookdown` can publish to PDF and EPUB (e-book, such as Kindle), but we are going to focus on outputting to gitbook (`HTML`) so that we can host our documentation book on the open web. Notice that we have the benefit of multiple output formats, a good accessibility support.

![Build to gitbook from Build pane](resources\build.png)

In the RStudio IDE Build pane, click on *Build Book > bookdown::gitbook*. Or, run `bookdown::render_book()` in the R console.

### Hosting on GitHub

In order to make our new book public, we are going to host it on a website. Conveniently, GitHub has a built-in function to make any repository into a website. 

Open a browser and navigate to your repository online. On the Settings tab, under Pages, enable GitHub Pages.

![Deploy GitHub Pages from the docs folder](resources\github-pages.png)

The default name for a bookdown project directory is `/book`, but we see that GitHub only deploys `.html` files from inside directories named `/docs`. So we will rename our directory to `/docs`.

![Renaming books to docs](resources\rename.png)

[describe how to setup GitHub Pages]

Wait up to 5 minutes for GitHub to publish your website. When you return to the GitHub Pages tab, GitHub should alert you that your website is available at some link similar to `your-username.github.io/repository-name`. 

Clicking on that link shows you your new website:

![HTML rendered website welcome page](resources\website.png)

## Crowd-sourced edits

Hosting on GitHub gives us more than just a domain to click on. It gives us the ability to solicit feedback in real time from users. 

[insert where you could direct users to give feedback on GitHub - what happens if they don't have an account?]

## Resources

* [Bookdown gallery](https://bookdown.org/home/archive/)
* [Bookdown reference](https://bookdown.org/yihui/bookdown/)
* [R Markdown reference](https://bookdown.org/yihui/rmarkdown-cookbook/)

Author's note: [Quarto](https://quarto.org/) is becoming more popular, and so far appears to be similar to the bookdown/R Markdown workflow with the added benefit of supporting Python and Julia. Users familiar with Jupyter notebooks may find Quarto books more suited to their needs.

## Troubleshooting

### Operating system differences

iOS, Windows, Linux

[Grant add stuff about common/anticipated issues during live demonstration]