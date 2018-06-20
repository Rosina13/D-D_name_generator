#connect to Shiny server
rsconnect::setAccountInfo(name='rosina', token='B3BBA1F05659D2C6082AC8F5FEDA65F7', 
                          secret='2tsQnofnHv6pnvXdTMRu8Fm1/+zD/JQz+/LVk12g')

library(rsconnect)
rsconnect::deployApp("E:/Coursera - Data Science/Course 9 - Developing Data products/Shiny assignment/Pathfinder_name_generator")
