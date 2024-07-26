erDiagram
    FILES {
        INT id PK "Primary Key"
        VARCHAR name "File Name"
        VARCHAR mime_type "MIME Type"
        VARCHAR key_ "Unique Key"
        TEXT url "File URL"
        TIMESTAMP created_at "Creation Timestamp"
        TIMESTAMP updated_at "Update Timestamp"
    }

    USERS {
        INT id PK "Primary Key"
        VARCHAR username "Username"
        VARCHAR first_name "First Name"
        VARCHAR last_name "Last Name"
        VARCHAR email "Email"
        VARCHAR password "Password"
        INT avatar "Avatar File ID"
        TIMESTAMP created_at "Creation Timestamp"
        TIMESTAMP updated_at "Update Timestamp"
    }

    COUNTRY {
        INT id PK "Primary Key"
        VARCHAR name "Country Name"
    }

    PERSON {
        INT id PK "Primary Key"
        VARCHAR first_name "First Name"
        VARCHAR last_name "Last Name"
        TEXT biography "Biography"
        DATE date_of_birth "Date of Birth"
        CHAR gender "Gender"
        INT country_id "Country ID"
        INT primary_image "Primary Image File ID"
        TIMESTAMP created_at "Creation Timestamp"
        TIMESTAMP updated_at "Update Timestamp"
    }

    MOVIE {
        INT id PK "Primary Key"
        VARCHAR title "Movie Title"
        TEXT description "Description"
        NUMERIC budget "Budget"
        DATE release_date "Release Date"
        INT duration "Duration"
        INT director "Director ID"
        INT country_id "Country ID"
        INT poster "Poster File ID"
        TIMESTAMP created_at "Creation Timestamp"
        TIMESTAMP updated_at "Update Timestamp"
    }

    CHARACTERS {
        INT id PK "Primary Key"
        VARCHAR name "Character Name"
        TEXT description "Description"
        VARCHAR role "Role"
        INT actor "Actor ID"
        INT movie_id "Movie ID"
        TIMESTAMP created_at "Creation Timestamp"
        TIMESTAMP updated_at "Update Timestamp"
    }

    GENRE {
        INT id PK "Primary Key"
        VARCHAR name "Genre Name"
        TIMESTAMP created_at "Creation Timestamp"
        TIMESTAMP updated_at "Update Timestamp"
    }

    MOVIEGENRE {
        INT movie_id "Movie ID"
        INT genre_id "Genre ID"
        TIMESTAMP created_at "Creation Timestamp"
        TIMESTAMP updated_at "Update Timestamp"
    }

    FAVORITES {
        INT person_id "Person ID"
        INT movie_id "Movie ID"
        DATE added_date "Added Date"
        TIMESTAMP created_at "Creation Timestamp"
        TIMESTAMP updated_at "Update Timestamp"
    }

    PHOTO {
        INT person_id "Person ID"
        INT file_id "File ID"
        TIMESTAMP created_at "Creation Timestamp"
        TIMESTAMP updated_at "Update Timestamp"
    }

    FILES ||--o| USERS : "avatar"
    FILES ||--o| PERSON : "primary_image"
    COUNTRY ||--o| PERSON : "country_id"
    FILES ||--o| MOVIE : "poster"
    PERSON ||--o| MOVIE : "director"
    COUNTRY ||--o| MOVIE : "country_id"
    MOVIE ||--o| CHARACTERS : "movie_id"
    PERSON ||--o| CHARACTERS : "actor"
    MOVIE ||--o| MOVIEGENRE : "movie_id"
    GENRE ||--o| MOVIEGENRE : "genre_id"
    PERSON ||--o| FAVORITES : "person_id"
    MOVIE ||--o| FAVORITES : "movie_id"
    PERSON ||--o| PHOTO : "person_id"
    FILES ||--o| PHOTO : "file_id"