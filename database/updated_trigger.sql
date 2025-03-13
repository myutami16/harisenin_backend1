CREATE OR REPLACE FUNCTION update_updated_date()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_date = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_user
BEFORE UPDATE ON "user"
FOR EACH ROW
EXECUTE FUNCTION update_updated_date();

CREATE TRIGGER trigger_update_package
BEFORE UPDATE ON "package"
FOR EACH ROW
EXECUTE FUNCTION update_updated_date();

CREATE TRIGGER trigger_update_order
BEFORE UPDATE ON "order"
FOR EACH ROW
EXECUTE FUNCTION update_updated_date();

CREATE TRIGGER trigger_update_payment
BEFORE UPDATE ON "payment"
FOR EACH ROW
EXECUTE FUNCTION update_updated_date();

CREATE TRIGGER trigger_update_watchlist
BEFORE UPDATE ON "watchlist"
FOR EACH ROW
EXECUTE FUNCTION update_updated_date();

CREATE TRIGGER trigger_update_episode
BEFORE UPDATE ON "episode"
FOR EACH ROW
EXECUTE FUNCTION update_updated_date();

