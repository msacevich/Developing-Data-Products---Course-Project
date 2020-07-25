# Load required libraries
library(shiny)
library(ggplot2)

function(input, output) {
    
    # Reload the data based on Sample Size selected by user
    dataset <- reactive({
        diamonds[sample(nrow(diamonds), input$sampleSize),]
    })
    
    # Plot based on user inputs
    output$plot <- renderPlot({
        
        p <- ggplot(dataset(), aes_string(x = input$x, y = input$y)) + geom_point()
        
        if (input$color != 'None')
            p <- p + aes_string(color = input$color)
        
        
        p <- p + ggtitle(input$caption)
        
        print(p)
        
    }, height=800)
    
}