CREATE OR REPLACE FUNCTION ex7_helpers.fn_idade()
RETURNS TRIGGER AS $$
BEGIN
    NEW.idade := EXTRACT(YEAR FROM AGE(NEW.data_nascimento));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;