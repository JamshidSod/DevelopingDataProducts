library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Character Calculator", windowTitle = "A Simple Character Calculator"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      
      helpText( "Descrition of how to use this app: The application is easy to use. Paste a long or short text in the text box below to calculate the frequencies of frequently occurring characters of the input text and their proportions. The first output table in the main panel displays frequently occurring characters and their frequencies, and the second output table in the main panel displays frequently occurring characters and their proportions. "),  
      textInput("text", label = "Paste a text here: ", value = "aabccdccce", width = "100%")
    ),
    
    # Show a summary of the presented results
    mainPanel(
      plotOutput("frequencyFigure"),
      tableOutput("summary_freq"),
      plotOutput("proportionFigure"),
      tableOutput("summary_prop")
    )
    
    
  )
))