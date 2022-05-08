DECLARE @itemid int, @name varchar(20), @desc varchar(400), @itemcount int, @price int, @price_sale int, @category varchar(1), @purchases int, @icon varchar(6), @isbundle int, @forsale int, @item1_id int, @item1_name varchar(75), @item1_count int, @item2_id int, @item2_name varchar(75), @item2_count int, @item3_id int, @item3_name varchar(75), @item3_count int, @item4_id int, @item4_name varchar(75), @item4_count int
-- -----------------------------------
/*    Author: [Dev]HoaX            */
/*    Date: 27.10.2013             */
/*    2013 - 2015 (c) Shaiya-SyFy  */
-- -----------------------------------

-- Bitte Beachten: [*] == Erforderliche Angaben

----------------------------------
/* Items im WebShop hinzufügen */
----------------------------------

-- [*] ItemID eingeben: 
SET @itemid = 100136
-- [*] Item Anzahl/Menge:
SET @itemcount = 1

-- [*] Item/Paket Name (max. 20 Zeichen):
SET @name = 'Stein der Namensänderung'
-- [*] Beschreibung des Items/Pakets: 
SET @desc = 'Ermöglicht das Ändern des Namens von einem deiner Spielfiguren.'

-- [*] Eigentlicher Preis:
SET @price = 500
-- Verkaufspreis:
SET @price_sale = ''

-- [*] Kategorie: 
--------------------------
--  "A": "Sonder Angebote"
-- 	 "D": "Upgrade"
-- 	 "G": "Charakter"
-- 	 "J": "Ausrüstung"
-- 	 "N": "Buffs"
-- 	 "R": "Lapis"
-- 	 "U": "Mounts"
-- 	 "X": "Andere"
--------------------------
-- Eine detaillierte Liste der zu verwendenden Buchstaben mit Unterkategorien: Menü.txt
SET @category = 'G'


-- [*] Item oder Paket Bild Endung: z.B. 10075_1.jpg - Bei 1 wäre es die Zahl nach dem Unterstrich "_1" [Standard: 1]
-- > Das Bild für das Item bzw. Paket darf nur maximal 40 x 40 Pixel groß sein und muss im .jpg Format gespeichert sein.
-- > Das Item/Paket Icon muss sich hier befinden: C:\xampp\htdocs\webmall1\images\items\
-- > Der Itemname setzt sich aus der ItemID und dem Image Wert zusammen (z.B. @ItemID = 10075 und @icon = 3 ergibt den Bildnamen: 10075_3.jpg)
SET @icon = 1


---------------------------------------------
/* Für ein Item Paket mit mehreren Items: */
---------------------------------------------

-- [*] Bei Item Paket verwenden: Wert auf 1 setzen [Standard: 0]
SET @isbundle = 0

-- Hier ItemID für das zweite Item im Paket eingeben
SET @item1_id = ''
-- Hier Item Name für das zweite Item im Paket eingeben
SET @item1_name = ''
-- Hier Item Anzahl für das zweite Item im Paket eingeben
SET @item1_count = ''

-- Drittes Item im Paket:
SET @item2_id = ''
SET @item2_name = ''
SET @item2_count = ''

-- Viertes Item im Paket:
SET @item3_id = ''
SET @item3_name = ''
SET @item3_count = ''

-- Fünftes Item im Paket
SET @item4_id = ''
SET @item4_name = ''
SET @item4_count = ''



-- [*] Anzahl der verkauften Items: (Sollte so stehen bleiben) [Standard: 0]
SET @purchases = 0

-- [*] Im Web Shop anzeigen lassen: 1 Ja / 0 Nein [Standard: 1]
SET @forsale = 1

-- ----------------------------------------------------------

SET @name = replace(@name,'Ä','&Auml;');
SET @name = replace(@name,'Ö','&Ouml;');
SET @name = replace(@name,'Ü','&Uuml;');
SET @name = replace(@name,'ä','&auml;');
SET @name = replace(@name,'ö','&ouml;');
SET @name = replace(@name,'ü','&uuml;');
SET @name = replace(@name,'ß','&szlig;');

SET @desc = replace(@desc,'Ä','&Auml;');
SET @desc = replace(@desc,'Ö','&Ouml;');
SET @desc = replace(@desc,'Ü','&Uuml;');
SET @desc = replace(@desc,'ä','&auml;');
SET @desc = replace(@desc,'ö','&ouml;');
SET @desc = replace(@desc,'ü','&uuml;');
SET @desc = replace(@desc,'ß','&szlig;');


INSERT INTO WEB_Page.dbo.PREMIUM_SHOP_TBL 
			(itemid, [name], [desc], itemcount, price, price_sale, category, purchases, [image], isbundle, forsale, item1_id, item1_name, item1_count, item2_id, item2_name, item2_count, item3_id, item3_name, item3_count, item4_id, item4_name, item4_count )
	VALUES 
			(@itemid, @name, @desc, @itemcount, @price, @price_sale, @category, @purchases, @icon, @isbundle, @forsale, @item1_id, @item1_name, @item1_count, @item2_id, @item2_name, @item2_count, @item3_id, @item3_name, @item3_count, @item4_id, @item4_name, @item4_count )