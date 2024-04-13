-- Надайте приклади для перевірки функціональності вашої реалізації (виклики функцій/процедур, DML - INSERT, UPDATE і т.д.).
-- Приклади також для некоректних ситуацій (якщо умови команди не виконуються і виклики не повинні виконуватися).
-- Наприклад: якщо INSERT не відбувається - будь ласка, виконайте її.
-- Створіть тестову базу даних, яка буде частиною презентації, на якій ви будете представляти своє завдання.

INSERT INTO "Owners" ("name", "contact_phone", "contact_email", "address")
VALUES
  ('Jane Smith', '+9876543210', 'jane.smith@example.com', '456 Elm Street, Othertown'),
  ('Michael Johnson', '+1122334455', 'michael.johnson@example.com', '789 Oak Avenue, Anycity'),
  ('Emily Davis', '+9988776655', 'emily.davis@example.com', '101 Pine Road, Anothercity');

INSERT INTO "Categories" ("name", "description")
VALUES
  ('Painting', 'Artworks created by applying pigment to a surface.'),
  ('Pottery', 'Artworks made of clay and other materials, typically shaped while wet and then hardened by firing.'),
  ('Photography', 'Art of creating durable images by recording light.');

INSERT INTO "Rooms" ("name", "description")
VALUES
  ('Gallery Room 2', 'Another spacious room for art exhibitions.'),
  ('Lobby', 'The entrance area of the gallery.'),
  ('Small Gallery', 'A cozy space for intimate art displays.');

INSERT INTO "Control" ("control_date", "checked", "description", "shipping_date", "delivery_date")
VALUES
  ('2024-04-14T09:00:00Z', false, 'Pending check before shipping.', '2024-04-10T09:00:00Z', '2024-04-20T12:00:00Z'),
  ('2024-04-16T11:00:00Z', true, 'Checked before shipping.', '2024-04-10T08:00:00Z', '2024-04-20T12:00:00Z'),
  ('2024-04-19T10:00:00Z', true, 'Checked before shipping.', '2024-04-12T08:00:00Z', '2024-04-30T12:00:00Z');


INSERT INTO "Artifacts" ("name", "description", "control_id", "artifact_status")
VALUES
  ('Golden Mask', 'An ancient golden mask.', 3, 'on_display'),
  ('Still Life', 'A classic still life painting.', 4, 'in_transit'),
  ('Ceramic Vase', 'A modern ceramic vase.', 5, 'in_storage');

INSERT INTO "Exhibitions" ("name", "description", "exhibition_status", "start_date", "end_date")
VALUES
  ('Modern Art Showcase', 'Displaying contemporary artworks.', 'preparation', '2024-05-01T10:00:00Z', '2024-06-01T18:00:00Z'),
  ('Photography Exhibition', 'Showcasing captivating photographs.', 'preparation', '2024-05-10T10:00:00Z', '2024-06-10T18:00:00Z'),
  ('Pottery Collection', 'Featuring a variety of pottery pieces.', 'preparation', '2024-05-15T10:00:00Z', '2024-06-15T18:00:00Z');

INSERT INTO "ArtifactCategories" ("artifact_id", "category_id")
VALUES
  (7, 1),
  (8, 2),
  (9, 2);

INSERT INTO "Displayed_Artifacts" ("exhibition_id", "artifact_id", "room_id")
VALUES
  (1, 7, 1),
  (3, 9, 3);

INSERT INTO "Rental" ("artifact_id", "owner_id", "rental_status", "rental_date", "return_date")
VALUES
  (7, 2, 'borrowed', '2024-04-07T09:00:00Z', '2024-04-20T12:00:00Z'),
  (8, 3, 'lent', '2024-04-10T08:00:00Z', '2024-05-20T12:00:00Z'),
  (9, 1, 'owned', NULL, NULL);
-- TODO trigger on rent_date and return_date with shipping and delivery

