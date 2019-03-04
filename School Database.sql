/*The term `Final` implies the entire School schema*/
CREATE SCHEMA IF NOT EXISTS `Final` ;
USE `Final` ;


CREATE TABLE IF NOT EXISTS `Final`.`College` (
  `CollegeName` VARCHAR(50) NOT NULL,
  `CollegeTotalStudents` INT NULL,
  PRIMARY KEY (`CollegeName`))
ENGINE = InnoDB;
CREATE UNIQUE INDEX `CollegeName_UNIQUE` ON `Final`.`College` (`CollegeName` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Buildings` (
  `BuildingID` INT NOT NULL,
  `BuildingName` VARCHAR(45) NULL,
  `CollegeName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BuildingID`),
  CONSTRAINT `FK_Buildings_CollegeName`
    FOREIGN KEY (`CollegeName`)
    REFERENCES `Final`.`College` (`CollegeName`)
    )
ENGINE = InnoDB;
CREATE UNIQUE INDEX `BuildingID_UNIQUE` ON `Final`.`Buildings` (`BuildingID` ASC);
CREATE INDEX `CollegeName_idx` ON `Final`.`Buildings` (`CollegeName` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Classrooms` (
  `RoomNumber` INT NOT NULL,
  `HasProjector` VARCHAR(3) NULL,
  `BuildingID` INT NULL,
  PRIMARY KEY (`RoomNumber`),
  CONSTRAINT `FK_Classrooms_BuildingID`
    FOREIGN KEY (`BuildingID`)
    REFERENCES `Final`.`Buildings` (`BuildingID`)
    )
ENGINE = InnoDB;
CREATE UNIQUE INDEX `RoomNumber_UNIQUE` ON `Final`.`Classrooms` (`RoomNumber` ASC);
CREATE INDEX `BuildingID_idx` ON `Final`.`Classrooms` (`BuildingID` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Textbook` (
  `TextbookISBN` INT NOT NULL,
  `TextbookTitle` VARCHAR(45) NULL,
  `TextbookAuthor` VARCHAR(45) NULL,
  PRIMARY KEY (`TextbookISBN`))
ENGINE = InnoDB;
CREATE UNIQUE INDEX `TextbookISBN_UNIQUE` ON `Final`.`Textbook` (`TextbookISBN` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Course` (
  `CourseID` INT NOT NULL,
  `CourseName` VARCHAR(45) NULL,
  `TextbookISBN` INT NULL,
  PRIMARY KEY (`CourseID`),
  CONSTRAINT `FK_Course_TextbookISBN`
    FOREIGN KEY (`TextbookISBN`)
    REFERENCES `Final`.`Textbook` (`TextbookISBN`)
	)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `CourseID_UNIQUE` ON `Final`.`Course` (`CourseID` ASC);
CREATE INDEX `TextbookISBN_idx` ON `Final`.`Course` (`TextbookISBN` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Person` (
  `PersonID` INT NOT NULL,
  `PersonPhoneNumber` VARCHAR(45) NULL,
  `PersonName` VARCHAR(45) NULL,
  PRIMARY KEY (`PersonID`))
ENGINE = InnoDB;
CREATE UNIQUE INDEX `PersonID_UNIQUE` ON `Final`.`Person` (`PersonID` ASC);





CREATE TABLE IF NOT EXISTS `Final`.`Faculty` (
  `FacultyID` INT NOT NULL,
  `FacultyTitle` VARCHAR(45) NULL,
  `FacultySalary` INT NULL,
  `FacultyName` VARCHAR(45) NULL,
  `PersonID` INT NULL,
  PRIMARY KEY (`FacultyID`),
  CONSTRAINT `FK_Faculty_PersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `Final`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `FacultyID_UNIQUE` ON `Final`.`Faculty` (`FacultyID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Faculty` (`PersonID` ASC);




CREATE TABLE IF NOT EXISTS `Final`.`Interns` (
  `InternID` INT NOT NULL,
  `PersonID` INT NULL,
  `InternHourlyWage` INT NULL,
  PRIMARY KEY (`InternID`),
  CONSTRAINT `FK_Interns_PersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `Final`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `Level_UNIQUE` ON `Final`.`Interns` (`InternID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Interns` (`PersonID` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Section` (
  `SectionID` INT NOT NULL,
  `SectionDate` DATE NULL,
  `RoomNumber` INT NULL,
  `CourseID` INT NULL,
  `BuildingID` INT NULL,
  `PersonID` INT NULL,
  PRIMARY KEY (`SectionID`),
  CONSTRAINT `FK_Section_CourseID`
    FOREIGN KEY (`CourseID`)
    REFERENCES `Final`.`Course` (`CourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Section_BuildingID`
    FOREIGN KEY (`BuildingID`)
    REFERENCES `Final`.`Buildings` (`BuildingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Section_PersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `Final`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Section_RoomNumber`
    FOREIGN KEY (`RoomNumber`)
    REFERENCES `Final`.`Classrooms` (`RoomNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `SectionID_UNIQUE` ON `Final`.`Section` (`SectionID` ASC);
CREATE INDEX `RoomNumber_idx` ON `Final`.`Section` (`RoomNumber` ASC);
CREATE INDEX `CourseID_idx` ON `Final`.`Section` (`CourseID` ASC);
CREATE INDEX `BuildingID_idx` ON `Final`.`Section` (`BuildingID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Section` (`PersonID` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Student` (
  `StudentID` INT NOT NULL,
  `StudentGPA` DOUBLE(10, 2) NULL,
  `StudentName` VARCHAR(45) NULL,
  `PersonID` INT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `FK_Student_PersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `Final`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `StudentID_UNIQUE` ON `Final`.`Student` (`StudentID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Student` (`PersonID` ASC);








INSERT INTO `Final`.`College` (`CollegeName`, `CollegeTotalStudents`) VALUES ('SCCC', 26711);



INSERT INTO `Final`.`Buildings` (`BuildingID`, `BuildingName`, `CollegeName`) VALUES (1, 'Riverhead', 'SCCC');
INSERT INTO `Final`.`Buildings` (`BuildingID`, `BuildingName`, `CollegeName`) VALUES (2, 'Islip', 'SCCC');
INSERT INTO `Final`.`Buildings` (`BuildingID`, `BuildingName`, `CollegeName`) VALUES (3, 'South Hampton', 'SCCC');
INSERT INTO `Final`.`Buildings` (`BuildingID`, `BuildingName`, `CollegeName`) VALUES (4, 'Ammerman', 'SCCC');
INSERT INTO `Final`.`Buildings` (`BuildingID`, `BuildingName`, `CollegeName`) VALUES (5, 'Smithtown', 'SCCC');



INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (201, 'Y', 1);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (202, 'N', 1);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (203, 'Y', 1);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (303, 'N', 5);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (304, 'Y', 5);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (305, 'N', 5);



INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (200, 'Computer Science Illustrated', 'John Smith');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (201, 'Liang Java', 'Daniel Liang');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (202, 'Liang Java', 'Daniel Liang');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (203, 'Data Structures & Algorithms', 'William Mcallister');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (204, 'Machine Learning', 'John Smith');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (205, 'Networking CCNA', 'Tom Smith');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (206, 'Intro to Calculus', 'Isaac Newton');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (207, 'Advanced Topics in Calculus', 'James Stewart');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (208, 'Vectors and Matrices in Calculus', 'James Stewart');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (209, 'Multivariable Calculus', 'James Stewart');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (210, 'Math for Computer Science', 'James Hoy');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (211, 'Fundamentals of Accounting', 'Nicholas Bosco');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (212, 'Fundamentals of Accounting', 'Nicholas Bosco');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (213, 'Short Stories', 'Daniel Linker');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (214, 'Poems and Stories', 'William Burns');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (215, 'Organic Chemistry Principles', 'Craig Johnson');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (216, 'Organic Chemistry Principles', 'Craig Johnson');




INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (1, 'Computer Science I', 200);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (2, 'Computer Science II', 201);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (3, 'Computer Science III', 202);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (4, 'Data Structures', 203);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (5, 'Computer Assembly', 204);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (6, 'Intro To Networking', 205);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (7, 'Calculus I', 206);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (8, 'Calculus II', 207);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (9, 'Calculus III', 208);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (10, 'Differential Equations', 209);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (11, 'Linear Algebra', 210);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (12, 'Accounting I', 211);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (13, 'Accounting II', 212);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (14, 'Composition', 213);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (15, 'Literature', 214);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (16, 'Organic Chemistry I', 215);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (17, 'Organic Chemistry II', 216);




INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (1, '635-448-6158', 'Tanya Ferguson');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (2, '654-651-8521', 'Guy O\'Neill');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (3, '687-846-5132', 'Dennis Wilks');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (4, '876-263-4455', 'Kenneth Mason');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (5, '184-846-4613', 'Mike Briley');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (6, '184-618-4842', 'Mary George');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (7, '618-476-4631', 'June Walkters');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (8, '594-976-4326', 'Angela Mendez');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (9, '459-487-9635', 'John Leak');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (10, '111-526-8633', 'Carey Cochran');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (11, '216-549-8633', 'Jerry Ryan');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (12, '549-798-6568', 'Hugo Jurgens');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (13, '654-849-9562', 'Anita Nelson');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (14, '954-598-5456', 'Robert Arnold');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (15, '108-865-6406', 'Helen Small');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (16, '952-814-6546', 'Jason Leavitt');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (17, '646-979-4626', 'Heather Vester');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (18, '649-452-9488', 'Ivan Wright');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (19, '959-561-2512', 'Norman Roberts');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (20, '646-289-5849', 'James Neville');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (21, '168-516-5213', 'Jamie Kurland');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (22, '651-651-2383', 'Brenda Thornberry');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (23, '651-468-4684', 'Tom Katz');





INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (1, 'Head Of Computer Science', 100000, 'Tanya Ferguson', 1);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (2, 'Head Of Mathematics', 90000, 'Guy O\'Neill', 2);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (3, 'Head Of English', 85000, 'Dennis Wilks', 3);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (4, 'Head Of Accounting', 80000, 'Kenneth Mason', 4);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (5, 'Head Of Life Sciences', 75000, 'Mike Briley', 5);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (6, 'Professor Of Computer Science', 60000, 'Mary George', 6);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (7, 'Professor Of Mathematics', 60000, 'June Walkters', 7);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (8, 'Professor Of English', 60000, 'Angela Mendez', 8);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (9, 'Professor Of Accounting', 60000, 'John Leak', 9);
INSERT INTO `Final`.`Faculty` (`FacultyID`, `FacultyTitle`, `FacultySalary`, `FacultyName`, `PersonID`) VALUES (10, 'Professor Of Life Sciences', 60000, 'Carey Cochran', 10);




INSERT INTO `Final`.`Interns` (`InternID`, `PersonID`, `InternHourlyWage`) VALUES (1, 21, 14.50);
INSERT INTO `Final`.`Interns` (`InternID`, `PersonID`, `InternHourlyWage`) VALUES (2, 22, 15);
INSERT INTO `Final`.`Interns` (`InternID`, `PersonID`, `InternHourlyWage`) VALUES (3, 23, 11);




INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (100, '2017-12-27', 201, 3, 1, 1);
INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (101, '2017-12-27', 202, 7, 1, 2);
INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (102, '2017-12-27', 203, 12, 1, 3);
INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (103, '2017-12-27', 303, 15, 5, 4);
INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (104, '2017-12-27', 304, 17, 5, 5);




INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (1, 4.0, 'Jerry Ryan', 11);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (2, 3.2, 'Hugo Jurgens', 12);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (3, 3.7, 'Anita Nelson', 13);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (4, 2.5, 'Robert Arnold', 14);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (5, 2.0, 'Helen Small', 15);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (6, 4.0, 'Jason Leavitt', 16);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (7, 3.3, 'Heather Vester', 17);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (8, 2.9, 'Ivan Wright', 18);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (9, 1.3, 'Norman Roberts', 19);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (10, 3.7, 'James Nelville', 20);


