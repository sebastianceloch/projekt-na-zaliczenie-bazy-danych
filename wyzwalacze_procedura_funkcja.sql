DELIMITER $$
CREATE TRIGGER data_wysylki
BEFORE INSERT ON zamowienia
FOR EACH ROW
BEGIN
SET
new.data_wysylki = CURDATE();
END$$

DELIMITER $$
CREATE TRIGGER zamowienie BEFORE INSERT ON zamowienia
FOR EACH ROW
BEGIN
IF(new.Year(data_wysylki)<2020)
THEN
SIGNAL SQLSTATE '45000' SET message_text ='Zły rok';
END IF;
END$$

DELIMITER $$
CREATE PROCEDURE promocja(IN id INT)
BEGIN
UPDATE produkty
SET cena=cena*0.9
WHERE id_produktu=id;
END$$

SET GLOBAL
log_bin_trust_function_creators = 1;
DELIMITER $$
CREATE FUNCTION
ilosc_zamowien_z_miesiaca(x int)
RETURNS INT
BEGIN
SELECT
COUNT(id_zamowienia)
FROM zamowienia
WHERE month(data_wysylki)=x INTO x;
RETURN x;
END$$