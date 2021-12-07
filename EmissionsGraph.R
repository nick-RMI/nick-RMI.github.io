library(tidyverse)
library(plotly)
setwd("~/OneDrive - RMI/Comparative Analysis")

emissions <- read_csv('SectorEmissions.csv')

emissions
scenarios <- emissions$Scenario %>% unique()
emissions <- emissions %>%  pivot_wider(names_from = c(Scenario,Sector), values_from = Value)

df_cols <- colnames(emissions)[-1]


fig <- plot_ly(emissions, x = ~Year, y = ~`PBL-IMAGE-LowNET_2018_Industry`, name = 'Industry', type = 'scatter', mode = 'none', stackgroup = 'one', fillcolor = '#45cfcc')
fig <- fig %>% add_trace(y = ~`PBL-IMAGE-LowNET_2018_Transportation`, name = 'Transportation', fillcolor = '#3dadf2')
fig <- fig %>% add_trace(y = ~`PBL-IMAGE-LowNET_2018_Buildings`, name = 'Buildings', fillcolor = '#016a75')
fig <- fig %>% add_trace(y = ~`BP-EO-NZ_2020_Industry`, name = 'Industry', fillcolor = '#45cfcc', visible = FALSE)
fig <- fig %>% add_trace(y = ~`BP-EO-NZ_2020_Transportation`, name = 'Transportation', fillcolor = '#3dadf2', visible = FALSE)
fig <- fig %>% add_trace(y = ~`BP-EO-NZ_2020_Buildings`, name = 'Buildings', fillcolor = '#016a75', visible = FALSE)
fig <- fig %>% add_trace(y = ~`SSP2-AIM-1.5C_2018_Industry`, name = 'Industry', fillcolor = '#45cfcc', visible = FALSE)
#fig <- fig %>% add_trace(y = ~`SSP2-AIM-1.5C_2018_Transportation`, name = 'Transportation', fillcolor = '#3dadf2',visible = FALSE)
fig <- fig %>% add_trace(y = ~`SSP2-AIM-1.5C_2018_Buildings`, name = 'Buildings', fillcolor = '#016a75',visible = FALSE)
fig <- fig %>% add_trace(y = ~`IIASA-MESSAGE-LED_2018_Industry`, name = 'Industry', fillcolor = '#45cfcc', visible = FALSE)
#fig <- fig %>% add_trace(y = ~`IIASA-MESSAGE-LED_2018_Transportation`, name = 'Transportation', fillcolor = '#3dadf2', visible = FALSE)
fig <- fig %>% add_trace(y = ~`IIASA-MESSAGE-LED_2018_Buildings`, name = 'Buildings', fillcolor = '#016a75', visible = FALSE)
fig <- fig %>% add_trace(y = ~`CWF-GCAM-CWF_2020_Industry`, name = 'Industry', fillcolor = '#45cfcc', visible = FALSE)
#fig <- fig %>% add_trace(y = ~`CWF-GCAM-CWF_2020_Transportation`, name = 'Transportation', fillcolor = '#3dadf2', visible = FALSE)
fig <- fig %>% add_trace(y = ~`CWF-GCAM-CWF_2020_Buildings`, name = 'Buildings', fillcolor = '#016a75', visible = FALSE)
fig <- fig %>% add_trace(y = ~`Shell-ETS-Sky1.5_2021_Industry`, name = 'Industry', fillcolor = '#45cfcc', visible = FALSE)
fig <- fig %>% add_trace(y = ~`Shell-ETS-Sky1.5_2021_Transportation`, name = 'Transportation', fillcolor = '#3dadf2', visible = FALSE)
fig <- fig %>% add_trace(y = ~`Shell-ETS-Sky1.5_2021_Buildings`, name = 'Buildings', fillcolor = '#016a75', visible = FALSE)
fig <- fig %>% add_trace(y = ~`IEA-NZ-NZE_2021_Industry`, name = 'Industry', fillcolor = '#45cfcc', visible = FALSE)
fig <- fig %>% add_trace(y = ~`IEA-NZ-NZE_2021_Transportation`, name = 'Transportation', fillcolor = '#3dadf2', visible = FALSE)
fig <- fig %>% add_trace(y = ~`IEA-NZ-NZE_2021_Buildings`, name = 'Buildings', fillcolor = '#016a75', visible = FALSE)
fig <- fig %>% add_trace(y = ~`BNEF-NEO-Gray_2021_Industry`, name = 'Industry', fillcolor = '#45cfcc', visible = FALSE)
fig <- fig %>% add_trace(y = ~`BNEF-NEO-Gray_2021_Transportation`, name = 'Transportation', fillcolor = '#3dadf2', visible = FALSE)
fig <- fig %>% add_trace(y = ~`BNEF-NEO-Gray_2021_Buildings`, name = 'Buildings', fillcolor = '#016a75', visible = FALSE)
fig <- fig %>% add_trace(y = ~`BNEF-NEO-Green_2021_Industry`, name = 'Industry', fillcolor = '#45cfcc', visible = FALSE)
fig <- fig %>% add_trace(y = ~`BNEF-NEO-Green_2021_Transportation`, name = 'Transportation', fillcolor = '#3dadf2', visible = FALSE)
fig <- fig %>% add_trace(y = ~`BNEF-NEO-Green_2021_Buildings`, name = 'Buildings', fillcolor = '#016a75', visible = FALSE)
fig <- fig %>% add_trace(y = ~`BNEF-NEO-Red_2021_Industry`, name = 'Industry', fillcolor = '#45cfcc', visible = FALSE)
fig <- fig %>% add_trace(y = ~`BNEF-NEO-Red_2021_Transportation`, name = 'Transportation', fillcolor = '#3dadf2', visible = FALSE)
fig <- fig %>% add_trace(y = ~`BNEF-NEO-Red_2021_Buildings`, name = 'Buildings', fillcolor = '#016a75', visible = FALSE)
fig <- fig %>% add_trace(y = ~`IEA-WEO-STEPS_2021_Industry`, name = 'Industry', fillcolor = '#45cfcc', visible = FALSE)
fig <- fig %>% add_trace(y = ~`IEA-WEO-STEPS_2021_Transportation`, name = 'Transportation', fillcolor = '#3dadf2', visible = FALSE)
fig <- fig %>% add_trace(y = ~`IEA-WEO-STEPS_2021_Buildings`, name = 'Buildings', fillcolor = '#016a75', visible = FALSE)
fig <- fig %>% add_trace(y = ~`IEA-WEO-AP_2021_Industry`, name = 'Industry', fillcolor = '#45cfcc', visible = FALSE)
fig <- fig %>% add_trace(y = ~`IEA-WEO-AP_2021_Transportation`, name = 'Transportation', fillcolor = '#3dadf2', visible = FALSE)
fig <- fig %>% add_trace(y = ~`IEA-WEO-AP_2021_Buildings`, name = 'Buildings', fillcolor = '#016a75', visible = FALSE)



fig <- fig %>% layout(
  title = "Emissions by Sector",
  yaxis = list(title = "Emissions (Gt CO2)",
               range = c(0,30)),           #this is where I fixed the Y axis. Change the '20' if a new scenario goes higher.
  updatemenus = list(
    list(
      text = "Select Scenario",
      y = 0.9,
      buttons = list(
        list(method = "restyle",
             args = list("visible", list(TRUE, TRUE, TRUE, 
                                         FALSE, FALSE, FALSE, 
                                         FALSE, FALSE,
                                         FALSE, FALSE,
                                         FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE)),
             label = "PBL-IMAGE-LowNET_2018"),
        
        list(method = "restyle",
             args = list("visible", list(FALSE, FALSE, FALSE, 
                                         TRUE, TRUE, TRUE, 
                                         FALSE, FALSE,
                                         FALSE, FALSE,
                                         FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE)),
             label = "BP-EO-NZ_2020"),
        list(method = "restyle",
             args = list("visible", list(FALSE, FALSE, FALSE, 
                                         FALSE, FALSE, FALSE, 
                                         TRUE, TRUE,
                                         FALSE, FALSE,
                                         FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE,
                                         FALSE, FALSE, FALSE)),
             label = "SSP2-AIM-1.5C_2018"),
        list(method = "restyle",
            args = list("visible", list(FALSE, FALSE, FALSE, 
                                        FALSE, FALSE, FALSE, 
                                        FALSE, FALSE,
                                        TRUE, TRUE,
                                        FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE)),
            label = "IIASA-MESSAGE-LED_2018"),
        list(method = "restyle",
            args = list("visible", list(FALSE, FALSE, FALSE, 
                                        FALSE, FALSE, FALSE, 
                                        FALSE, FALSE,
                                        FALSE, FALSE,
                                        TRUE, TRUE,
                                        FALSE, FALSE,FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE)),
            label = "CWF-GCAM-CWF_2020"),
      list(method = "restyle",
            args = list("visible", list(FALSE, FALSE, FALSE, 
                                        FALSE, FALSE, FALSE, 
                                        FALSE, FALSE,
                                        FALSE, FALSE,
                                        FALSE, FALSE,
                                        TRUE, TRUE, TRUE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE,
                                        FALSE, FALSE, FALSE)),
            label = "Shell-ETS-Sky1.5_2021"),
      list(method = "restyle",
           args = list("visible", list(FALSE, FALSE, FALSE, 
                                       FALSE, FALSE, FALSE, 
                                       FALSE, FALSE,
                                       FALSE, FALSE,
                                       FALSE, FALSE,
                                       FALSE, FALSE, FALSE,
                                       TRUE, TRUE, TRUE,
                                       FALSE, FALSE, FALSE,
                                       FALSE, FALSE, FALSE,
                                       FALSE, FALSE, FALSE,
                                       FALSE, FALSE, FALSE,
                                       FALSE, FALSE, FALSE)),
            label = "IEA-NZ-NZE_2021"),
      list(method = "restyle",
           args = list("visible", list(FALSE, FALSE, FALSE, 
                                      FALSE, FALSE, FALSE, 
                                      FALSE, FALSE,
                                      FALSE, FALSE,
                                      FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      TRUE, TRUE, TRUE,
                                      FALSE, FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      FALSE, FALSE, FALSE)),
           label = "BNEF-NEO-Gray_2021"),
      list(method = "restyle",
           args = list("visible", list(FALSE, FALSE, FALSE, 
                                       FALSE, FALSE, FALSE, 
                                       FALSE, FALSE,
                                       FALSE, FALSE,
                                       FALSE, FALSE,
                                       FALSE, FALSE, FALSE,
                                       FALSE, FALSE, FALSE,
                                       FALSE, FALSE, FALSE,
                                       TRUE, TRUE, TRUE,
                                       FALSE, FALSE, FALSE,
                                       FALSE, FALSE, FALSE,
                                       FALSE, FALSE, FALSE)),
           label = "BNEF-NEO-Green_2021"),
     list(method = "restyle",
           args = list("visible", list(FALSE, FALSE, FALSE, 
                                       FALSE, FALSE, FALSE, 
                                       FALSE, FALSE,
                                       FALSE, FALSE,
                                       FALSE, FALSE,
                                       FALSE, FALSE, FALSE,
                                       FALSE, FALSE, FALSE,
                                       FALSE, FALSE, FALSE,
                                       FALSE, FALSE, FALSE,
                                       TRUE, TRUE, TRUE,
                                       FALSE, FALSE, FALSE,
                                       FALSE, FALSE, FALSE)),
            label = "BNEF-NEO-Red_2021"),
     list(method = "restyle",
          args = list("visible", list(FALSE, FALSE, FALSE, 
                                      FALSE, FALSE, FALSE, 
                                      FALSE, FALSE,
                                      FALSE, FALSE,
                                      FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      TRUE, TRUE, TRUE,
                                      FALSE, FALSE, FALSE)),
          label = "IEA-WEO-STEPS_2021"),
     list(method = "restyle",
          args = list("visible", list(FALSE, FALSE, FALSE, 
                                      FALSE, FALSE, FALSE, 
                                      FALSE, FALSE,
                                      FALSE, FALSE,
                                      FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      FALSE, FALSE, FALSE,
                                      TRUE, TRUE, TRUE)),
          label = "IEA-WEO-AP_2021")))
  )
)

fig


## Embedding in SharePoint

htmlwidgets::saveWidget(fig,"index.html")
htmltools::tags$iframe(
  src = "https://nick-rmi.github.io", 
  scrolling = "no", 
  seamless = "seamless",
  frameBorder = "0",
  width = "600",
  height = "400"
)

rm(fig)
