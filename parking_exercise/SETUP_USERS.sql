USE ROLE USERADMIN;

CREATE USER IF NOT EXISTS parking_user
    PASSWORD = 'parking_user_password123'
    DEFAULT_WAREHOUSE = parking_wh;