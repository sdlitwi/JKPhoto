This is a simple web application I developed for personal use, but there are many components that others may find useful, especially if they are just starting out with .Net,MVC,C#,or Javascript.

Basic Usage:

JKPhoto expects a SQL database (using the included scripts) to store Portfolio metadata. 

Simply add a directory named 'Portfolio" with subfolders containing each Album with the desired album name.

Each Album expects a JPG image named "cover.jpg" which is used to display the album covers within the Portfolio view.

passing the URL parameter "updatephotos = true" within the Portfolio view will update the database metadata with information
obtained from the Portfolio folder. New photos will be added and displayed or vice versa within the portfolio and album views.



