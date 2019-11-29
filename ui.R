
library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Twitter Sentiment Analysis"),
  
  # Getting User Inputs
  
  sidebarPanel(
    
    textInput("searchTerm", "Enter data to be searched with '#'", "#"),
    sliderInput("maxTweets","Number of recent tweets to use for analysis:",min=5,max=1000,value=500), 
    submitButton(text="Analyse")
    
  ),
  
  mainPanel(
    
    
    tabsetPanel(
      
      tabPanel("Top Trending Topics Today",HTML("<div>Top Trending Topics according to location</div>"),
               
               selectInput("trendingTable","Choose location to extract trending topics",c("Worldwide","India","Pakistan","Japan","United Kingdom","United States","Australia"), selected = "Worldwide", selectize = FALSE),
               submitButton(text="Search"),HTML("<div><h3> The table below shows the top Trending 
                                                Topics on Twitter of the location you have chosen. These are the hot topics today! </h3></div>"),
               tableOutput("trendtable"),
               HTML
               ("<div> </div>")),
      
      
      tabPanel("WordCloud",HTML("<div><h3>Most used words associated with the Trending Hashtag</h3></div>"),plotOutput("word"),
               HTML
               ("<div><h4> A Wordcloud is a visual representation of text data, typically used to depict keyword metadata (tags) on websites, or to visualize free form text.
                 </h4></div>")),
      
      
      tabPanel("Histogram",HTML
               ("<div><h3> Histograms graphically depict the positivity or negativity of peoples' opinion about of the hashtag
                 </h3></div>"), plotOutput("histPos"), plotOutput("histNeg"), plotOutput("histScore")
               ),
      
      
      tabPanel("Pie Chart",HTML("<div><h3>Pie Chart</h3></div>"), plotOutput("piechart"),HTML
               ("<div><h4> A pie chart is a circular statistical graphic, which is divided into slices to illustrate the sentiment of the hashtag.</h4></div>")
               
      ),
      
      tabPanel("Table",HTML( "<div><h3> Storing the Tweets associated with the Hashtag in Tabular Format </h3></div>"), tableOutput("tabledata"),
               HTML ("<div><h4> This table depicts the Sentiment of the Tweets (Positive, Negative or Neutral) 
				associated with the searched Hashtag by showing the score for each type of sentiment. </h4></div>")),
      
      
      tabPanel("Top Charts",HTML
               ("<div><h3> Top 20 users who used that Hashtag</h3></div>"),plotOutput("tweetersplot"), tableOutput("tweeterstable"))
      
      #tabPanel("Top Hashtags of User",textInput("user", "Enter Twitter Handle to be analyzed", "@"),submitButton(text="Analyze"),plotOutput("tophashtagsplot"),HTML
       #        ("<div> <h3>Hashtag frequencies in the tweets of the Twitter User</h3></div>"))
      )#end of tabset panel
      )#end of main panel
  
      ))#end of shinyUI