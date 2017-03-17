library(foreach)
library(shiny)
library(shinydashboard)
library(shinyjs)
library(markdown)
library(RPostgreSQL)

shinyServer(function(input, output) {
  
  source("~/.postpass")
  drv <- dbDriver("PostgreSQL")
  con <- dbConnect(drv, dbname = dbname, host = host, port = port, user = user, password = password)
  
  data <- dbGetQuery(con, "SELECT * FROM public.imusic limit 10")
  
  dbDisconnect(con)
  
  output$table <- DT::renderDataTable(DT::datatable({
    data
  }, 
  class = 'cell-border stripe',
  rownames = FALSE
  ))
  
})