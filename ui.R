# Load required libraries
library(shiny)
library(ggplot2)

dataset <- diamonds

pageWithSidebar(
    headerPanel("Diamond Price Analysis"),

    sidebarPanel(
        sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset), value=min(5000, nrow(dataset)), step=100, round=0),
        selectInput('x', 'X Axis Measure', names(dataset)),
        selectInput('y', 'Y Axis Measure', names(dataset), names(dataset)[[7]]),
        selectInput('color', 'Measure Color', c('None', names(dataset)), names(dataset)[[4]])
        
    ),
    
    mainPanel(

        plotOutput('plot')
    )
)