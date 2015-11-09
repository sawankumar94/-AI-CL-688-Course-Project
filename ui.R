library(shiny)
library(caret)
shinyUI(
  pageWithSidebar (
    # Application title
    headerPanel("Predict Species"),
    sidebarPanel(
      #values of min and max are found by using range function in R
      # creating numeric input box for each of the variables 
      numericInput('Sepal.Length', 'Sepal Length',4.2, min = 4, max= 8, step = 0.1),
      numericInput('Sepal.Width', 'Sepal Width',3, min = 2, max= 4.5, step = 0.1),
      numericInput('Petal.Length', 'Petal Length',2, min = 1, max=7, step = 0.1),
      numericInput('Petal.Width', 'Petal Width',1, min = 0.1, max= 2.5, step = 0.1),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('You entered '),
      verbatimTextOutput("Sepal.Length"), #Sepal.Length is output name that server.R is lableled and is goint to print
      h4('You entered '),
      verbatimTextOutput("Sepal.Width"),
      h4('You entered '),
      verbatimTextOutput("Petal.Length"),
      h4('You entered '),
      verbatimTextOutput("Petal.Width"),
      h4('You entered '),
      verbatimTextOutput("data.frame"),
      h4('Which resulted in a prediction of '),
      verbatimTextOutput("prediction")   #prediction is that label name that server.R label prediction
      )
  )
)