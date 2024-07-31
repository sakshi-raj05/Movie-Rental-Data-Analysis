# Movie On Rent: Rental Trends Analysis

Movie On Rent, a leading chain of movie rental stores, takes pride in its extensive collection of movies available in both DVD and Blu-ray formats. As part of its commitment to enhancing customer satisfaction, the management is keen on analyzing the rental trends to understand which types of movies are in high demand. By delving into the preferred genres and the actors who appear in these popular films, Movie On Rent aims to curate its inventory to align with the audience's preferences, ensuring a more enjoyable and tailored movie rental experience for its valued customers. Through this data-driven approach, Movie On Rent aspires to elevate its business by consistently providing the movies that resonate most with its diverse customer base.

## Database Description

Here is a description of the dataset's main components:

- **Film**: This table includes information about individual movies available for rental. It contains columns such as film id, title, description, release year, rental duration, rental rate, replacement cost, and rating.
- **Actor**: This table contains details about actors who have appeared in various movies. The columns include actor id, first name, and last name.
- **Film Actor**: This table establishes the relationship between movies and actors, indicating which actors appeared in which films. It has columns such as actor id and film id.
- **Category**: This table lists the categories or genres to which movies belong. It includes columns like category id and name.
- **Film Category**: This table links films to their respective categories, indicating the genres to which each movie belongs. It contains columns like film id and category id.

## Implementation

The implementation involved writing SQL queries to retrieve and manipulate data from the database. 
