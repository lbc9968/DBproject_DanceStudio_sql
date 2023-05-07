INSERT INTO DanceStudio.employees (`name`, `address`, `salary`) VALUES
('Roland Mendel', 'C/ Araquil, 67, Madrid', 5000),
('Victoria Ashworth', '35 King George, London', 6500),
('Martin Blank', '25, Rue Lauriston, Paris', 8000);

INSERT INTO DanceStudio.dance_style (style_name) Values ('Ballroom');
INSERT INTO DanceStudio.dance_style (style_name) Values ('African');
INSERT INTO DanceStudio.dance_style (style_name) Values ('American');
INSERT INTO DanceStudio.dance_style (style_name) Values ('Latin');
INSERT INTO DanceStudio.dance_style (style_name) Values ('Modern');
INSERT INTO DanceStudio.dance_style (style_name) Values ('Indian');
INSERT INTO DanceStudio.dance_style (style_name) Values ('Western');

INSERT INTO DanceStudio.dance_class (class_name,level,style_id,fees) VALUES ('Ballet',1,1,30);
INSERT INTO DanceStudio.dance_class (class_name,level,style_id,fees) VALUES ('Belly',1,2,25);
INSERT INTO DanceStudio.dance_class (class_name,level,style_id,fees) VALUES ('Hip-hop',1,3,40); 
INSERT INTO DanceStudio.dance_class (class_name,level,style_id,fees) VALUES ('Breaking',1,3,45); 
INSERT INTO DanceStudio.dance_class (class_name,level,style_id,fees) VALUES ('Folk',1,5,35); 
INSERT INTO DanceStudio.dance_class (class_name,level,style_id,fees) VALUES ('Salsa',1,4,55); 
INSERT INTO DanceStudio.dance_class (class_name,level,style_id,fees) VALUES ('Kuchipudi',1,6,70);
INSERT INTO DanceStudio.dance_class (class_name,level,style_id,fees) VALUES ('Bharata Natyam',1,6,70); 
INSERT INTO DanceStudio.dance_class (class_name,level,style_id,fees) VALUES ('Disco',1,7,60);

INSERT INTO DanceStudio.studio_room (room_name,max_capacity) VALUES ('101',20);
INSERT INTO DanceStudio.studio_room (room_name,max_capacity) VALUES ('102',30);
INSERT INTO DanceStudio.studio_room (room_name,max_capacity) VALUES ('103',20);
INSERT INTO DanceStudio.studio_room (room_name,max_capacity) VALUES ('104',50);
INSERT INTO DanceStudio.studio_room (room_name,max_capacity) VALUES ('105',40);


INSERT INTO DanceStudio.class_status (status_name) VALUES ('Active');
INSERT INTO DanceStudio.class_status (status_name) VALUES ('Completed');
INSERT INTO DanceStudio.class_status (status_name) VALUES ('Cancelled');

INSERT INTO DanceStudio.booking_status (status_name) VALUES ('FULL');
INSERT INTO DanceStudio.booking_status (status_name) VALUES ('AVAILABLE');




#---------DanceStudio.room_reservations
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (1,1,'2023-05-03','2023-05-23','10:00:00','11:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (1,2,'2023-05-03','2023-05-23','09:00:00','10:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (1,3,'2023-05-03','2023-05-23','11:00:00','12:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (1,7,'2023-05-03','2023-05-23','13:00:00','14:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (1,8,'2023-05-03','2023-05-23','15:00:00','16:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (1,9,'2023-05-03','2023-05-23','16:00:00','17:00:00',60,2);

INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (2,4,'2023-05-03','2023-05-23','10:00:00','11:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (2,5,'2023-05-03','2023-05-23','09:00:00','10:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (2,6,'2023-05-03','2023-05-23','11:00:00','12:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (2,7,'2023-05-03','2023-05-23','13:00:00','14:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (2,8,'2023-05-03','2023-05-23','15:00:00','16:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (2,9,'2023-05-03','2023-05-23','16:00:00','17:00:00',60,2);

INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (3,1,'2023-05-03','2023-05-23','10:00:00','11:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (3,2,'2023-05-03','2023-05-23','09:00:00','10:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (3,3,'2023-05-03','2023-05-23','11:00:00','12:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (3,4,'2023-05-03','2023-05-23','13:00:00','14:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (3,5,'2023-05-03','2023-05-23','15:00:00','16:00:00',60,2);
INSERT INTO DanceStudio.room_reservations (room_id,class_id,class_start,class_end,class_start_time,class_end_time,class_duration,status_id) VALUES (3,6,'2023-05-03','2023-05-23','16:00:00','17:00:00',60,2);
#---------DanceStudio.room_reservations

#---------DanceStudio.CLASS_DETAILS
INSERT INTO DanceStudio.class_details (instructor_id, student_id, room_reservation_id, reservation_date) VALUES (3,3,1,'2023-05-03');
INSERT INTO DanceStudio.class_details (instructor_id, student_id, room_reservation_id, reservation_date) VALUES (3,4,1,'2023-05-03');
INSERT INTO DanceStudio.class_details (instructor_id, student_id, room_reservation_id, reservation_date) VALUES (3,5,1,'2023-05-03');
INSERT INTO DanceStudio.class_details (instructor_id, student_id, room_reservation_id, reservation_date) VALUES (3,6,1,'2023-05-03');
INSERT INTO DanceStudio.class_details (instructor_id, student_id, room_reservation_id, reservation_date) VALUES (3,7,1,'2023-05-03');
INSERT INTO DanceStudio.class_details (instructor_id, student_id, room_reservation_id, reservation_date) VALUES (3,8,1,'2023-05-03');

INSERT INTO DanceStudio.class_details (instructor_id, student_id, room_reservation_id, reservation_date) VALUES (8,3,2,'2023-05-03');
INSERT INTO DanceStudio.class_details (instructor_id, student_id, room_reservation_id, reservation_date) VALUES (8,4,2,'2023-05-03');
INSERT INTO DanceStudio.class_details (instructor_id, student_id, room_reservation_id, reservation_date) VALUES (8,5,2,'2023-05-03');
INSERT INTO DanceStudio.class_details (instructor_id, student_id, room_reservation_id, reservation_date) VALUES (8,6,2,'2023-05-03');
INSERT INTO DanceStudio.class_details (instructor_id, student_id, room_reservation_id, reservation_date) VALUES (8,7,2,'2023-05-03');

