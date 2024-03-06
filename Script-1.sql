-- Таблица "Исполнитель"
CREATE TABLE IF NOT EXISTS Artist (
  ArtistID SERIAL PRIMARY KEY,
  Name VARCHAR(255)
);

-- Таблица "Жанр"
CREATE TABLE IF NOT EXISTS Genre (
  GenreID SERIAL PRIMARY KEY,
  Name VARCHAR(255)
);

-- Таблица "Альбом"
CREATE TABLE IF NOT EXISTS Album (
  AlbumID SERIAL PRIMARY KEY,
  Title VARCHAR(255),
  ReleaseYear INT
);

-- Таблица "Трек"
CREATE TABLE IF NOT EXISTS Track (
  TrackID SERIAL PRIMARY KEY,
  Title VARCHAR(255),
  AlbumID INT,
  FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID)
);

-- Таблица "Сборник"
CREATE TABLE IF NOT EXISTS Compilation (
  CompilationID SERIAL PRIMARY KEY,
  Title VARCHAR(255),
  ReleaseYear INT
);

-- Таблица "Трек в сборнике"
CREATE TABLE IF NOT EXISTS TrackInCompilation (
  TrackID INT,
  CompilationID INT,
  FOREIGN KEY (TrackID) REFERENCES Track(TrackID),
  FOREIGN KEY (CompilationID) REFERENCES Compilation(CompilationID),
  PRIMARY KEY (TrackID, CompilationID)
);

-- Таблица "Исполнитель по жанру"
CREATE TABLE IF NOT EXISTS ArtistGenre (
  ArtistID INT,
  GenreID INT,
  FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
  FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
  PRIMARY KEY (ArtistID, GenreID)
);

-- Таблица "Альбом исполнителя"
CREATE TABLE IF NOT EXISTS AlbumArtist (
  AlbumID INT,
  ArtistID INT,
  FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID),
  FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
  PRIMARY KEY (AlbumID, ArtistID)
);
