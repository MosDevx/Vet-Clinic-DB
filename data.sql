/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts,neutered,weight_kg) VALUES ('Agumon','2020-02-03',0,true,'10.23');

INSERT INTO animals (name, date_of_birth, escape_attempts,neutered,weight_kg) VALUES ('Gabumon','2018-11-15',2,true,'8');

INSERT INTO animals (name, date_of_birth, escape_attempts,neutered,weight_kg) VALUES ('Pikachu','2021-01-7',1,false,'15.04');


INSERT INTO animals (name, date_of_birth, escape_attempts,neutered,weight_kg) VALUES ('Devimon','2017-05-12',5,true,'11');

-- From branch query-and-update 
-- Add additional data to populate the database

INSERT INTO animals (name, date_of_birth, weight_kg,neutered,escape_attempts) VALUES ('Charmander', '2020-02-8', -11,false,0);

INSERT INTO animals (name, date_of_birth, weight_kg,neutered,escape_attempts) VALUES ('Plantmon', '2021-11-15', -5.7,true,2);

INSERT INTO animals (name, date_of_birth, weight_kg,neutered,escape_attempts) VALUES ('Squirtle', '1993-04-02', -12.13,false,3);

INSERT INTO animals (name, date_of_birth, weight_kg,neutered,escape_attempts) VALUES ('Angemon', '2005-06-12', -45,true,1);

INSERT INTO animals (name, date_of_birth, weight_kg,neutered,escape_attempts) VALUES ('Boarmon', '2005-06-07', 20.4,true,7);

INSERT INTO animals (name, date_of_birth, weight_kg,neutered,escape_attempts) VALUES ('Blossom', '1998-10-13', 17,true,3);

INSERT INTO animals (name, date_of_birth, weight_kg,neutered,escape_attempts) VALUES ('Ditto', '2022-05-14', 22,true,4);

-- from branch multiple-tables
-- add data and fk relationships to populate the database

INSERT INTO owners(full_name,age) VALUES('Sam Smith',34) , ('Jennifer Orwell', 19), ('Bob',45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES('Pokemon'), ('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon' ) WHERE name LIKE '%mon';

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon' ) WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith' ) WHERE name='Agumon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Jennifer Orwell' ) WHERE name='Gabumon' OR name='Pikachu';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Bob' ) WHERE name='Devimon' OR name='Plantmon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Melody Pond' ) WHERE name='Charmander' OR name='Squirtle' OR name='Blossom';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Dean Winchester' ) WHERE name='Angemon' OR name='Boarmon';


-- add data for vets , visits and specialations

INSERT INTO vets (name,age,date_of_graduation) VALUES ('William Tatcher',45, '2000-04-23'), ('Maisy Smith',26,'2019-01-17'), ('Stephanie Mendez', 64, '1981-05-04'), ('Jack Harkness',38, '2008-06-08');

INSERT INTO specializations (vet_id,species_id) VALUES ( (SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name='Pokemon') );
INSERT INTO specializations (vet_id, species_id) VALUES ( (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name='Digimon') );
INSERT INTO specializations (vet_id, species_id) VALUES ( (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name='Pokemon') );
INSERT INTO specializations (vet_id, species_id) VALUES ( (SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name='Digimon') );


INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Agumon'),(SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-14');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Agumon'),(SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Gabumon'),(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Pikachu'),(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05');

INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Pikachu'),(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08');

INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Pikachu'),(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14');



INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Devimon'),(SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Charmander'),(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Plantmon'),(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Plantmon'),(SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Plantmon'),(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Squirtle'),(SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Angemon'),(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Angemon'),(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Boarmon'),(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Boarmon'),(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Boarmon'),(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Boarmon'),(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Blossom'),(SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24');
INSERT INTO visits (animal_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name='Blossom'),(SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');
