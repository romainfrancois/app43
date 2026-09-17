library(shiny)
library(bslib)
library(reticulate)

ui <- page_fluid(
  h1("checks"),
  verbatimTextOutput("summary"),
  h1("run python code"),
  actionButton("go", "Run '40 + 2' in python"),
  verbatimTextOutput("py")
)

server <- function(input, output, session) {

  output$summary <- renderText({
    paste(
      paste("reticulate version:", utils::packageVersion("reticulate")),
      paste("python available:", py_available(initialize = TRUE)),
      sep = "\n"
    )
  })

  py <- eventReactive(input$go, {
    py_eval("40 + 2")
  })

  output$py <- renderText({
    py()
  })
}

shinyApp(ui, server)
