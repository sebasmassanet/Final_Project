
library(shiny)
library(gclus)
data(wine)
shinyUI(pageWithSidebar(
  headerPanel('Wine k-means clustering'),
  sidebarPanel(h4('This app executes k-means algorithm with data collected in dataset wine of package gclus. Two variables are
                  selected to perform the algorithm and display the result. The user can select the two variables, the number of clusters,
                  and the specific k-means algorithm'),
    selectInput('xcol', 'X Variable', names(wine[,2:10])),
    selectInput('ycol', 'Y Variable', names(wine[,2:10]),
                selected=names(wine[,2:10])[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
    selectInput('id2', 'Algorithm', c("Hartigan-Wong","Lloyd","MacQueen"))
  ),
  mainPanel(
    plotOutput('plot1')
  )
))
