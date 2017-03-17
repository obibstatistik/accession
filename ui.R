library(foreach)
library(shiny)
library(shinydashboard)
library(shinyjs)

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
              box(width = 12,
                  DT::dataTableOutput("table")
              )
      ),
      tabItem(tabName = "dokumentation",
              box(width = 12,
                  "test"
              )
      )
    )
  )
)