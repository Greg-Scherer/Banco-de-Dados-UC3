/* SpotifyLogico: */

CREATE TABLE User (
    User_ID Number PRIMARY KEY,
    Subscription_type String,
    Address String,
    Register_Date Date,
    Password String,
    Email String,
    Name String
);

CREATE TABLE Content (
    Content_ID Number,
    Title String,
    Duration Time,
    Launch_Date Date,
    Type String,
    Music_ID Number,
    Lyrics String,
    Podcast_ID Number,
    Description String,
    Content_TIPO String,
    fk_Artist_Artist_ID Number,
    fk_Album_Album_ID Number,
    PRIMARY KEY (Content_ID, Music_ID, Podcast_ID)
);

CREATE TABLE Artist (
    Artist_ID Number PRIMARY KEY,
    Starting_Date Date,
    Biography String,
    Country String,
    Name String
);

CREATE TABLE Album (
    Album_ID Number PRIMARY KEY,
    Launch_Date Date,
    Name String,
    fk_Artist_Artist_ID Number
);

CREATE TABLE Genre (
    Genre_ID Number PRIMARY KEY,
    Genre String,
    Description String,
    fk_Content_Content_ID Number,
    fk_Content_Music_ID Number,
    fk_Content_Podcast_ID Number
);

CREATE TABLE Episode (
    Episode_ID Number PRIMARY KEY,
    Description String,
    Release_Date String,
    Duration Time,
    Title String,
    fk_Content_Content_ID Number,
    fk_Content_Music_ID Number,
    fk_Content_Podcast_ID Number
);

CREATE TABLE PlaylistContent_Have (
    Name String,
    Creation_Date Date,
    Privacity String,
    Playlist_ID Number PRIMARY KEY,
    fk_Content_Content_ID Number,
    fk_Content_Music_ID Number,
    fk_Content_Podcast_ID Number,
    fk_User_User_ID Number
);
 
ALTER TABLE Content ADD CONSTRAINT FK_Content_2
    FOREIGN KEY (fk_Artist_Artist_ID)
    REFERENCES Artist (Artist_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Content ADD CONSTRAINT FK_Content_3
    FOREIGN KEY (fk_Album_Album_ID)
    REFERENCES Album (Album_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Album ADD CONSTRAINT FK_Album_2
    FOREIGN KEY (fk_Artist_Artist_ID)
    REFERENCES Artist (Artist_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Genre ADD CONSTRAINT FK_Genre_2
    FOREIGN KEY (fk_Content_Content_ID, fk_Content_Music_ID, fk_Content_Podcast_ID)
    REFERENCES Content (Content_ID, Music_ID, Podcast_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Episode ADD CONSTRAINT FK_Episode_2
    FOREIGN KEY (fk_Content_Content_ID, fk_Content_Music_ID, fk_Content_Podcast_ID)
    REFERENCES Content (Content_ID, Music_ID, Podcast_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE PlaylistContent_Have ADD CONSTRAINT FK_PlaylistContent_Have_2
    FOREIGN KEY (fk_Content_Content_ID, fk_Content_Music_ID, fk_Content_Podcast_ID)
    REFERENCES Content (Content_ID, Music_ID, Podcast_ID);
 
ALTER TABLE PlaylistContent_Have ADD CONSTRAINT FK_PlaylistContent_Have_3
    FOREIGN KEY (fk_User_User_ID)
    REFERENCES User (User_ID);