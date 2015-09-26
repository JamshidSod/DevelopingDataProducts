library(shiny)
source('functions.R', local=TRUE);


# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
  
  # cache the created tables, one for character frequencies and one for the proportions 
  tables <- reactiveValues()
  observe({
    tables <<- getCountsAndPropsTable(input$text);
  })
  
  # Generate a figure for frequencies
  output$frequencyFigure <- renderPlot({
    if (nchar(input$text) > 0){
      x = barplot(tables$countsTable, col = "cyan", ylim = c(0, max(tables$countsTable) * 1.2), 
              xlab = "Characters", ylab = "Frequencies", 
              main = "Frequencies of Characters in Input Text", cex.names = 1.3);
      text(x, tables$countsTable, labels=tables$countsTable, col="red", font = 2, cex = 1.3)
    }
  })
  
  # Show a summary of frequencies
  output$summary_freq <- renderTable({
    if (nchar(input$text) > 0){
      sm = summary(tables$countsTable);
      sm["Total Frequency"] = as.character(sum(tables$countsTable));
      dataFrame = data.frame(t(sm[1:length(sm)]), row.names = NULL);
      names(dataFrame) = names(sm);
      dataFrame
    }
  })
  
  
  # Generate a figure for proportions
  output$proportionFigure <- renderPlot({
    if (nchar(input$text) > 0){
      x = barplot(tables$propTable, col = "green", ylim = c(0, max(tables$propTable) * 1.2), 
              xlab = "Characters", ylab = "Proportions", 
              main = "Proportions of Character Frequencies", cex.names = 1.3);
      text(x, tables$propTable, labels=round(tables$propTable, digits = 4), col="red", font = 2, cex = 1.3)
    }
  })
  
  # Show a summary of proportions
  output$summary_prop <- renderTable({
    if (nchar(input$text) > 0){
      sm = summary(tables$propTable);
      dataFrame = data.frame(t(sm[1:length(sm)]), row.names = NULL);
      names(dataFrame) = names(sm);
      dataFrame
    }
  })
  
  
})
