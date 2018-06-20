#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Dungeons & Dragons Character Name and Title Generator"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      # Input
      selectInput("gender", "gender:",c("either","male","female"),selected="either"), 
      selectInput("race", "race:",c("any","human","elf","dwarf","orc"),selected="any"),
      checkboxInput("serious", "serious names only", value=FALSE),
      actionButton("goButton", "Go!"),
      helpText("Pick your gender and race, and press 'Go' to generate a name and title")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h1(textOutput("name"))
    )
  )
))
