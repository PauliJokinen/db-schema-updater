
-- Create table:
-- This fails on purpose, because the table with same name exists!!!!
CREATE TABLE hei(
  transaction uuid,
  price numeric,
  transfer_date date,
  postcode text,
  property_type char(1),
  newly_built boolean,
  duration char(1),
  paon text,
  saon text,
  street text,
  locality text,
  city text,
  district text,
  county text,
  ppd_category_type char(1),
  record_status char(1));

-- Copy CSV data, with appropriate munging:
-- COPY land_registry_price_paid_uk FROM '/path/to/pp-complete.csv' with (format csv, encoding 'win1252', header false, null '', quote '"', force_null (postcode, saon, paon, street, locality, city, district));
