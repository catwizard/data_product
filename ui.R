library(shiny)
library(ISLR); data(Wage); dataset <- Wage

fluidPage(    
    navbarPage("Wage Exploration",
      tabPanel("Variables",
        sidebarPanel(
          HTML("Choose X, Y, Z and Facet to exploring the relationship"),
          selectInput('x', 'X', names(dataset), names(dataset)[[2]]),
          selectInput('y', 'Y for Pairs', names(dataset), names(dataset)[[6]]),
          selectInput('z', 'Z for Pairs', names(dataset), names(dataset)[[8]]),
          selectInput('color', 'Facet', names(dataset), names(dataset)[[6]]),
                            
          radioButtons('type', 'Plot type', 
              c('Pairs','Points', 'Density'))
        ),
        mainPanel(
            plotOutput('plot'))
      ),
      tabPanel("Wage Range",
        sidebarPanel(    
          sliderInput('value', 'Wage and the median', 
                    min=min(Wage$wage), max=max(Wage$wage),
                    value=median(Wage$wage))
        ),
        mainPanel(
            plotOutput('wage'))
      ),
      tabPanel("About",
               h3("About"),
               p(),
               HTML("This web aplication uses the Wage data from package ISLR in R,", 
                    "which includes 3000 observations with varaibles wage, year, age, sex, maritl, race, education,",
                    "region, jobclass, health and other."),
               p(),
               HTML("This app is to exploring the relationship between wage and", 
                    "other variables for prediction afterwards."), 
               p(),
               HTML("R Code of this Shiny app with ui.R and Server.R is stored in"),
               a(href="https://github.com/catwizard/data_product", 
                 "author's GitHub Repository."),
               HTML("A simple presentation created by RStudio Presentation is also in"),
               a(href="http://catwizard.github.io/Assignment.html", 
                 "author's GitHub Repository,"),
               p(),
               HTML("Finally, this is a course project of"), 
               a(href="https://www.coursera.org/course/devdataprod", 
                 "Developing Data Production in Coursera"),
               HTML("by Johns Hopkins University.")
      )
))
