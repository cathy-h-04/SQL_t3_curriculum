
/*                          
                            google scribe

                             INTRODUCTION TO SQL
                    T3 LESSON PLAN CREATED BY CATHY HOU
*******************************************************************************
Welcome everyone! In this 45-minute tutorial, you are going to learn the basics
of a powerful programming language, SQLite. 


DATASET INFO
********************************************************************************
Today, you will be provided with a dataset filled with energy production data 
taken from the Power Cost Equalization Program. This dataset is based on monthly 
data reported by participating utilities. For those unfamiliar with PCE, 
this is a government program that provides financial support to rural areas 
of Alaska in order to reduce energy prices. 

LOADING DATA
********************************************************************************
Navigate to the file titled setup.py, run this, and come back to this page. 

CHALLENGE SUMMARY
********************************************************************************
Dr. Doofenschmirtz is interested in implementing renewables in a secret, already 
chosen location in Alaska. To do so, he needs to first look at existing data in 
remote locations. There two records from certain utility(s) that are almost an 
exact match for the conditions he would like to build a renewable project in. 
Through a series of hints, you will try to find the ids of these records, 
and at the end of this lesson, you can check if you are correct. 


VIEWING RESULTS AND HELPFUL HINTS
*******************************************************************************
Information taken from: 
https://burkeholland.gitbook.io/vs-code-can-do-that/exercise-7-working-with-data/working-with-sqlite 

For easy viewing while you are querying, or filtering for information:
Open the Command Prompt (Cmd/Ctrl + Shift + P)
Select "SQLite: Open Database"
Select "Choose database from file" in the prompt
Type "/PCE_data.db" in the prompt
Open the Explorer view (Cmd/Ctrl + Shift + E)
You will now see the filter results each time you query. 

For every query (code block):
Highlight the block to run.
Right click and select "SQLite: Run Selected Query"

Queries are in the general format:
SELECT [COLUMN NAMES, or * FOR THE WHOLE ROW] FROM [TABLE_NAME]
WHERE [SPECIFIC COLUMN] = 
[SPECIFIC VALUE] 

Now we are all ready! Follow along closely, running sections labeled 
"CODE BLOCK" with the above instructions. In section labeled "TO-DO", you will 
be writing some code and running it in groups. 

CODE BLOCK
******************************************************************************
Dr. Doofenschmirtz has a bad history with regulations. He does not want his
new project to be regulated. He would like to only consider the records that are
"Not regulated." Run the below query to help him do so. */

SELECT * FROM PCE_data WHERE regulatory_status = 'Not regulated';

/******************************************************************************/

/*Great! But that still leaves us with 3,655 records. Whew. That doesn't get 
us much closer. We need more conditions. Thankfully, this is possible in SQLite!

CODE BLOCK
********************************************************************************
Dr. Doofenschmirtz also knows that energy production is rapidly changing. 
Dealing with rapidly changing data means that it is important to keep track of 
the year in which this data was collected. He would like to check that the
special record is during or after 2013. 

Hint: to query with multiple conditions, we use the word AND.

FORMAT:
SELECT [COLUMN NAMES, or * FOR THE WHOLE ROW] FROM [TABLE_NAME]
WHERE [SPECIFIC COLUMN] = [SPECIFIC VALUE] AND
    [ANOTHER COLUMN] = [ANOTHER VALUE]*/


SELECT * FROM PCE_data WHERE 
    regulatory_status = 'Not regulated' AND 
    year >= 2013; 

/* Wow! that worked prety well. There are now only 552 records to choose from, 
compared to the 5000+ that we started with. Use the rest of the hints below 
to eventually find the records that best match the site 
for renewables that Dr. Doofenschmirtz has in mind!

TO-DO ONE
********************************************************************************
Dr. Doofenschmirtz knows that for some communities, traditional oil and gas is 
still the cheapest option. He is only interested in implementing 
renewables in communities that spend at least $15,000 on fuel per year. 

BRAINSTORM with your groups. How might we query this? Write it on a piece of 
paper. This might seem silly, but it is actually very common coding practice!

HINT: it is possible to do math with SQL Queries! Simply place the equation 
in parenthesis. This should leave you with 396 records to choose from! 

The answer will be provided in the slideshow. */


/* WRITE YOUR CODE BELOW HERE AND RUN IT. */

/* TO-DO TWO 
********************************************************************************
Implementing renewables is a great idea for small, remote communities. 
This is often done through microgrids, which can supply electricity 
without connections to the traditional grid. Thus, Dr. Doofenschmirtz
wants to find a record in which there are fewer than 70 residential customers.
This is a good indicator that the community is small and remote.  

HINT: This should leave you with 115 records to choose from! 

The answer will be provided in the slideshow. */

/* WRITE YOUR CODE BELOW HERE AND RUN IT. */

/* TO-DO THREE. 
********************************************************************************
Oftentimes, when data is limited, researchers look at the "worst case 
scenario." Dr. Doofenschmirtz has chosen a region where the coldest day takes 
place in November, and the hottest day takes place in June. 

Peak load often occurs during either the hottest or coldest months. 
Dr. Doofenschmirtz doesn't know whether the hottest or coldest day is 
responsible for peak load, but he has been told it is one of those days. 
Thus, he is interested in records in either June OR November.  

BRAINSTORM with your groups how you might write this query. 

Hint: Just like we used AND to filter for multiple conditions that all have 
to be true, we can also use OR to filter for a set of conditions, either of
which can be true. In this case, the month can be 11 (November) or 6 (June).

If your query isn't working, try putting parenthesis around certain sections. 
This tells the computer how to "chunk" and properly digest a long query.

This should leave you with 17 records!

The answer will be revealed in the slideshow! */

/* WRITE YOUR CODE BELOW HERE AND RUN IT. */


/* TO-DO FOUR. 
********************************************************************************
Dr. Doofenschmirtz went on a trip all around Alaska, observing conditions himself. 
He notes that the area of Chignik is very similar to his chosen area. However, 
if you look at the table, you'll notice there are a lot of Chignik communities:
Chignik Lake, Chignik, etc. 

HINT: you'll want to use the keyword LIKE, instead of =. 
For instance, if I was in a Disney database and wanted to find records 
for any mouse in the Micky Mouse series, I might perform this query:

SELECT * FROM Disney WHERE name LIKE '%Mouse'

The % is a placeholder. It means that any characters can come before the word 
in question. This way, we'll find records for Micky Mouse, Minnie Mouse, etc. 

BRAINSTORM with your groups how you might write this query. 

This should leave you with 5 records!

The answer will be revealed in the slideshow! */

/* WRITE YOUR CODE BELOW HERE AND RUN IT. */


/* TO-DO FIVE. 
********************************************************************************
Dr. Doofenschmirtz knows cost is very important to residents. 
The effective rate represents the difference between residential rate, 
or the original rate that customers are paying without PCE, and the PCE rate, or 
the new and reduced rate. 

A percent change can be calculated with the formula difference / original. 

Dr. Doofenschmirtz knows that there is a 40% reduction in the PCE rate 
from the original residential rate in his chosen community. He would like 
to find the single record that exactly matches that. 

Hint: Even though there is an exact 40% reduction, the computer stores numbers 
in pieces of information called bits. The numbers in this table are floating 
point numbers, which have limited storage. 

Thus, you can't query for = 0.4. You will need to round the calculation 
with the ROUND() function. 

Ex: ROUND(12.945, 2) will round to two decimal places. 

BRAINSTORM with your groups how you might write this query. 

This should leave you with TWO records!

The answer will be revealed in the slideshow! */

/* WRITE YOUR CODE BELOW HERE AND RUN IT. */




/* Congrats! You have identified the two records that can help 
Dr. Doofenschmirtz the most. Discuss with your groups. Which record, between the 
two, might represent a community that benefits more from renewables? Do you need 
any other information to make this decision? 


Thanks for following along! For questions, contact cathyhou@college.harvard.edu
Hope you enjoyed learnign SQLite!