CREATE TABLE profile_image_cache (
    user text PRIMARY KEY,
    etag text,
    image blob,
    last_modified timestamp,
    last_updated timestamp
);
