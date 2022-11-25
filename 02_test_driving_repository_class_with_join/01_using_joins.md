## Exercise One

Use the database music_library for the following exercises.

Use a JOIN query to select the id and title of all the albums from Taylor Swift.

You should get the following result set:

 id |  title   
----+----------
  6 | Lover
  7 | Folklore


```
SELECT albums.id,
     albums.title
    FROM albums
    JOIN artists
ON albums.artist_id = artists.id
WHERE artists.name = 'Taylor Swift';

```


## Exercise Two

Use a JOIN query to find the id and title of the (only) album from Pixies released in 1988.

You should get the following result set:

 id |    title    
----+-------------
  2 | Surfer Rosa

```
SELECT albums.id,
   		albums.title
FROM albums
	JOIN artists
	ON albums.artist_id = artists.id
WHERE
	artists.name = 'Pixies'
	AND albums.release_year = 1988;
```

## Challenge

Find the id and title of all albums from Nina Simone released after 1975.

You should get the following result set:

 album_id |       title        
----------+--------------------
        9 | Baltimore
       11 | Fodder on My Wings


```
SELECT albums.id,
   		albums.title
FROM albums
	JOIN artists
	ON albums.artist_id = artists.id
WHERE
	artists.name = 'Nina Simone'
	AND albums.release_year > 1975;
```
