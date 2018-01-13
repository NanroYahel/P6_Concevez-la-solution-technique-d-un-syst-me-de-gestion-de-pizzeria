-- Insert pizzas and price
INSERT INTO Pizza (nom, prix)
VALUES ('MARGARITA', 9),
('ROMA', 10),
('REINE', 11);

-- Insert ingredients and portion weight
INSERT INTO Ingredient (nom, poids)
VALUES ('tomate', 50),
('mozzarella', 100),
('jambon', 50),
('olives', 5),
('oeuf', 30);

-- // INSERT RECIPE FOR EACH PIZZA // 

-- Insert 'MARGARITA' recipe
INSERT INTO Recette (nom_pizza, ingredient_id, quantite)
SELECT 'MARGARITA', id AS ingredient_id, 3
FROM Ingredient WHERE nom='tomate'
UNION
SELECT 'MARGARITA', id AS ingredient_id, 2
FROM Ingredient WHERE nom='mozzarella'
UNION
SELECT 'MARGARITA', id AS ingredient_id, 7
FROM Ingredient WHERE nom='olives';

-- Insert 'ROMA' recipe
INSERT INTO Recette (nom_pizza, ingredient_id, quantite)
SELECT 'ROMA', id AS ingredient_id, 3
FROM Ingredient WHERE nom='tomate'
UNION
SELECT 'ROMA', id AS ingredient_id, 2
FROM Ingredient WHERE nom='mozzarella'
UNION
SELECT 'ROMA', id AS ingredient_id, 2
FROM Ingredient WHERE nom='jambon'
UNION
SELECT 'ROMA', id AS ingredient_id, 7
FROM Ingredient WHERE nom='olives';

-- Insert 'REINE' recipe
INSERT INTO Recette (nom_pizza, ingredient_id, quantite)
SELECT 'REINE', id AS ingredient_id, 3
FROM Ingredient WHERE nom='tomate'
UNION
SELECT 'REINE', id AS ingredient_id, 2
FROM Ingredient WHERE nom='mozzarella'
UNION
SELECT 'REINE', id AS ingredient_id, 2
FROM Ingredient WHERE nom='jambon'
UNION
SELECT 'REINE', id AS ingredient_id, 7
FROM Ingredient WHERE nom='olives'
UNION
SELECT 'REINE', id AS ingredient_id, 1
FROM Ingredient WHERE nom='oeuf';


-- Insert Shops
INSERT INTO Etablissement (nom, adresse)
VALUES ('GO COWS', 'South park, Colorado'),
('BRONCOS', 'Denver, Colorado');


-- // INSERT STOCK FOR EACH SHOP //

-- Insert stock in 'GO COWS' shop
INSERT INTO Stock (ingredient_id, etablissement_id, quantite)
SELECT Ingredient.id AS ingredient_id, Etablissement.id AS etablissement_id, 97
FROM Ingredient
CROSS JOIN Etablissement
WHERE Ingredient.nom='tomate' AND Etablissement.nom='GO COWS'
UNION
SELECT Ingredient.id AS ingredient_id, Etablissement.id AS etablissement_id, 98
FROM Ingredient
CROSS JOIN Etablissement
WHERE Ingredient.nom='mozzarella' AND Etablissement.nom='GO COWS'
UNION
SELECT Ingredient.id AS ingredient_id, Etablissement.id AS etablissement_id, 98
FROM Ingredient
CROSS JOIN Etablissement
WHERE Ingredient.nom='jambon' AND Etablissement.nom='GO COWS'
UNION
SELECT Ingredient.id AS ingredient_id, Etablissement.id AS etablissement_id, 93
FROM Ingredient
CROSS JOIN Etablissement
WHERE Ingredient.nom='olives' AND Etablissement.nom='GO COWS'
UNION
SELECT Ingredient.id AS ingredient_id, Etablissement.id AS etablissement_id, 100
FROM Ingredient
CROSS JOIN Etablissement
WHERE Ingredient.nom='oeuf' AND Etablissement.nom='GO COWS';

-- Insert stock in 'BRONCOS' shop
INSERT INTO Stock (ingredient_id, etablissement_id, quantite)
SELECT Ingredient.id AS ingredient_id, Etablissement.id AS etablissement_id, 97
FROM Ingredient
CROSS JOIN Etablissement
WHERE Ingredient.nom='tomate' AND Etablissement.nom='BRONCOS'
UNION
SELECT Ingredient.id AS ingredient_id, Etablissement.id AS etablissement_id, 98
FROM Ingredient
CROSS JOIN Etablissement
WHERE Ingredient.nom='mozzarella' AND Etablissement.nom='BRONCOS'
UNION
SELECT Ingredient.id AS ingredient_id, Etablissement.id AS etablissement_id, 98
FROM Ingredient
CROSS JOIN Etablissement
WHERE Ingredient.nom='jambon' AND Etablissement.nom='BRONCOS'
UNION
SELECT Ingredient.id AS ingredient_id, Etablissement.id AS etablissement_id, 93
FROM Ingredient
CROSS JOIN Etablissement
WHERE Ingredient.nom='olives' AND Etablissement.nom='BRONCOS'
UNION
SELECT Ingredient.id AS ingredient_id, Etablissement.id AS etablissement_id, 99
FROM Ingredient
CROSS JOIN Etablissement
WHERE Ingredient.nom='oeuf' AND Etablissement.nom='BRONCOS';

-- Insert Employees 
INSERT INTO Employe (nom, prenom)
VALUES ('MARSH', 'Stan'),
('BROFLOVSKI', 'Kyle'),
('CARTMAN', 'Eric'),
('McCORMICK', 'Kenny');

-- // INSERT EMPLOYEES IN EACH 'ROLE' TABLE //

-- Insert preparators
INSERT INTO Preparateur (employe_id, etablissement_id)
SELECT Employe.id AS employe_id, Etablissement.id AS etablissement_id
FROM Employe
CROSS JOIN Etablissement
WHERE Employe.nom ='MARSH' AND Etablissement.nom='GO COWS'
UNION
SELECT Employe.id AS employe_id, Etablissement.id AS etablissement_id
FROM Employe
CROSS JOIN Etablissement
WHERE Employe.nom ='BROFLOVSKI' AND Etablissement.nom='BRONCOS';

-- Insert delivery men
INSERT INTO Livreur (employe_id, immatriculation_scooter)
SELECT Employe.id AS employe_id, '666GAGA'
FROM Employe WHERE nom='CARTMAN';

-- Insert sellers
INSERT INTO Vendeur (employe_id, etablissement_id)
SELECT Employe.id AS employe_id, Etablissement.id AS etablissement_id
FROM Employe
CROSS JOIN Etablissement
WHERE Employe.nom ='McCORMICK' AND Etablissement.nom='GO COWS';

-- Insert clients for test
INSERT INTO Client (nom, prenom, adresse, email, motdepasse)
VALUES ('MARSH', 'Randy', '101 Main street, South Park, Colorado', 'randymarch@southpark.com', 'beer'),
('KERN', 'Jimbo', '112 Main street, South Park, Colorado', 'jimbokern@southpark.com', 'comingrightforus');

-- Insert artificial orders
INSERT INTO Commande (date, statut, nom_pizza, client_id, preparateur_id, livreur_id, vendeur_id)
SELECT date '2018-01-03', 'LIVREE', 'REINE', Client.id AS client_id, Preparateur.employe_id, Livreur.employe_id, Vendeur.employe_id
FROM Employe 
CROSS JOIN Client
INNER JOIN Preparateur ON Preparateur.employe_id=Employe.id
CROSS JOIN Livreur 
CROSS JOIN Vendeur
WHERE Client.nom='MARSH' AND Preparateur.employe_id = 
(SELECT Preparateur.employe_id FROM Preparateur INNER JOIN Employe ON Employe.id=Preparateur.employe_id WHERE Employe.nom='BROFLOVSKI') 
AND Livreur.employe_id=
(SELECT Livreur.employe_id FROM Livreur INNER JOIN Employe ON Employe.id=Livreur.employe_id WHERE Employe.nom='CARTMAN')
AND Vendeur.employe_id=
(SELECT Vendeur.employe_id FROM Vendeur INNER JOIN Employe ON Employe.id=Vendeur.employe_id WHERE Employe.nom='McCORMICK')
UNION
SELECT date '2018-01-03', 'LIVREE', 'REINE', Client.id AS client_id, Preparateur.employe_id, Livreur.employe_id, NULL
FROM Employe 
CROSS JOIN Client
INNER JOIN Preparateur ON Preparateur.employe_id=Employe.id
CROSS JOIN Livreur 
CROSS JOIN Vendeur
WHERE Client.nom='KERN' AND Preparateur.employe_id = 
(SELECT Preparateur.employe_id FROM Preparateur INNER JOIN Employe ON Employe.id=Preparateur.employe_id WHERE Employe.nom='MARSH') 
AND Livreur.employe_id=
(SELECT Livreur.employe_id FROM Livreur INNER JOIN Employe ON Employe.id=Livreur.employe_id WHERE Employe.nom='CARTMAN');

-- Insert artificial invoices
INSERT INTO Facture (montant_total, type_paiement, numero_commande)
SELECT Pizza.prix AS Prix, 'CB', Commande.numero_commande AS numero_commande
FROM Commande
INNER JOIN Client ON Client.id=Commande.client_id
INNER JOIN Pizza ON Pizza.nom=Commande.nom_pizza
WHERE Client.nom='MARSH';