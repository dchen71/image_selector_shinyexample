##
## Image Visualizer
## This is a barebone shiny shell to visualize pre-made images from the www/images folder 
## manually input into the app
##

# Load packages
require(shiny)
require(dplyr)
require(qtl)
require(stringr)
require(ggplot2)
require(stringr)

#Init global variables
# Choices for what files will be read into the app
allChoices = read.csv("input/names.csv", stringsAsFactors = FALSE)
Choices = allChoices$Name

# Define UI
ui <- shinyUI(fluidPage(
  # Add in custom css
  tags$head(
    tags$style(HTML("
                    
                    
                    #selectedGene {
                    font-weight: 500;
                    font-size: 2em;
                    line-height: 1.1;
                    color:#FFA07A;
                    }
                    
                    #selectedGeneChr {
                    font-weight: 500;
                    font-size: 1.5em;
                    line-height: 1.1;
                    color:#FFA07A;
                    }
                    
                    img{
                    width=100%;
                    height:600px;
                    padding-top: 1em;
                    padding-bottom: 2em;
                    z-index: -1;
                    }
                    
                    .col-sm-6{
                    padding-top: 1em;
                    padding-bottom: 2em;
                    height: 725px;
                    }
                    
                    .nav-tabs{
                    padding-top:1em;
                    }
                    
                    img:hover{
                    height:120%;
                    width:100%;
                    }
                    
                    "))
    ), 
  
  
  # Application title
  titlePanel("Image Viewer"),
  
  selectInput("fileName", "Select file name", choices=Choices),
  
  # Image output of different tissues with WT on top with tail vs other tissues
  tabsetPanel(type = "tabs", 
              tabPanel("Dog1",
                       h1("Tail"),
                       column(6,
                              h2("Doge"),
                              plotOutput("doge1")
                       ),
                       column(6,
                              h2("Doge2"),
                              plotOutput("doge2")
                       ),
                       h1("Back"),
                       column(6,
                              h2("Doge3"),
                              plotOutput("doge3")
                       ),
                       column(6,
                              h2("Doge4"),
                              plotOutput("doge4")
                       )
              ), 
              tabPanel("Dog2", 
                       h1("Tail"),
                       column(6,
                              h2("Doge1"),
                              plotOutput("doge5")
                       ),
                       column(6,
                              h2("Doge2"),
                              plotOutput("doge6")
                       ),
                       h1("Carc"),
                       column(6,
                              h2("Doge3"),
                              plotOutput("doge7")
                       ),
                       column(6,
                              h2("Doge4"),
                              plotOutput("doge8")
                       ))
  )
  
  
    ))

# Define server logic
server <- shinyServer(function(input, output) {
  ##
  ## Preliminary work to load photos
  ##
  file_dir = "www/images/"
  
  #Function to recreate the file name
  #Use this function to build the direct path to the images in www/images
  create_dirName = function(fileName, tissue, genotype){
    return(list(
      src=paste0(file_dir, fileName, ".jpg")))
  }
  
  ##
  ## Output
  ##
  
  #Image ouptut for each doge object
  output$doge1 = renderImage({
    create_dirName(input$fileName)
  }, deleteFile=FALSE)
  output$doge2 = renderImage({
    create_dirName(input$fileName)
  }, deleteFile=FALSE)
  output$doge3 = renderImage({
    create_dirName(input$fileName)
  }, deleteFile=FALSE)
  output$doge4 = renderImage({
    create_dirName(input$fileName)
  }, deleteFile=FALSE)
  output$doge5 = renderImage({
    create_dirName(input$fileName)
  }, deleteFile=FALSE)
  output$doge6 = renderImage({
    create_dirName(input$fileName)
  }, deleteFile=FALSE)
  output$doge7 = renderImage({
    create_dirName(input$fileName)
  }, deleteFile=FALSE)
  output$doge8 = renderImage({
    create_dirName(input$fileName)
  }, deleteFile=FALSE)
})

# Run the application 
shinyApp(ui = ui, server = server)