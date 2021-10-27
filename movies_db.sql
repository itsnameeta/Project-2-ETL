-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [IMDB_movies] (
    [imdb_ID] varchar  NOT NULL ,
    [movie_title] varchar  NOT NULL ,
    [year_released] int  NOT NULL ,
    [genre] varchar  NOT NULL ,
    [country] varchar  NOT NULL ,
    [avg_vote] float  NOT NULL ,
    [worldwide_gross_income] varchar  NOT NULL ,
    [reviews_from_users] float  NOT NULL ,
    [reviews_from_critics] float  NOT NULL ,
    CONSTRAINT [PK_IMDB_movies] PRIMARY KEY CLUSTERED (
        [imdb_ID] ASC,[movie_title] ASC
    )
)

CREATE TABLE [IMDB_ratings] (
    [imdb_ID] varchar  NOT NULL ,
    [imdb_rating] float  NOT NULL ,
    [total_votes] int  NOT NULL ,
    CONSTRAINT [PK_IMDB_ratings] PRIMARY KEY CLUSTERED (
        [imdb_ID] ASC
    )
)

CREATE TABLE [Golden_globe] (
    [golden_globeID] int  NOT NULL ,
    [movie_title] varchar  NOT NULL ,
    [nominee] varchar  NOT NULL ,
    [year_released] int  NOT NULL ,
    [year_awarded] int  NOT NULL ,
    [category] varchar  NOT NULL ,
    [win] boolean  NOT NULL ,
    CONSTRAINT [PK_Golden_globe] PRIMARY KEY CLUSTERED (
        [golden_globeID] ASC,[nominee] ASC
    )
)

ALTER TABLE [IMDB_ratings] WITH CHECK ADD CONSTRAINT [FK_IMDB_ratings_imdb_ID] FOREIGN KEY([imdb_ID])
REFERENCES [IMDB_movies] ([imdb_ID])

ALTER TABLE [IMDB_ratings] CHECK CONSTRAINT [FK_IMDB_ratings_imdb_ID]

ALTER TABLE [Golden_globe] WITH CHECK ADD CONSTRAINT [FK_Golden_globe_movie_title] FOREIGN KEY([movie_title])
REFERENCES [IMDB_movies] ([movie_title])

ALTER TABLE [Golden_globe] CHECK CONSTRAINT [FK_Golden_globe_movie_title]

COMMIT TRANSACTION QUICKDBD