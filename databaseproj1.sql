CREATE DATABASE mark2;

-- Create University table 
CREATE TABLE University ( 

    	universityID INT PRIMARY KEY AUTO_INCREMENT, 

    	name VARCHAR(50), 

    	address VARCHAR(50), 

    	contactFirstName VARCHAR(50), 

    	contactLastName VARCHAR(50), 

    	contactEmail VARCHAR(100), 

    	contactPhone VARCHAR(20) 

); 

 

-- Create Student table 

CREATE TABLE Student ( 

    	StudentID INT PRIMARY KEY AUTO_INCREMENT, 

    	universityID INT, 

    	firstName VARCHAR(50), 

    	lastName VARCHAR(50), 

    	email VARCHAR(100), 

    	address VARCHAR(255), 

    	phone VARCHAR(20), 

    	birthDate DATE, 

		major VARCHAR(20), 

    	status VARCHAR(20), 

    	year INT, 

    	FOREIGN KEY (universityID) REFERENCES University(universityID) 

); 

 
 CREATE TABLE Keywords ( 

    keywordID INT PRIMARY KEY AUTO_INCREMENT, 

    keyword VARCHAR(50) NOT NULL 

); 

-- Create Book table 

CREATE TABLE Book ( 
 
    	ISBN_13 VARCHAR(13) PRIMARY KEY,  

    	type VARCHAR(50),  

    	price DECIMAL(10, 2),  

    	title VARCHAR(255),  

    	author VARCHAR(100),  

    	publisher VARCHAR(100),  

    	publishDate DATE,  

    	edition INT,  

    	format VARCHAR(50),  

    	weight DECIMAL(10, 2), 

        keywordID INT, 

        FOREIGN KEY (keywordID) REFERENCES Keywords(keywordID) 
); 

 
-- Create Instructor table 

CREATE TABLE Instructor ( 

    	instructorID INT PRIMARY KEY AUTO_INCREMENT, 

    	universityID INT, 

    	courseID INT, 

    	sectionID INT, 

    	firstName VARCHAR(50), 

    	lastName VARCHAR(50), 

    	email VARCHAR(100), 

    	title VARCHAR(100), 

    	FOREIGN KEY (universityID) REFERENCES University(universityID)

    	-- FOREIGN KEY (courseID) REFERENCES Course(courseID), 

    	-- FOREIGN KEY (sectionID) REFERENCES Section(sectionID) 

); 

-- Create Department table 

CREATE TABLE Department ( 

    	departmentID INT PRIMARY KEY AUTO_INCREMENT, 

    	name VARCHAR(100), 

    	universityID INT, 

    	instructorID INT, 

    	FOREIGN KEY (universityID) REFERENCES University(universityID), 

    	FOREIGN KEY (instructorID) REFERENCES Instructor(instructorID) 

); 


-- Create Course table 

CREATE TABLE Course ( 

    	courseID INT PRIMARY KEY AUTO_INCREMENT, 

    	departmentID INT, 

    	universityID INT, 

    	year INT, 

    	semester VARCHAR(20), 

    	name VARCHAR(100), 

    	FOREIGN KEY (universityID) REFERENCES University(universityID), 

    	FOREIGN KEY (departmentID) REFERENCES Department(departmentID) 

); 

 

-- Create Employee table  

CREATE TABLE Employee ( 

	employeeID INT PRIMARY KEY AUTO_INCREMENT, 

   	firstName VARCHAR(20), 

     	lastName VARCHAR(20), 

     	SSN VARCHAR(30), 

     	salary INT, 

     	gender VARCHAR(10), 

     	email VARCHAR(50), 

     	address VARCHAR(50) 

); 

-- Create Administrator table 

CREATE TABLE Administrator ( 

    	administratorID INT PRIMARY KEY AUTO_INCREMENT, 

    	employeeID INT, 

    	assignedTo INT, 

    	permissions VARCHAR(50), 

    	title VARCHAR(100), 

    	FOREIGN KEY (employeeID) REFERENCES Employee(employeeID) 

); 

 

-- Create TroubleTicket table 

CREATE TABLE TroubleTicket ( 

    	ticketID INT PRIMARY KEY AUTO_INCREMENT, 

    	studentID INT, 

    	assignedTo INT, 

    	dateLogged DATETIME, 

    	dateCompleted DATETIME, 

    	title VARCHAR(255), 

    	status VARCHAR(50), 

    	description TEXT, 

    	FOREIGN KEY (studentID) REFERENCES Student(StudentID), 

    	FOREIGN KEY (assignedTo) REFERENCES Administrator(administratorID)  

); 

 

-- Create Cart table 

CREATE TABLE Cart ( 

    	cartID INT PRIMARY KEY AUTO_INCREMENT, 
        
        ISBN_13 VARCHAR(50),
        
        quantity INT,

    	studentID INT, 

    	dateCreated DATE, 

    	dateUpdated DATE, 

    	associatedBooks VARCHAR(100), 

    	FOREIGN KEY (studentID) REFERENCES Student(StudentID) 

); 

 

-- Create Order table 
CREATE TABLE PlaceOrder (
     cartID INT,
     
     ISBN_13 VARCHAR(13),
     
     quantity INT,
     
     studentID INT,
     
     dateCreated DATE,
     
     dateFulfilled DATE,
     
     bookList VARCHAR(100),
     
     shippingType VARCHAR(50),
     
     creditName VARCHAR(100),
    
     creditType VARCHAR(50),
     
     orderStatus VARCHAR(20),
     
     PRIMARY KEY (cartID, studentID),
     
     FOREIGN KEY (cartID) REFERENCES Cart(cartID),
     
     FOREIGN KEY (ISBN_13) REFERENCES Cart(ISBN_13),
     
     FOREIGN KEY (studentID) REFERENCES Student(StudentID)
 );


 

-- Create Section table 
CREATE TABLE Section (  

    	sectionID INT PRIMARY KEY AUTO_INCREMENT,  

    	courseID INT,  

    	instructorID INT,  

    	ISBN_13 VARCHAR(50),  

        keywordID INT, 

    	FOREIGN KEY (courseID) REFERENCES Course(courseID),  

    	FOREIGN KEY (instructorID) REFERENCES Instructor(instructorID),  
        
    	FOREIGN KEY (ISBN_13) REFERENCES Book(ISBN_13),  

        FOREIGN KEY (keywordID) REFERENCES Keywords(keywordID) 

); 

 

-- Create Review table 

CREATE TABLE Review ( 

    	ISBN_13 VARCHAR(50), 

    	studentID INT, 

    	rating INT, 

    	description TEXT, 

    	FOREIGN KEY (ISBN_13) REFERENCES Book(ISBN_13), 

    	FOREIGN KEY (studentID) REFERENCES Student(StudentID), 

    	PRIMARY KEY (ISBN_13, studentID) 

); 

-- Create CustomerSupportUser table 

CREATE TABLE CustomerSupportUser ( 

    	CSUID INT PRIMARY KEY AUTO_INCREMENT, 

    	employeeID INT, 

    	assignedTo INT, 

    	permissions VARCHAR(50), 

    	FOREIGN KEY (employeeID) REFERENCES Employee(employeeID) 

); 

 

-- Create Takes table  

CREATE TABLE Takes ( 

studentID INT, 

sectionID INT, 

PRIMARY KEY (studentID, sectionID), 

FOREIGN KEY (studentID) REFERENCES Student(StudentID), 

FOREIGN KEY (sectionID) REFERENCES Section(sectionID) 

); 

 
-- Inserts

INSERT INTO Keywords (keyword) VALUES 

	('Linear Algebra'),  

	('Computer Science'), 

	('History'),  

	('Art'),  

	('Math'), 

	('Algebra'), 

	('Programming'), 

	('Python'), 

	('Art'), 
		
	('Engineering'), 

	('Electrical'); 

INSERT INTO University (universityID, name, address, contactFirstName, contactLastName, contactEmail, contactPhone) 

VALUES 

(1, 'University of Macalester', '111 Macalester Ave, Saint Paul', 'Jimmy', 'Macalester' , 'JimmyMacalester@macalester.edu', '1234567890'), 

(2, 'University of St. Thomas', '112 Summit Ave, Saint Paul', 'Thomas', 'Aquinas', 'ThomasAquinas@stthomas.edu', '1234567891'), 

(3, 'University of Minnesota Duluth', '113 Lake St, Duluth', 'James', 'Blake', 'JamesBlake@minnesotaDuluth.edu', '1234567892'), 

(4, 'University of Minnesota', '114 Gopher Drive', 'Goldy', 'Gopher', 'GoldyGopher@minnesota.edu', '1234567893'); 

 

INSERT INTO Student (studentID, universityID, firstName, lastName, email, address, phone, birthdate, major, status, year) 

VALUES 

(1, 1, 'James', 'Tremblay', 'JamesTremblay@gmail.com', '1866 Second Drive, Saint Paul', '4155992671', '1992-01-04', 'English', 'UnderGrad', 1),

(2, 3, 'Christopher', 'Roy', 'ChistopherRoy@gmail.com', '1131 Third Drive, Duluth', '4155992672', '1992-04-24', 'History', 'UnderGrad', 3), 

(3, 2, 'Ronald', 'Gagnon', 'RonaldGagnon@gmail.com', '9898 First Drive, Saint Paul', '4155992673', '1991-06-30', 'Math', 'UnderGrad', 2), 

(4, 4, 'Jimmy', 'Neutron', 'JimmyNeutron@gmail.com', '101 First Ave, Minneapolis', '4155992674', '1999-03-07', 'Computer Science', 'UnderGrad', 1), 

(5, 1, 'Billy', 'Bob', 'BillyBob@gmail.com', '112 Fifth Drive, Saint Paul', '4155992675', '1997-06-22', 'English', 'UnderGrad', 3), 

(6, 1, 'Joe', 'Book', 'JoeBook@gmail.com', '912 North Drive, Saint Paul', '4155992676', '1995-02-18', 'English', 'UnderGrad', 3), 

(7, 2, 'William', 'Anderson', 'WilliamAnderson@gmail.com', '755 Summit Ave, Saint Paul', '4155992677', '1992-04-15', 'History', 'UnderGrad', 2), 

(8, 4, 'Peter', 'Yates', 'PeterYates@gmail.com', '888 Second Ave, Minneapolis', '4155992678', '1998-01-25', 'Art', 'UnderGrad', 4), 

(9, 3, 'Jaylen', 'Prince', 'JaylenPrince@gmail.com', '999 Lake St, Duluth', '4155992679', '1999-10-20', 'History', 'UnderGrad', 1); 


INSERT INTO Book(ISBN_13, type, price, title, author, publisher, publishDate, edition, format, weight, keywordID)  
VALUES  

	('1234567890123', 'new', 33.99, 'The One and Only', 'Himothy', 'Timothy', '2001-01-01', 1, 'Hard Copy', 5.01, 1), 

	('1234567890124', 'used', 13.99, 'Minnesota History', 'Paul', 'Bunyan', '2008-02-02', 2, 'Soft', 3.01, 2), 

	('1234567890125', 'new', 99.99, 'Algebra 101', 'Thomas', 'Werl', '2021-01-01', 1, 'Hard Copy', 20.01, 3), 

	('1234567890126', 'new', 75.99, 'Python Intro', 'Jimmy', 'Buckets', '2022-03-20', 1, 'Digital', 0, 4), 

	('1234567890127', 'used', 49.99, 'Art 101', 'Timmy', 'John', '2020-08-21', 1, 'Hard Copy', 10.04, 5), 

	('1234567890128', 'new', 24.99, 'Electrical Intro', 'Milly', 'Johnson', '2019-05-10', 1, 'Soft', 5.87, 6);  

INSERT INTO Instructor (instructorID, universityID, courseID, sectionID, firstName, lastName, email, title) 

VALUES
	(1, 1, 123, 2, 'Steven', 'Strange', 'sstrange12@macalester.edu', 'Professor'), 

	(2, 2, 324, 1, 'Tony', 'Stark', 'TonyStark21@stthomas.edu', 'Professor'), 

	(3, 3, 543, 4, 'Bucky', 'Barnes', 'Bucky@minnesotaDuluth.edu', 'Professor'), 

	(4, 4, 231, 3, 'Peter', 'Parker',  'spiderman@minnesota.edu', 'Professor'); 
    

INSERT INTO Department (departmentID, name, universityID, instructorID)  

VALUES
	(1, 'English', 1, 1), 

	(2, 'Art', 1, 2), 

	(3, 'History', 2, 3), 

	(4, 'Math', 2, 4), 

	(5, 'Computer Science', 3, 2), 

	(6, 'Engineering', 4, 4); 
 

INSERT INTO Course (courseID, departmentID, universityID, year, semester, name)  

VALUES
	(123, 1, 1, 2023, 'Fall', 'Intro to English'), 

	(324, 2, 2, 2023, 'Fall', 'Ancient Art'), 

	(543, 3, 3, 2023, 'Fall', 'Minnesota History'), 

	(231, 4, 4, 2024, 'Spring', 'Algebra Math'); 


INSERT INTO Employee (employeeID, firstName, lastName, SSN, salary, gender, email, Address) 

VALUES
	(1456, 'John', 'Doe', '567-325-2456', '645000', 'Male', 'johnDoe@bookfetch.org', '124 Memory Lane, Kansas City Missouri'), 

	(1567, 'Steven', 'Spielberg', '354-423-0694', '432345', 'Male', 'steven45@bookfetch.org', '5667 Baltimore	Ave., Boston Massachusetts'), 

	(1345, 'Jessica', 'Rodgers', '532-667-5342', '315433', 'Female', 'jrodgers12@bookfetch.org', '3211 Foxberry Drive, Tampa Bay Florida'), 

	(1234, 'Padme', 'Amidala', '456-231-1147', '4235546', 'Female', 'padme@bookfetch.org', '2135 Corresant Drive, Corresant Minnesota'); 


INSERT INTO Administrator (administratorID, employeeID, assignedTo, permissions, Title)  

VALUES
	(123, 1456, 3, 'Read write', 'Administrator'), 

	(167, 1567, 4, 'Write', 'Administrator'); 


INSERT INTO TroubleTicket (ticketID, studentID, assignedTo, dateLogged, dateCompleted, title, status, description) 

VALUES 
	(1, 1, 123, '2022-05-21', '2022-05-25', 'Problem w checkout', 'completed', 'Need help with checking out'), 
    
	(2, 4, 123, '2023-06-12', '2023-06-16', 'Book gone', 'completed', 'cannot find book'), 
    
	(3, 4, 167, '2023-08-30', '2023-09-14', 'Need book', 'completed', 'book is not in the course'); 

 

INSERT INTO Cart(cartID, studentID, dateCreated, dateUpdated, associatedBooks) 

VALUES 
	(1, 1, '2022-05-21', '2022-05-25', 'Electrical Intro, Algebra 101'), 

	(2, 1, '2023-07-31', '2023-07-31', 'Minnesota History'), 

	(3, 2, '2023-10-12', '2023-10-15', 'Python Intro, Algebra 101'); 

 

 INSERT INTO PlaceOrder (cartID, studentID, dateCreated, dateFulfilled, bookList, shippingType, creditName, creditType, orderStatus) 

 VALUES
 	(1,  1, '2023-10-31', '2023-11-04', 'Algebra 101', 'Pickup', 'James Amex', 'Amex', 	'completed'), 

 	(2, 2, '2023-12-01', '2023-12-04', 'Minnesota History', 'Pickup', 'Chris Citi card', 'Citi', 'completed'), 

 	(3, 3, '2022-10-30', '2022-11-07', 'Art 101', 'Pickup', 'Ronald Amex', 'Amex', 	'completed'), 

 	(4, 4, '2023-10-21', '2023-11-11', 'Algebra 101', 'Pickup', 'Jimmys card', 'Chase', 'completed'), 

 	(5, 5, '2023-10-31', NULL, 'The One and Only', 'Pickup', 'Billy Bob card', 'Wells Fargo', 'cancelled'); 

 

INSERT INTO Section (sectionID, courseID, instructorID, ISBN_13, keywordID) 

VALUES 

(1, 123, 1, '1234567890123', 1), 

(2, 324, 2, '1234567890123', 1), 

(3, 543, 3, '1234567890124', 2), 

(4, 231, 4, '1234567890125', 3), 

(5, 231, 4, '1234567890125', 3), 

(6, 543, 3, '1234567890124', 4);  

 

INSERT INTO Review (ISBN_13, studentID, rating, description) 

VALUES 
	('1234567890123', 2, 4, 'Good but the book is really wordy'), 

	('1234567890125', 5, 2, 'The book is really disorganized'); 

 

INSERT INTO CustomerSupportUser (CSUID, employeeID, assignedTo, permissions)  

VALUES
	(111, 1234, 1, 'Read'), 

	(112, 1345, 2, 'Read'), 

	(113, 1456, 3, 'Read write'), 

	(114, 1567, 4, 'Write'); 



INSERT INTO Takes (studentID, sectionID)  

VALUES
	(1, 1), 

	(1, 2), 

	(7, 2), 

	(7, 4), 

	(8, 1), 

	(8, 3); 
    
SELECT * FROM Student;