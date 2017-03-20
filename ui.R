library(foreach)
library(shiny)
library(shinydashboard)
library(shinyjs)
library(plotly)

dashboardPage(
  skin = "blue",
  
  dashboardHeader(
    title = "iMusic"
  ),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Statistik Dashboards", tabName = "dashboards", icon = icon("bar-chart", lib="font-awesome")),
      menuItem("Dokumentation", tabName = "dokumentation", icon = icon("file-text-o", lib="font-awesome")
      )
    )
  ),
  
  dashboardBody(
    tabItems(
      
      tabItem(tabName = "dashboards",
        box(
          width = 12,
          h3("Overskrift"),
          "Beskrivelse af hvad man ser på graferne"
        ),
        fluidRow(
          column(3,
            box(
              width = 12,
              h4("Filtre"),
              fluidRow(
                column(12,        
                  "Periode",
                  "Kundenummer"
                )
              )  
            )
          ),
          column(9,
              box(width = 12,
                  plotlyOutput("plot")
              )#,
              #box(width = 12,
                #DT::dataTableOutput("table")
              #)
          )
        )  
      ),
      tabItem(tabName = "dokumentation",
              box(width = 12,
                  "hvor meget leveres til rette tid",
                  "dd"
                  
              )
      )
    )
  )
)