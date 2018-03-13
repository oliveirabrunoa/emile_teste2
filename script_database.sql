-- -----------------------------------------------------
-- Table     IFUSERTYPE
-- -----------------------------------------------------
CREATE TABLE IFUSERTYPE (
  user_type_id INT NOT NULL,
  user_type_description VARCHAR(45) NULL,
  PRIMARY KEY (user_type_id)
);

-- -----------------------------------------------------
-- Table   IFINSTITUTION
-- -----------------------------------------------------
CREATE TABLE IFINSTITUTION (
  institution_id INT NOT NULL,
  institution_name VARCHAR(250) NULL,
  institution_abbreviation VARCHAR(20) NULL,
  institution_cnpj VARCHAR(18) NULL,
  institution_address VARCHAR(250) NULL,
  institution_current_program_section VARCHAR(6) NULL,
  PRIMARY KEY (institution_id)
);

-- -----------------------------------------------------
-- Table     IFCOURSETYPE
-- -----------------------------------------------------
CREATE TABLE IFCOURSETYPE (
  course_type_id INT NOT NULL,
  course_type_description VARCHAR(50) NULL,
  PRIMARY KEY (course_type_id)
);

-- -----------------------------------------------------
-- Table     IFPROGRAM
-- -----------------------------------------------------
CREATE TABLE IFPROGRAM (
  program_id INT NOT NULL,
  program_name VARCHAR(45) NULL,
  program_abbreviation VARCHAR(10) NULL,
  program_total_hours INT NULL,
  program_total_credits INT NULL,
  program_institution_id INT NULL,
  PRIMARY KEY (program_id),
  FOREIGN KEY (program_institution_id) REFERENCES IFINSTITUTION (institution_id)
);

-- -----------------------------------------------------
-- Table     IFUSERS
-- -----------------------------------------------------
CREATE TABLE IFUSERS (
  users_id INT NOT NULL,
  users_username VARCHAR(45) NULL,
  users_email VARCHAR(100) NULL,
  users_password TEXT NULL,
  users_name VARCHAR(250) NULL,
  users_birth_date DATE NULL,
  users_gender VARCHAR(1) NULL,
  users_address VARCHAR(250) NULL,
  users_push_notification_token TEXT NULL,
  users_type INT NULL,
  users_program_id INT NULL,
  users_image_path TEXT NULL,
  PRIMARY KEY (users_id),
  FOREIGN KEY (users_type) REFERENCES IFUSERTYPE (user_type_id),
  FOREIGN KEY (users_program_id) REFERENCES IFPROGRAM (program_id)
);

-- -----------------------------------------------------
-- Table     IFCOURSES
-- -----------------------------------------------------
CREATE TABLE IFCOURSES (
  courses_id INT NOT NULL,
  courses_code VARCHAR(20) NULL,
  courses_name VARCHAR(50) NULL,
  courses_credits INT NULL,
  courses_hours INT NULL,
  courses_program_section INT NULL,
  courses_course_type_id INT NULL,
  courses_program_id INT NULL,
  PRIMARY KEY (courses_id),
  FOREIGN KEY (courses_course_type_id) REFERENCES IFCOURSETYPE (course_type_id),
  FOREIGN KEY (courses_program_id) REFERENCES IFPROGRAM (program_id)
);

-- -----------------------------------------------------
-- Table     IFCOURSESECTIONS
-- -----------------------------------------------------
CREATE TABLE IFCOURSESECTIONS (
  course_section_id INT NOT NULL,
  course_sections_code VARCHAR(20) NULL,
  course_sections_name VARCHAR(50) NULL,
  course_sections_courses_id INT NULL,
  course_sections_teacher_id INT NULL,
  course_section_period VARCHAR(6) NULL,
  PRIMARY KEY (course_section_id),
  FOREIGN KEY (course_sections_teacher_id) REFERENCES IFUSERS (users_id),
  FOREIGN KEY (course_sections_courses_id) REFERENCES IFCOURSES (courses_id)
);

-- -----------------------------------------------------
-- Table     IFSECTIONTIMES
-- -----------------------------------------------------
CREATE TABLE IFSECTIONTIMES (
  section_time_id INT NOT NULL,
  section_times_course_sections_id INT NULL,
  section_times_week_day INT NULL,
  section_time_start_time VARCHAR(45) NULL,
  section_time_finish_time VARCHAR(45) NULL,
  PRIMARY KEY (section_time_id),
  FOREIGN KEY (section_times_course_sections_id) REFERENCES IFCOURSESECTIONS (course_section_id)
);




-----Inserts-----

--institution
insert into IFINSTITUTION (institution_id,institution_name,institution_abbreviation,institution_cnpj, institution_address,institution_current_program_section) values (1,
'Instituto Federal de Educação, Ciência e Tecnologia da Bahia - Campus Salvador','IFBA','10.764.307/0002-01','R Emidio Dos Santos, Sn, Barbalho, Salvador, BA, CEP 40301-
015, Brasil','2016.2');
--program
insert into IFPROGRAM (program_id,program_name,program_abbreviation,program_total_hours,program_total_credits,program_institution_id) values (1,'Análise e Desenvolviment
o de Sistemas','ADS',2400,100,1);

--course_type
insert into IFCOURSETYPE (course_type_id,course_type_description) values (1,'Obrigatória');
insert into IFCOURSETYPE (course_type_id,course_type_description) values (2,'Optativa');
insert into IFCOURSETYPE (course_type_id,course_type_description) values (3,'Eletiva');

--user_type
insert into IFUSERTYPE (user_type_id,user_type_description) values (1,'student');
insert into IFUSERTYPE (user_type_id,user_type_description) values (2,'teacher');
insert into IFUSERTYPE (user_type_id,user_type_description) values (3,'coordinator');

--users

insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (1,'eliakincosta','eliakincosta@ifba.edu.br','Here is the Password','Eliakin Costa','1993-12-11','M','Rua Teste','Here is the push_notification_token',1,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (2,'enoquejoseneas','enoquejoseneas@ifba.edu.br','Here is the Password','Enoque Joseneas','1990-12-11','M','Rua Teste','Here isthe push_notification_token',1,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (3,'emanuelsales','emanuelsales@ifba.edu.br','Here is the Password','Emanuel Sales','1993-12-11','M','Rua Teste','Here is the push_notification_token',1,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (4,'brunooliveira','brunoaraujo@ifba.edu.br','Here is the Password','Bruno Oliveira','1993-12-11','M','Rua Teste','Here is the push_notification_token',1,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (5,'sandroandrade','sandroandrade@ifba.edu.br','Here is the Password','Sandro Andrade','1981-12-11','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (6,'renatonovais','renatonovais@ifba.edu.br','Here is the Password','Renato Novais','1980-08-23','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (7,'manoelneto','manoelnetom@ifba.edu.br','Here is the Password','Manoel Neto','1980-08-23','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (8,'alessandro','alessandro@ifba.edu.br','Here is the Password','Alessandro','1985-08-03','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (9,'daysesacramento','daysesacramento@ifba.edu.br','Here is the Password','Dayse Sacramento','1989-08-03','F','Rua Teste','Hereis the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (10,'romilson','romilson@ifba.edu.br','Here is the Password','Romilson','1989-08-03','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (11,'antoniocarlos','antoniocarlos@ifba.edu.br','Here is the Password','Antônio Carlos','1989-03-03','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (12,'fredbarbosa','fredbarbosa@ifba.edu.br','Here is the Password','Fred Barbosa','1989-03-08','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (13,'marcos','marcos@ifba.edu.br','Here is the Password','Marcos','1989-03-08','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (14,'mariasocorro','mariasocorro@ifba.edu.br','Here is the Password','Maria Socorro','1989-03-08','F','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (15,'allanedgard','allanedgard@ifba.edu.br','Here is the Password','Allan Edgard','1989-03-08','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (16,'samirmortada','samirmortada@ifba.edu.br','Here is the Password','Samir Mortada','1989-03-08','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (17,'jowaner','jowaner@ifba.edu.br','Here is the Password','Jowaner','1989-03-08','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (18,'grinaldolopes','grinaldolopes@ifba.edu.br','Here is the Password','Grinaldo Lopes','1989-03-08','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (19,'washington','washington@ifba.edu.br','Here is the Password','Washington','1989-03-08','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (20,'pabloflorentino','pabloflorentino@ifba.edu.br','Here is the Password','Pablo Forentino','1989-03-08','M','Rua Teste','Hereis the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (21,'luana','luana@ifba.edu.br','Here is the Password','Luana','1989-03-08','F','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (22,'simoneamorim','simoneamorim@ifba.edu.br','Here is the Password','Simone Amorim','1989-03-08','F','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (23,'marcellosales','marcellosales@ifba.edu.br','Here is the Password','Marcello Sales','1989-03-08','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (24,'ronaldopedreira','ronaldopedreira@ifba.edu.br','Here is the Password','Ronaldo Pedreira','1989-03-08','M','Rua Teste','Here is the push_notification_token',2,1,'Here is the image_path');
insert into IFUSERS (users_id,users_username,users_email,users_password,users_name,users_birth_date,users_gender,users_address,users_push_notification_token,users_type,users_program_id,users_image_path) values (25,'renato','renato@ifba.edu.br','Here is the Password','Renato','1989-03-08','M','Rua Teste','Here is the push_notification_token',3,1,'Here is the image_path');


--courses
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (1,'INF004','Introdução à Lógica de Programação',5,90,1,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (2,'INF027','Introdução à Lógica de Programação',3,60,1,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (3,'INF003','Introdução a Computação',5,90,1,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (4,'INF026','Introdução à Computação',3,60,1,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (5,'MAT222','Matemática I',5,90,1,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (6,'LET100','Língua Portuguesa',3,60,1,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (7,'LET102','Inglês',3,60,1,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (8,'INF029','Laboratório de Programação',3,60,2,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (9,'INF006','Estrutura de Dados e Algoritmos',5,90,2,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (10,'INF005','Arquitetura de Computadores e Software',5,90,2,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (11,'INF028','Arquitetura de Computadores e Software Básico',3,60,2,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (12,'INF031','Metodologia da Pesquisa',4,60,2,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (13,'INF008','Programação Orientada a Objetos',5,90,3,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (14,'INF021','Estágio Supervisionado',10,300,3,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (15,'INF009','Sistemas Operacionais',4,90,3,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (16,'INF007','Banco de Dados I',5,90,3,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (17,'ADM500','Introdução a Administração',4,60,3,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (18,'INF011','Padrões de Projeto',5,90,4,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (19,'INF012','Programação Web',5,90,4,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (20,'INF015','Redes de Computadores I',3,60,4,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (21,'INF010','Banco de Dados II',5,90,4,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (22,'INF014','Engenharia de Software',6,90,5,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (23,'INF017','Redes de Computadores II',2,60,5,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (24,'INF022','Tópicos Avançados',3,60,5,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (25,'INF032','Tópicos Avançados II',4,60,5,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (26,'INF030','Métodos Científicos em Computação',2,30,5,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (27,'ADM550','Empreendedorismo',4,60,5,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (28,'HUM100','Filosofia',4,60,5,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (29,'INF018','Auditoria de Sistemas',3,60,6,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (30,'INF019','Gerência de Projetos',4,60,6,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (31,'INF016','Arquitetura de Software',5,90,6,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (32,'INF020','Sistemas Distribuídos',3,60,6,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (33,'INF023','Trabalho Final de Curso',3,90,6,1,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (34,'HUM101','Sociologia',4,60,2,2,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (35,'LET112','LIBRAS',2,30,2,2,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (36,'HUM102','Psicologia aplicada ao trabalho',4,60,2,2,1);
insert into IFCOURSES (courses_id,courses_code,courses_name,courses_credits, courses_hours,courses_program_section,courses_course_type_id, courses_program_id) values (37,'ADM545','Legislação em Informática',4,60,5,2,1);

--course_sections
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (1,'INF004-T01','Turma 01',1,12,'2012.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period)
values (2,'INF003-T01','Turma 01',3,11,'2012.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values(3,'INF005-T01','Turma 01',10,11,'2012.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (4,'LET100-T01','Turma 01',6,9,'2012.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (5,'MAT222-T01','Turma 01',5,8,'2012.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (6,'ADM545-T01','Turma 01',37,19,'2012.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (7,'HUM102-T01','Turma 01',36,16,'2012.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (8,'INF004-T01','Turma 01',1,12,'2012.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (9,'LET102-T01','Turma 01',7,14,'2012.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (10,'ADM500-T01','Turma 01',17,19,'2013.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (11,'INF006-T01','Turma 01',9,15,'2013.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (12,'INF008-T01','Turma 01',13,12,'2013.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (13,'INF008-T01','Turma 01',13,12,'2013.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (14,'LET112-T01','Turma 01',35,16,'2013.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (15,'MAT222-T01','Turma 01',5,8,'2013.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (16,'INF011-T01','Turma 01',18,5,'2014.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (17,'INF031-T01','Turma 01',12,10,'2014.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (18,'MAT222-T01','Turma 01',5,8,'2014.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (19,'LET100-T01','Turma 01',6,9,'2014.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (20,'INF027-T01','Turma 01',2,12,'2014.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (21,'INF027-T02','Turma 02',2,10,'2014.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (22,'INF026-T01','Turma 01',4,11,'2014.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (23,'LET102-T01','Turma 01',7,14,'2014.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (24,'LET102-T02','Turma 02',7,13,'2014.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (25,'HUM100-T01','Turma 01',28,23,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (26,'INF009-T01','Turma 01',15,17,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (27,'INF012-T01','Turma 01',19,7,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (28,'INF021-T01','Turma 01',14,24,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (29,'INF006-T01','Turma 01',9,15,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (30,'INF028-T01','Turma 01',11,11,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (31,'INF031-T01','Turma 01',12,10,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (32,'HUM102-T01','Turma 01',36,16,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (33,'INF029-T01','Turma 01',8,6,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (34,'ADM550-T01','Turma 01',27,21,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (35,'HUM101-T01','Turma 01',34,16,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (36,'INF014-T01','Turma 01',22,22,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (37,'INF015-T01','Turma 01',20,18,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (38,'INF021-T01','Turma 01',14,24,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (39,'INF008-T01','Turma 01',13,12,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (40,'INF009-T01','Turma 01',15,17,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (41,'ADM500-T01','Turma 01',17,19,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (42,'INF007-T01','Turma 01',16,18,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (43,'INF007-T01','Turma 01',16,18,'2015.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (44,'INF014-T01','Turma 01',22,22,'2015.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (45,'INF012-T01','Turma 01',19,7,'2015.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (46,'INF010-T01','Turma 01',21,20,'2015.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (47,'INF015-T01','Turma 01',20,18,'2015.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (48,'INF020-T01','Turma 01',32,15,'2015.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (49,'INF022-T01','Turma 01',24,6,'2015.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (50,'INF011-T01','Turma 01',18,5,'2016.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (51,'INF017-T01','Turma 01',23,11,'2016.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (52,'ADM550-T01','Turma 01',27,21,'2016.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (53,'INF017-T01','Turma 01',23,11,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (54,'INF014-T01','Turma 01',22,22,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (55,'HUM100-T01','Turma 01',28,23,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (56,'INF022-T01','Turma 01',24,6,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (57,'INF032-T01','Turma 01',25,6,'2016.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (58,'INF030-T01','Turma 01',26,6,'2016.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (59,'INF016-T01','Turma 01',31,5,'2016.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (60,'INF018-T01','Turma 01',29,24,'2016.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (61,'INF019-T01','Turma 01',30,17,'2016.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (62,'INF020-T01','Turma 01',32,15,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (63,'INF019-T01','Turma 01',30,17,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (64,'INF016-T01','Turma 01',31,5,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (65,'INF023-T01','Turma 01',33,7,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (66,'INF023-T02','Turma 02',33,7,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (67,'INF018-T01','Turma 01',29,24,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (68,'INF021-T01','Turma 01',14,24,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (69,'ADM545-T01','Turma 01',37,19,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (70,'MAT222-T01','Turma 01',5,8,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (71,'LET100-T01','Turma 01',6,9,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (72,'LET102-T01','Turma 01',7,14,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (73,'INF027-T01','Turma 01',2,12,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (74,'HUM102-T01','Turma 01',36,16,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (75,'INF006-T01','Turma 01',9,15,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (76,'INF028-T01','Turma 01',11,11,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (77,'INF029-T01','Turma 01',8,6,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (78,'INF031-T01','Turma 01',12,10,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (79,'ADM500-T01','Turma 01',17,19,'2015.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (80,'INF008-T01','Turma 01',13,12,'2015.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (81,'INF009-T01','Turma 01',15,17,'2015.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (82,'INF010-T01','Turma 01',21,20,'2016.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (83,'INF012-T01','Turma 01',19,7,'2016.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (84,'INF015-T01','Turma 01',20,18,'2016.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (85,'INF021-T01','Turma 01',14,24,'2016.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (86,'INF030-T01','Turma 01',26,6,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (87,'INF011-T01','Turma 01',18,5,'2016.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (88,'INF026-T01','Turma 01',4,11,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (89,'INF003-T01','Turma 01',3,11,'2012.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (90,'INF005-T01','Turma 01',10,11,'2012.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (91,'LET100-T01','Turma 01',6,9,'2012.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (92,'MAT222-T01','Turma 01',5,8,'2012.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (93,'INF031-T01','Turma 01',12,10,'2013.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (94,'LET102-T01','Turma 01',7,14,'2013.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (95,'ADM500-T01','Turma 01',17,19,'2013.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (96,'HUM102-T01','Turma 01',36,16,'2013.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (97,'INF009-T01','Turma 01',15,17,'2013.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (98,'INF011-T01','Turma 01',18,5,'2013.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (99,'ADM545-T01','Turma 01',37,19,'2014.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (100,'INF015-T01','Turma 01',20,18,'2014.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (101,'ADM550-T01','Turma 01',27,21,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (102,'INF007-T01','Turma 01',16,18,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (103,'INF020-T01','Turma 01',32,15,'2014.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (104,'INF010-T01','Turma 01',21,20,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (105,'INF017-T01','Turma 01',23,11,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (106,'INF022-T01','Turma 01',24,6,'2015.1');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (107,'HUM100-T01','Turma 01',28,23,'2015.2');
insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) 
values (108,'INF021-T01','Turma 01',14,24,'2015.2');


--section_times
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (1,87,0,'18:40:00','20:20:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (2,87,1,'20:20:00','22:00:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (3,87,2,'20:20:00','22:00:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (4,83,0,'20:20:00','22:00:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (5,83,1,'18:40:00','20:20:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (6,83,2,'18:40:00','20:20:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (7,82,2,'17:00:00','18:40:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (8,82,3,'18:40:00','20:20:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (9,82,4,'17:00:00','18:40:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (10,84,3,'20:20:00','22:00:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (11,84,4,'18:40:00','20:20:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (12,54,0,'20:20:00','22:00:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (13,54,2,'17:00:00','18:40:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (14,54,4,'17:00:00','18:40:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (15,55,1,'20:20:00','22:00:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (16,55,2,'18:40:00','20:20:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (17,56,2,'20:20:00','22:00:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (18,56,4,'20:20:00','22:00:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (19,47,0,'17:00:00','18:40:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (20,47,3,'18:40:00','20:20:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (21,52,0,'18:40:00','20:20:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (22,52,3,'20:20:00','22:00:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (23,87,0,'13:00:00','17:00:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (24,87,1,'13:00:00','17:00:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (25,87,2,'13:00:00','17:00:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (26,87,3,'13:00:00','17:00:00');
insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values (27,87,4,'13:00:00','17:00:00');
