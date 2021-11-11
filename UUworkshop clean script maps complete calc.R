# exploring data
library(tidyverse) #zit ggplot2, dplyr, tidyr, readr, purr, tibble al in
library(igraph) #analysing graphs
library(tidygraph) #werken met graphs in df modus met node en edgelists
library(ggraph) #gplot2 is poor fit for graph and network visualizations due to its reliance on tabular data input. ggraph is an extension of the ggplot2 API tailored to graph visualizations.

#df uploaden: nodelist_merkel_p2 (nodelist of example data)
#df uploaden: edgelist_merkel_p2 (edgelist of example data)
merkel_p2_nodes  <- read.csv ("good-enough-project-template/data/raw/nodelist_merkel_p2.csv")
merkel_p2_edges <- read.csv("good-enough-project-template/data/raw/edgelist_merkel_p2.csv")


#Calling my new function to calc node degrees and rename the node_calc df it returns
Merkel_p2_nodecalc <- calc_degrees_goW(merkel_p2_edges, merkel_p2_nodes) # takes edgelist, nodeslist


farthest_vertices(mp, directed = TRUE, unconnected = TRUE)# #determine longest path bepalen -HANGT DIT LOGISCH SAMEN MET HOEVEEL LOOPS JE MOET DOEN? 
get_diameter (mp, directed = TRUE, unconnected = TRUE)# Bij Merkel2 is langste pad 6 en na 5 runs balans


#nieuwe evaluation_step functie proberen
edges_new <- Evaluation_step(edges, nodes)[[1]]
nodes_new <- Evaluation_step(edges, nodes)[[2]]

edges_2 <- Evaluation_step(edges_new, nodes_new)[[1]]
nodes_2 <- Evaluation_step(edges_new, nodes_new)[[2]]

edges_result <- edges
nodes_result <- nodes

#daarvan een loop maken (dus ipv hierboven)
for (i in 1:5) {
  edges_result <- Evaluation_step(edges_result, nodes_result)[[1]]
  nodes_result <- Evaluation_step(edges_result, nodes_result)[[2]]
  print(i)
  print(sum(edges_result$value.x))
}

#volgende stappen aanpassen want val_run bestaat niet meer in de nieuwe evaluation function.

calc_dims(node_calc$val_run5, name = "Merkel", period = "p2")# takes nodecalc_valrun_nr, name, period


draw_final_map(node_calc$val_run5) ##draw graph - takes node_calc$val_runx (x nr of last run)
#do not forget to store graph under name_period


#Save edge & node calc lists under NAME_PERIOD
write.csv(node_calc, "data\\node_calc_NAME_PERIOD.csv", row.names = FALSE)
write.csv(edge_calc, "data\\edge_calc_NAME_PERIOD.csv", row.names = FALSE)


#JEROEN MAPS TEKENEN MET GOW SPACING
#Use node name as label for nodes in network
node_calc <- node_calc %>% 
  rename(label = node_name)

#Use GOW to determine location of the node
#In case of usage of GO, use "rename(level = go)"
node_calc <- node_calc %>% 
  rename(level = gow)

#Generate map
install.packages("visNetwork")

library(visNetwork)

visNetwork(node_calc, edges) %>% 
  visEdges(arrows = "to") %>% 
  visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE) %>%
  visHierarchicalLayout(direction = "LR", levelSeparation = 400)




