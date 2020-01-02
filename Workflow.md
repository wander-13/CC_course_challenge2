### Elena's Workflow  

#### Goals and To Do (based on the 'Specific tasks' section of the [Challenge level 2](https://ourcodingclub.github.io/DL/challenge2.html) website):  
#### 1. Goal: Clean the data  
Clean and filter the data to the sites and woodland types of interests:  
- Restrict the NWSS observations to the following dominant habitat types:  
    - Native pinewood  
    - Upland birchwood  
    - Upland mixed ashwood  
    - Upland oakwood  
    - Wet woodland  
    - Lowland mixed deciduous woodland  
- Restrict the NNR shapefile to the following areas, lump the last three under the same name, and rename as indicated:  
    - Great Trossachs Forest (rename to "Trossachs")  
    - Glen Affric (leave as such)  
    - Cairngorms (part of the "Cairngorms" group)  
    - Mar Lodge Estate (part of the "Cairngorms" group)  
    - Abernethy (part of the "Cairngorms" group)  
NB: There are 6 more NNRs in the Cairngorms National Park, but these three are large ones within the core of the park, and the only ones we'll be considering for this analysis.
#### 1. To Do:   
- [x] load the datasets and assign them to objects   
- [x] use pipes and the dplyr package to edit that object based on the goals above   
#### 2. Goal: Map the areas of interest  
Create a map for each of the three areas (Cairngorms, Trossachs, and Glen Affric) showing the geographical distribution of the priority habitats.  
- Create a colour palette that you will use consistently to refer to the habitat types  
•	Be prepared to answer the question:  
- What type(s) of priority habitat is (are) found in the Trossachs but not in the other two areas?  
#### 2. To Do:  
- [x] Count the number of habitat types  
- [x] Create a color palette for the habitat types  
- [ ] Figure out how to map a shape file in R  

#### 3. Goal: Calculate the proportion of land (in %) covered by each habitat in the three areas.  

The total NNR area is found in the cell SITE_HA, and the habitat polygon size is contained in the cell HECTARES. (Note that there are more than one polygon per habitat type! Think about grouping observations first.)  
- Create a graph of your choice to represent the proportion of each habitat within the reserves  
- Be prepared to answer the question:  
    - “What proportion of Glen Affric is covered in pinewoods?”  

#### 3. To Do:  
- [ ] Figure out how to associate the total NNR area with the habitats (they are in two separate data frames)  
- [ ] Merge the dataframes together (?)  
- [ ] Calculate the proportion of each habitat in the reserves using code and mutate that column onto the dataframe  
- [ ] Create a stacked bar chart to dispay the proportions of each habitat within the reserves  
- [ ] Answer the question in words and record  

#### 4. Goal: Calculate the species richness and evenness of the three areas.
- Calculate the richness, the Shannon index, and the evenness for all three sites. (Hint: some pipe chains involving our favourite dplyr functions may be useful here!)  
- Be ready to answer the questions:  
    - “Which area has the most species?”  
    - “Which area has the lowest evenness?”  

#### 4. To Do:  
- [ ] Calculate the numbers requested  
- [ ] Answer and record the answers to the questions  

