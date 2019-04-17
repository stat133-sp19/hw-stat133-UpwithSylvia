library(shiny)
library(ggplot2)

ui <- fluidPage(
  
  titlePanel("Shiny App for Saving & Investing Scenarios"),
  
  fluidRow(
    column(4,
           sliderInput("initial", "Initial Amount",
                       min = 0,
                       max = 100000,
                       step = 500,
                       value = 1000,
                       pre = "$")
    ),
    column(4, 
           sliderInput("return", "Return Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 5)
    ),
    column(4,
           sliderInput("years", "Years",
                       min = 0,
                       max = 50,
                       step = 1,
                       value = 10)
    )),
  fluidRow(
    column(4,
           sliderInput("contrib", "Annual Contribution",
                       min = 0, 
                       max = 50000,
                       step = 500,
                       value = 2000,
                       pre = "$")
    ),
    column(4,
           sliderInput("growth", "Growth Rate (in %)",
                       min = 0, 
                       max = 20, 
                       step = 0.1,
                       value = 2)
    ),
    column(4,
           selectInput("facet", "Facet?", 
                       choices = list("Yes", "No"), 
                       selected = "No")
    )
  ),
  
  mainPanel(
    titlePanel("Timelines"),
    plotOutput("timelines", width = 800, height = "400"),
    titlePanel("Balances"),
    verbatimTextOutput("balances")
  )
)


server <- function(input, output) {
  
  #' @title Future Value Function
  #' @description computes the future value of an investment
  #' @param amount initial invested amount (numeric)
  #' @param rate annual rate of return (numeric)
  #' @param years number of years (numeric)
  #' @return computed future value of an investment
  future_value = function(amount, rate, years) {
    FV = amount * (1 + rate)^years
    return(FV)
  }
  
  #' @title Future Value of Annuity
  #' @description computes future value of annuity while depositing a certain amount annually
  #' @param contrib contributed amount
  #' @param rate annual rate of return
  #' @param years number of years
  #' @return computed value of how much money is returned
  
  annuity = function(contrib, rate, years) {
    FVA = contrib * (((1 + rate)^years - 1) / rate)
    return(FVA)
  }
  
  #' @title Future Value of Growing Annuity
  #' @description computes the future value of growing annuity while depositing a certain amount annually
  #' @param contrib contributed amount
  #' @param rate annual rate of return
  #' @param growth annual growth rate
  #' @param years number of years
  #' @return computed value of how much money is returned
  
  growing_annuity = function(contrib, rate, growth, years) {
    FVGA = contrib * (((1 + rate)^ years - (1 + growth)^years) / (rate - growth))
    return(FVGA)
  }
  
  modalities <- reactive( {
    initial = input$initial
    r = input$return/100
    years = input$years
    contrib = input$contrib
    growth = input$growth/100
    
    no_contrib <- length(11)
    fixed_contrib <- length(11)
    growing_contrib <- length(11)
    
    no_contrib[1] = initial
    fixed_contrib[1] = initial
    growing_contrib[1] = initial
    
    for (i in 1 : years) {
      no_contrib[i + 1] <- future_value(amount = initial, rate = r, years = i)
      fixed_contrib[i + 1] <- future_value(amount = initial, rate = r, years = i) + 
        annuity(contrib = contrib, rate = r, years = i)
      growing_contrib[i + 1] <- future_value(amount = initial, rate = r, years = i) +
        growing_annuity(contrib = contrib, rate = r, growth = growth, years = i)}
    
    modalities <- data.frame("years" = c(seq(0, 10, 1)), 
                             "no_contrib" = no_contrib, 
                             "fixed_contrib" = fixed_contrib, 
                             "growing_contrib" = growing_contrib)
    modalities
  }
  )
  
  output$timelines <- renderPlot({
    df = modalities()
    years = input$years
    df = data.frame(year = rep(df$year, 3), 
                    value = c(df$no_contrib, df$fixed_contrib, df$growing_contrib),
                    Mode = factor(c(rep("no_contrib",years+1),
                                    rep("fixed_contrib",years+1),
                                    rep("growing_contrib",years+1)
                    ), levels = c("no_contrib", "fixed_contrib", "growing_contrib")))
    
    if (input$facet == "No") {
      ggplot(df, aes(x = year, y = value, color = Mode)) +
        geom_line(size = 0.5)+
        geom_point(size = 0.5) + 
        labs(title = "Three Modes of Investing", x = "Year", y = "Value", color = "Mode")
      
    } else {

      ggplot(df, aes(x = year, y = value))+
        geom_line(aes(color = Mode), size = 0.5) +
        geom_point(aes(color = Mode), size = 0.5) +
        geom_area(aes(fill= Mode), alpha = 0.5) +
        facet_wrap(~Mode) +
        labs(title = "Modes of Investing", x = "Year", y = "Value")
    }
  })
  

  output$balances <- renderPrint({
    modalities()
  })
}

shinyApp(ui = ui, server = server)