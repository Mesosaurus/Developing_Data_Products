
library(shiny)

ui <- fluidPage(
    titlePanel("Predicted Salary of a College Professor in the US"),
    sidebarLayout(
           sidebarPanel(
                  h5("Base Salary = $67884.32"),
                  radioButtons (inputId = "rank", label = "Professor Type", 
                                  choices = list ("Assistant Professor" = 0, 
                                                 "Associate Professor" = 13104.15,
                                                 "Full-Time Professor" = 46032.55)),	
                  radioButtons (inputId = "discipline", label = "Discipline Type", 
                                  choices = list("Theoretical Department" = 0, 
                                                 "Applied Department" = 13937.47)),
                  radioButtons (inputId = "gender", label = "Gender", 
                                  choices = list("Male" = 4349.37, "Female" = 0)),
                  numericInput (inputId = "years", label = "Years Since PhD", value = 20, 
                                  min = 0, max = 60, step = 1)
                       ),
           mainPanel(
                  h4("Predicted Salary, in USD $"),
                  verbatimTextOutput("prediction")
                    )
                   )
                 )

predictedsalary <- function(rank, discipline, gender, years) 67884.32 + rank + 
                              discipline + gender + years*61.01
 
server <- function (input, output) {
    rank <- reactive({as.numeric(input$rank)})
    discipline <- reactive({as.numeric(input$discipline)})
    gender <- reactive ({as.numeric(input$gender)})
    
    output$prediction <- renderPrint ({predictedsalary(rank(), discipline(), 
                                        gender(), input$years)})
                                   }

shinyApp (ui=ui, server=server)

