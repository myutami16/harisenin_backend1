CREATE OR REPLACE FUNCTION soft_delete_function()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        UPDATE ONLY TG_TABLE_NAME
        SET deleted_date = CURRENT_TIMESTAMP
        WHERE id = OLD.id;
        RETURN NULL;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER soft_delete_package_trigger
BEFORE DELETE ON "package"
FOR EACH ROW 
EXECUTE FUNCTION soft_delete_function();

CREATE TRIGGER soft_delete_order_trigger
BEFORE DELETE ON "order"
FOR EACH ROW 
EXECUTE FUNCTION soft_delete_function();

CREATE TRIGGER soft_delete_user_trigger
BEFORE DELETE ON "user"
FOR EACH ROW 
EXECUTE FUNCTION soft_delete_function();

CREATE TRIGGER soft_delete_payment_trigger
BEFORE DELETE ON "payment"
FOR EACH ROW 
EXECUTE FUNCTION soft_delete_function();

CREATE TRIGGER soft_delete_movie_trigger
BEFORE DELETE ON "movie"
FOR EACH ROW 
EXECUTE FUNCTION soft_delete_function();

CREATE TRIGGER soft_delete_series_trigger
BEFORE DELETE ON "series"
FOR EACH ROW 
EXECUTE FUNCTION soft_delete_function();

CREATE TRIGGER soft_delete_episode_trigger
BEFORE DELETE ON "episode"
FOR EACH ROW 
EXECUTE FUNCTION soft_delete_function();
