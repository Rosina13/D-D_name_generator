#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# import words from txt files
  #for local deployment:  
  #setwd("E:/Coursera - Data Science/Course 9 - Developing Data products/Shiny assignment/Pathfinder_name_generator")
  #adverb <- read.table("./Data/adverb.txt", header=T, sep="\t")  
  #adjective <- read.table("./Data/adjective.txt", header=T, sep="\t")
  #simplenoun <- read.table("./Data/simplenoun.txt", header=T, sep="\t")
  #verber <- read.table("./Data/verber.txt", header=T, sep="\t")
  #thingnoun <- read.table("./Data/thingnoun.txt", header=T, sep="\t")
  #personnoun <- read.table("./Data/personnoun.txt", header=T, sep="\t")
  #name_firstpart <- read.table("./Data/name_firstpart.txt", header=T, sep="\t")
  #name_secondpart <- read.table("./Data/name_secondpart.txt", header=T, sep="\t")

  #from Github (rightclick on raw and copy link):
  adverb <- read.table(url("https://github.com/Rosina13/D-D_name_generator/raw/master/adverb.txt"), header=T, sep="\t")  
  adjective <- read.table(url("https://github.com/Rosina13/D-D_name_generator/raw/master/adjective.txt"), header=T, sep="\t")  
  name_firstpart <- read.table(url("https://github.com/Rosina13/D-D_name_generator/raw/master/name_firstpart.txt"), header=T, sep="\t")  
  name_secondpart <- read.table(url("https://github.com/Rosina13/D-D_name_generator/raw/master/name_secondpart.txt"), header=T, sep="\t")  
  personnoun <- read.table(url("https://github.com/Rosina13/D-D_name_generator/raw/master/personnoun.txt"), header=T, sep="\t")  
  verber <- read.table(url("https://github.com/Rosina13/D-D_name_generator/raw/master/verber.txt"), header=T, sep="\t")  
  simplenoun <- read.table(url("https://github.com/Rosina13/D-D_name_generator/raw/master/simplenoun.txt"), header=T, sep="\t")  
  thingnoun <- read.table(url("https://github.com/Rosina13/D-D_name_generator/raw/master/thingnoun.txt"), header=T, sep="\t")  
  

  list_tables <- list(adverb,adjective,simplenoun,verber,thingnoun, 
                      personnoun,name_firstpart,name_secondpart)
 
# Define server logic
shinyServer(function(input, output) {
  output$name <- renderText({
    
  #filter tables based on input
    #filter based on gender
    if(input$gender == "male"){
      list_tables <- lapply(list_tables, 
                            function(i) i[which((i$Gender=="M")|(i$Gender=="all")),])
    }   
    if(input$gender == "female"){
      list_tables <- lapply(list_tables, 
                            function(i) i[which((i$Gender=="F")|(i$Gender=="all")),])
    } 
    
    #filter based on race
    if(input$race == "human"){
      list_tables <- lapply(list_tables, 
                            function(i) i[which((i$Race=="human")|(i$Race=="all")),])
    } 
    if(input$race == "elf"){
      list_tables <- lapply(list_tables, 
                            function(i) i[which((i$Race=="elf")|(i$Race=="all")),])
    } 
    if(input$race == "dwarf"){
      list_tables <- lapply(list_tables, 
                            function(i) i[which((i$Race=="dwarf")|(i$Race=="all")),])
    } 
    if(input$race == "orc"){
      list_tables <- lapply(list_tables, 
                            function(i) i[which((i$Race=="orc")|(i$Race=="all")),])
    } 
    
    #filter based on seriousness
    if(input$serious){
      list_tables <- lapply(list_tables, 
                            function(i) i[which(i$Serious=="yes"),])
    } 
    
    #take dataframes out of list
    adverb <- list_tables[[1]]  
    adjective <- list_tables[[2]] 
    simplenoun <- list_tables[[3]] 
    verber <- list_tables[[4]] 
    thingnoun <- list_tables[[5]] 
    personnoun <- list_tables[[6]] 
    name_firstpart <- list_tables[[7]] 
    name_secondpart <- list_tables[[8]] 
  
  #define function called by button    
  generate_name <- eventReactive(input$goButton, { 
  
    #generate names
    option1 <- paste(sample(name_firstpart$Word,1),
                     sample(name_secondpart$Word,1)," the ",
                     sample(simplenoun$Word,1),
                     sample(verber$Word,1),sep="")
    option2a <- paste(sample(name_firstpart$Word,1),
                      sample(name_secondpart$Word,1)," the ",
                      sample(personnoun$Word,1)," of ",
                      sample(thingnoun$Word,1),sep="")
    option2b <- paste(sample(name_firstpart$Word,1),
                      sample(name_secondpart$Word,1)," the ",
                      sample(adjective$Word,1)," ",
                      sample(personnoun$Word,1)," of ",
                      sample(thingnoun$Word,1),sep="")
    option2c <- paste(sample(name_firstpart$Word,1),
                      sample(name_secondpart$Word,1)," the ",
                      sample(verber$Word,1)," of ",
                      sample(thingnoun$Word,1),sep="")
    option3 <- paste(sample(name_firstpart$Word,1),
                     sample(name_secondpart$Word,1)," the ",
                     sample(adverb$Word,1)," ",
                     sample(adjective$Word,1),sep="") 
    #print names
    print(sample(c(option1,option2a,option2b,option2c,option3),1))
    })
  
    generate_name()
    })
  })
