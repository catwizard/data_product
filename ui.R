library(shiny)
library(ISLR); data(Wage); dataset <- Wage

fluidPage(    
    headerPanel("Wage Exploration"),
    
    sidebarPanel(    
        sliderInput('value', 'Wage and the median', 
                    min=min(Wage$wage), max=max(Wage$wage),
                    value=median(Wage$wage)),
        
        h4('Parameters for plotting'),
        selectInput('x', 'X', names(dataset), names(dataset)[[2]]),
        selectInput('y', 'Y for Pairs', names(dataset), names(dataset)[[6]]),
        selectInput('z', 'Z for Pairs', names(dataset), names(dataset)[[8]]),
        selectInput('color', 'Color for facet', names(dataset), names(dataset)[[6]]),
        
        radioButtons('type', 'Plot type', 
                     c('Pairs','Points', 'Density'))
    ),
    
    mainPanel(
        plotOutput('wage'),
        plotOutput('plot')
    )
)