library(shiny)
library(ISLR); data(Wage); dataset <- Wage
library(caret)

shinyServer(
function(input, output) {
    output$wage <- renderPlot({
        hist(dataset$wage, xlab="Wage", main="Wage and the mean")
        abline(v=mean(dataset$wage), lwd=3,col="red")
        abline(v=input$value, lwd=2, col="blue")
    }, height=250)
    
    output$plot <- renderPlot({
         
        if (input$type=='Pairs')
            p <- featurePlot(x=dataset[,c(input$x,input$y,input$z)], y=dataset$wage, plot="pairs")
            # try age, education, jobclass (default)

        if (input$type=='Points')
            p <- qplot(x=dataset[,input$x], y=dataset$wage, color=as.factor(dataset[,input$color]))
            # p <- p + geom_smooth(method='lm', formula=y~x)
            # try age, wage; with education or jobclass as facet (color)
                    
        if (input$type=='Density')
            p <- qplot(dataset$wage, color=as.factor(dataset[,input$color]), geom="density")
                           
        print(p)
        
    }, height=600)
    
}
)