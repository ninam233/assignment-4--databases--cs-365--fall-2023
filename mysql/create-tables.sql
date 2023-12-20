CREATE TABLE IF NOT EXISTS artist (
  artist_id   INT          NOT NULL,
  artist_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (artist_id)
);

CREATE TABLE IF NOT EXISTS album (
  artist_id  INT          NOT NULL,
  album_id   INT          NOT NULL,
  album_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (artist_id, album_id),
  INDEX idx_album_id (album_id),
  INDEX idx_album_name (album_name)
);

CREATE TABLE IF NOT EXISTS track (
  artist_id  INT          NOT NULL,
  album_id   INT          NOT NULL,
  track_id   INT          NOT NULL,
  track_name VARCHAR(128) NOT NULL,
  time       DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (artist_id, album_id, track_id),
  INDEX idx_track_id (track_id),
  INDEX idx_track_name (track_name),
  INDEX idx_track_artist_id (artist_id)
);

CREATE TABLE IF NOT EXISTS played (
  played     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (played),
  INDEX idx_played_time (played)
);

CREATE TABLE IF NOT EXISTS compiles (
  artist_id INT NOT NULL,
  album_id  INT NOT NULL,
  PRIMARY KEY (artist_id, album_id),
  FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
  FOREIGN KEY (album_id) REFERENCES album (album_id)
);

CREATE TABLE IF NOT EXISTS contains (
  artist_id INT NOT NULL,
  album_id  INT NOT NULL,
  track_id  INT NOT NULL,
  PRIMARY KEY (artist_id, album_id, track_id),
  FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
  FOREIGN KEY (album_id) REFERENCES album (album_id),
  FOREIGN KEY (track_id) REFERENCES track (track_id)
);

CREATE TABLE IF NOT EXISTS was_played_at (
  played   TIMESTAMP    NOT NULL,
  track_id INT NOT NULL,
  PRIMARY KEY (played),
  FOREIGN KEY (track_id) REFERENCES track (track_id)
);
