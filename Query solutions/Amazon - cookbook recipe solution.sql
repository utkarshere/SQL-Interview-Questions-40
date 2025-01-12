SELECT * FROM cookbook_titles;

 WITH LEFT_PAGES AS (
 SELECT page_number,title FROM cookbook_titles WHERE page_number % 2 = 0), 
 RIGHT_PAGES AS (
 SELECT page_number,title FROM cookbook_titles WHERE page_number % 2 = 1)
 SELECT LEFT_PAGES.page_number AS left_page_number,LEFT_PAGES.title AS left_title,
 RIGHT_PAGES.title AS right_title
 FROM LEFT_PAGES LEFT JOIN RIGHT_PAGES ON
 LEFT_PAGES.page_number + 1 = RIGHT_PAGES.page_number
 ORDER BY
 LEFT_PAGES.page_number;