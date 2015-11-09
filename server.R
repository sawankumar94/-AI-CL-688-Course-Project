 # first step loading of libraries
library(shiny) # Shiny is the package in R where we can interactive create web applications
library(caret) # caret is the package in R which contains functions for data partition,prediction etc)

data("iris") # iris is the dataset which contains measurements of sepal lenth,petal length,sepal width, petal width for 3 speices

names(iris) # names of variables (column wise)
table(iris$Species) # different types of Species
inTrain <- createDataPartition(y=iris$Species,p=0.7,list=FALSE) # data partition into training set
training <- iris[inTrain,]
testing <- iris[-inTrain,]
modFit <- train(Species~.,method="rpart",data=training)  #  fitting model over training data set where "rpart"for prediction with trees
shinyServer(
  function(input,output) {
    output$Sepal.Length <- renderPrint({input$Sepal.Length}) # basically we render the input part to ouput part which is useful for ui.R
    output$Sepal.Width <- renderPrint({input$Sepal.Width})   # or Sepal.Width will be output name for our corresponding input
    output$Petal.Length <- renderPrint({input$Petal.Length})
    output$Petal.Width <- renderPrint({input$Petal.Width})
    output$data.frame <- renderPrint(data.frame(input$Sepal.Length,input$Sepal.Width,input$Petal.Length,input$Petal.Width))
    output$prediction <- renderPrint ({predict(modFit,data.frame(Sepal.Length=input$Sepal.Length,Sepal.Width=input$Sepal.Width,Petal.Length=input$Petal.Length,Petal.Width=input$Petal.Width))})
  }
)
  