# 20220120_HWZ_ForumComments_SCraping

This consists of two files, one for scraping comments on HWZ and another to conduct analysis on the scrapped data. 

The HWZ data scrapper parses the intended url and extracts all comments, userid and date of commentand 
It also removes unwanted information such as links and links content posted by commentor. 
However, it is not able to extract emojis and moving emojis (please help if anyone knows how to do it)

After extracting relevant information, it uses NLTK and Spacey to remove punctuations, stop words, and carries out stemming. 
Each word and its corresponsing urserid and datetime is appended into a row in a CSV file. 

Analysis is done in postgresql and visualised in tableau:
https://public.tableau.com/app/profile/jia.ying2894/viz/20220119_HWZ_PLH_MostUsedWords/Dashboard1?publish=yes
