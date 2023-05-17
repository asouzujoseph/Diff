library(shiny)
library(DT)
library(readxl)

changes = read_excel("~/changes.xlsx")
#datatable(changes,editable=TRUE, extensions = c('Buttons','Scroller','KeyTable'), options = list(dom = 'Bfrtip', buttons = c( 'csv', 'excel')))


ui <- fluidPage(
      theme = bslib::bs_theme(version = 4,bootswatch = "cerulean"),
      tabsetPanel(
        tabPanel("Molecular",fluidRow(column(12,DTOutput("mol")))
        ),
        tabPanel("General",fluidRow(column(12,DTOutput("gen")))
        ),
        tabPanel("Common",fluidRow(column(12,DTOutput("com")))
        ),
        tabPanel("DRA",fluidRow(column(12,DTOutput("dra")))
        )
      )
)

server <- function(input, output, session) {
        output$mol=renderDT(changes,editable=TRUE, extensions = c('Buttons','FixedHeader','FixedColumns'), options = list(dom = 'Bfrtip', buttons = c( 'csv', 'excel')))
}

shinyApp(ui, server)