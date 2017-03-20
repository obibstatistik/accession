library(shiny)
library(shinydashboard)
library(shinyjs)
library(markdown)
library(RPostgreSQL)
library(ggplot2)
library(plotly)

shinyServer(function(input, output) {
  
  #source("~/.postpass")
  #drv <- dbDriver("PostgreSQL")
  #con <- dbConnect(drv, dbname = dbname, host = host, port = port, user = user, password = password)
  
  #data <- dbGetQuery(con, "SELECT * FROM public.imusic")
  
  #dbDisconnect(con)
  
  #output$table <- DT::renderDataTable(DT::datatable({
  #  data
  #}, 
  #class = 'cell-border stripe',
  #rownames = FALSE
  #))
  
  output$plot <- renderPlotly({
    plot_ly(
      x = c("giraffes", "orangutans", "monkeys"),
      y = c(20, 14, 23),
      name = "SF Zoo",
      type = "bar"
    )
  })
  
  output$event <- renderPrint({
    d <- event_data("plotly_hover")
    if (is.null(d)) "Hover on a point!" else d
  })
  
})