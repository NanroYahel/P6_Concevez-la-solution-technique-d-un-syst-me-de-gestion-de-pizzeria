INSERT INTO Pizza (nom, prix)
VALUES ('MARGARITA', 9),
('ROMA', 10),
('REINE', 11);

INSERT INTO Ingredients (nom, poids)
VALUES ('tomate', 50),
('mozzarella', 100),
('jambon', 50),
('olives', 5),
('oeuf', 30);

INSERT INTO Recette (nom_pizza, ingredient_id, quantite)
VALUES ('MARGARITA', 1, 3),
('MARGARITA', 2, 2),
('MARGARITA', 4, 7),
('ROMA', 1, 3),
('ROMA', 2, 2),
('ROMA', 3, 2),
('ROMA', 4, 7),
('REINE', 1, 3),
('REINE', 2, 2),
('REINE', 3, 2),
('REINE', 4, 7),
('REINE', 5,1);

INSERT INTO Etablissement (nom, adresse)
VALUES ('GO COWS', 'South park, Colorado'),
('BRONCOS', 'Denver, Colorado')


INSERT INTO Employe (nom, prenom)
VALUES ('MARSH', 'Stan'),
('BROFLOVSKI', 'Kyle'),
('CARTMAN', 'Eric'),
('McCORMICK', 'Kenny');

INSERT INTO Preparateur (employe_id, etablissment_id)
VALUES (1,1),
(2,1)

INSERT INTO Livreur (employe_id, immatriculation_scooter)
VALUES (3, '666GAGA')

INSERT INTO Vendeur (employe_id, etablissment_id)
VALUES (4,1)

INSERT INTO Client (nom, prenom, adresse, email, motdepasse)
VALUES ('MARSH', 'Randy', '101 Main street, South Park, Colorado', 'randymarch@southpark.com', 'beer'),
('KERN', 'Jimbo', '112 Main street, South Park, COlorado', 'jimbokern@southpark.com', 'comingrightforus')


SELECT Ingredients.nom as nom_ingredient, Recette.quantite*Ingredients.poids FROM Recette
INNER JOIN Pizza ON Pizza.nom=Recette.nom_pizza
INNER JOIN Ingredients ON Ingredients.id=Recette.ingredient_id
WHERE nom_pizza = 'REINE';
