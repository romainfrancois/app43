library(shiny)
library(bslib)

ui <- page_fluid(
  sidebarLayout(
    sidebarPanel(
      actionButton("go", "Go: 40 + 2"),
    ),
    mainPanel(
      verbatimTextOutput("summary")
    )
  )
)

server <- function(input, output, session) {

  py <- eventReactive(input$go, {
    reticulate::py_eval("40 + 2")
  })

  output$summary <- renderText({
    py()
  })

}

shinyApp(ui, server)
