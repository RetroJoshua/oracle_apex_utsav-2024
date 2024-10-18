-- Drop tables if they already exist
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Mentee CASCADE CONSTRAINTS';
   EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Mentor CASCADE CONSTRAINTS';
   EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Student CASCADE CONSTRAINTS';
   EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Faculty CASCADE CONSTRAINTS';
   EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Create Faculty table
CREATE TABLE Faculty (
    FacultyID VARCHAR2(20) PRIMARY KEY,
    Name VARCHAR2(100),
    Department VARCHAR2(50),
    JoiningDate DATE,
    Designation VARCHAR2(50) CONSTRAINT chk_Designation CHECK (Designation IN ('Assistant Professor', 'Sr. Assistant Professor', 'Associate Professor', 'Professor')),
    ContactNumber VARCHAR2(15),
    EmailID VARCHAR2(100),
    BloodGroup VARCHAR2(5),
    CurrentAddress VARCHAR2(4000),
    PermanentAddress VARCHAR2(4000),
    EmergencyContactNumber VARCHAR2(15)
);

-- Create Student table
CREATE TABLE Student (
    RollNo VARCHAR2(20) PRIMARY KEY,
    Name VARCHAR2(100),
    DOB DATE,
    Dept VARCHAR2(50),
    FatherName VARCHAR2(100),
    FatherContactNumber VARCHAR2(15),
    MotherName VARCHAR2(100),
    MotherContactNumber VARCHAR2(15),
    StudentContactNumber VARCHAR2(15),
    StudentEmail VARCHAR2(100),
    BloodGroup VARCHAR2(5),
    PresentAddress VARCHAR2(4000),
    PermanentAddress VARCHAR2(4000),
    FeePendingAmount NUMBER(10, 2),
    ExamFeePaid CHAR(1) CHECK (ExamFeePaid IN ('T', 'F')),
    TodayPresent CHAR(1) CHECK (TodayPresent IN ('T', 'F')),
    LatestAttendancePercentage NUMBER(5, 2),
    NumberOfBacklogs NUMBER,
    MentorID VARCHAR2(20),
    AcademicYear VARCHAR2(20),
    FOREIGN KEY (MentorID) REFERENCES Faculty(FacultyID)
);

-- Create Mentor table
CREATE TABLE Mentor (
    MentorID VARCHAR2(20) PRIMARY KEY,
    Name VARCHAR2(100),
    Department VARCHAR2(50),
    ContactNumber VARCHAR2(15),
    EmailID VARCHAR2(100),
    BloodGroup VARCHAR2(5),
    CurrentAddress VARCHAR2(4000),
    PermanentAddress VARCHAR2(4000),
    EmergencyContactNumber VARCHAR2(15)
);

-- Create Mentee table
CREATE TABLE Mentee (
    MenteeID VARCHAR2(20) PRIMARY KEY,
    Name VARCHAR2(100),
    DOB DATE,
    Dept VARCHAR2(50),
    FatherName VARCHAR2(100),
    FatherContactNumber VARCHAR2(15),
    MotherName VARCHAR2(100),
    MotherContactNumber VARCHAR2(15),
    StudentContactNumber VARCHAR2(15),
    StudentEmail VARCHAR2(100),
    BloodGroup VARCHAR2(5),
    PresentAddress VARCHAR2(4000),
    PermanentAddress VARCHAR2(4000),
    FeePendingAmount NUMBER(10, 2),
    ExamFeePaid CHAR(1) CHECK (ExamFeePaid IN ('T', 'F')),
    TodayPresent CHAR(1) CHECK (TodayPresent IN ('T', 'F')),
    LatestAttendancePercentage NUMBER(5, 2),
    NumberOfBacklogs NUMBER,
    MentorID VARCHAR2(20),
    AcademicYear VARCHAR2(20),
    FOREIGN KEY (MentorID) REFERENCES Mentor(MentorID)
);

-- Insert statements remain the same, ensure to use 'T' or 'F' for BOOLEAN fields in Oracle

-- Insert dummy records into Faculty table
INSERT INTO Faculty (
    FacultyID, 
    Name, 
    Department, 
    JoiningDate, 
    Designation, 
    ContactNumber, 
    EmailID, 
    BloodGroup, 
    CurrentAddress, 
    PermanentAddress, 
    EmergencyContactNumber
) VALUES 
    -- CSE Department Faculty
    ('CSEF001', 'Dr. Alice Smith', 'CSE', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 'Professor', '1112233445', 'alice.smith@cse.edu', 'O+', '123 CSE St', '456 CSE Ave', '0998776655');
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES ('CSEF002', 'Mr. Bob Johnson', 'CSE', TO_DATE('2019-08-22', 'YYYY-MM-DD'), 'Associate Professor', '1112233446', 'bob.johnson@cse.edu', 'A+', '124 CSE St', '457 CSE Ave', '0998776656');
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES ('CSEF003', 'Ms. Carol White', 'CSE', TO_DATE('2018-03-12', 'YYYY-MM-DD'), 'Assistant Professor', '1112233447', 'carol.white@cse.edu', 'B+', '125 CSE St', '458 CSE Ave', '0998776657');

    -- ECE Department Faculty
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('ECEF001', 'Dr. David Brown', 'ECE', TO_DATE('2021-02-20', 'YYYY-MM-DD'), 'Professor', '2223344555', 'david.brown@ece.edu', 'AB+', '223 ECE St', '559 ECE Ave', '1998776655');
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('ECEF002', 'Ms. Emily Green', 'ECE', TO_DATE('2020-07-10', 'YYYY-MM-DD'), 'Associate Professor', '2223344556', 'emily.green@ece.edu', 'O-', '224 ECE St', '560 ECE Ave', '1998776656');
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('ECEF003', 'Mr. Frank Black', 'ECE', TO_DATE('2019-11-05', 'YYYY-MM-DD'), 'Assistant Professor', '2223344557', 'frank.black@ece.edu', 'A-', '225 ECE St', '561 ECE Ave', '1998776657');

    -- EEE Department Faculty
 INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('EEEF001', 'Dr. Grace Lee', 'EEE', TO_DATE('2019-09-15', 'YYYY-MM-DD'), 'Professor', '3334455666', 'grace.lee@eee.edu', 'B-', '323 EEE St', '660 EEE Ave', '2998776655');
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('EEEF002', 'Mr. Henry Kim', 'EEE', TO_DATE('2018-06-22', 'YYYY-MM-DD'), 'Associate Professor', '3334455667', 'henry.kim@eee.edu', 'O+', '324 EEE St', '661 EEE Ave', '2998776656');
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('EEEF003', 'Ms. Iris Martinez', 'EEE', TO_DATE('2017-12-10', 'YYYY-MM-DD'), 'Assistant Professor', '3334455668', 'iris.martinez@eee.edu', 'AB-', '325 EEE St', '662 EEE Ave', '2998776657');

    -- EIE Department Faculty

INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('EIEF001', 'Dr. John Wilson', 'EIE', TO_DATE('2021-01-15', 'YYYY-MM-DD'), 'Professor', '4445566777', 'john.wilson@eie.edu', 'A+', '423 EIE St', '761 EIE Ave', '3998776655');
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('EIEF002', 'Ms. Karen Lewis', 'EIE', TO_DATE('2020-09-01', 'YYYY-MM-DD'), 'Associate Professor', '4445566778', 'karen.lewis@eie.edu', 'B+', '424 EIE St', '762 EIE Ave', '3998776656');
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('EIEF003', 'Mr. Liam Walker', 'EIE', TO_DATE('2019-05-12', 'YYYY-MM-DD'), 'Assistant Professor', '4445566779', 'liam.walker@eie.edu', 'O-', '425 EIE St', '763 EIE Ave', '3998776657');

    -- Mech Department Faculty
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES
    ('MECHF001', 'Dr. Maria Lopez', 'Mech', TO_DATE('2020-10-10', 'YYYY-MM-DD'), 'Professor', '5556677888', 'maria.lopez@mech.edu', 'O+', '523 Mech St', '860 Mech Ave', '4998776655');
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('MECHF002', 'Mr. Noah Wright', 'Mech', TO_DATE('2019-04-05', 'YYYY-MM-DD'), 'Associate Professor', '5556677889', 'noah.wright@mech.edu', 'A-', '524 Mech St', '861 Mech Ave', '4998776656');
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('MECHF003', 'Ms. Olivia Hall', 'Mech', TO_DATE('2018-11-25', 'YYYY-MM-DD'), 'Assistant Professor', '5556677790', 'olivia.hall@mech.edu', 'B+', '525 Mech St', '862 Mech Ave', '4998776657');

    -- CIVIL Department Faculty
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('CIVILF001', 'Dr. Paul King', 'CIVIL', TO_DATE('2021-06-18', 'YYYY-MM-DD'), 'Professor', '6667788999', 'paul.king@civil.edu', 'B+', '623 CIVIL St', '960 CIVIL Ave', '5998776655');
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('CIVILF002', 'Ms. Quinn Adams', 'CIVIL', TO_DATE('2020-03-10', 'YYYY-MM-DD'), 'Associate Professor', '6667788990', 'quinn.adams@civil.edu', 'O-', '624 CIVIL St', '961 CIVIL Ave', '5998776656');
INSERT INTO Faculty (FacultyID, Name, Department, JoiningDate, Designation, ContactNumber, EmailID, BloodGroup, CurrentAddress, PermanentAddress, EmergencyContactNumber)
VALUES 
    ('CIVILF003', 'Mr. Ryan Evans', 'CIVIL', TO_DATE('2019-07-20', 'YYYY-MM-DD'), 'Assistant Professor', '6667788991', 'ryan.evans@civil.edu', 'A+', '625 CIVIL St', '962 CIVIL Ave', '5998776657');


-- Insert dummy records into Student table
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES 
-- CSE Department Students
('22B81A0001', 'Alice Brown', TO_DATE('2002-01-10', 'YYYY-MM-DD'), 'CSE', 'Robert Brown', '1112233448', 'Laura Brown', '2233445567', '3344556678', 'alice.brown@cse.edu', 'B+', '789 Maple St', '321 Oak St', 200.00, 'T', 'T', 90.00, 1, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0002', 'Bob Smith', TO_DATE('2002-02-15', 'YYYY-MM-DD'), 'CSE', 'James Smith', '1112233449', 'Mary Smith', '2233445568', '3344556679', 'bob.smith@cse.edu', 'O-', '790 Maple St', '322 Oak St', 150.00, 'T', 'T', 88.00, 0, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0003', 'Charlie Davis', TO_DATE('2002-03-20', 'YYYY-MM-DD'), 'CSE', 'William Davis', '1112233450', 'Anna Davis', '2233445569', '3344556680', 'charlie.davis@cse.edu', 'A+', '791 Maple St', '323 Oak St', 180.00, 'F', 'T', 85.00, 2, 'CSEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0004', 'Diana Miller', TO_DATE('2002-04-25', 'YYYY-MM-DD'), 'CSE', 'Richard Miller', '1112233451', 'Emily Miller', '2233445570', '3344556681', 'diana.miller@cse.edu', 'O+', '792 Maple St', '324 Oak St', 120.00, 'T', 'T', 92.00, 1, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0005', 'Ethan Wilson', TO_DATE('2002-05-30', 'YYYY-MM-DD'), 'CSE', 'George Wilson', '1112233452', 'Nancy Wilson', '2233445571', '3344556682', 'ethan.wilson@cse.edu', 'B-', '793 Maple St', '325 Oak St', 250.00, 'T', 'F', 80.00, 3, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0006', 'Fiona Taylor', TO_DATE('2002-06-15', 'YYYY-MM-DD'), 'CSE', 'David Taylor', '1112233453', 'Karen Taylor', '2233445572', '3344556683', 'fiona.taylor@cse.edu', 'AB+', '794 Maple St', '326 Oak St', 100.00, 'T', 'T', 87.00, 0, 'CSEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0007', 'George Anderson', TO_DATE('2002-07-20', 'YYYY-MM-DD'), 'CSE', 'Thomas Anderson', '1112233454', 'Linda Anderson', '2233445573', '3344556684', 'george.anderson@cse.edu', 'O-', '795 Maple St', '327 Oak St', 190.00, 'F', 'T', 84.00, 2, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0008', 'Hannah Roberts', TO_DATE('2002-08-25', 'YYYY-MM-DD'), 'CSE', 'Steven Roberts', '1112233455', 'Jessica Roberts', '2233445574', '3344556685', 'hannah.roberts@cse.edu', 'A-', '796 Maple St', '328 Oak St', 210.00, 'T', 'T', 89.00, 1, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0009', 'Ivy Lewis', TO_DATE('2002-09-05', 'YYYY-MM-DD'), 'CSE', 'Walter Lewis', '1112233456', 'Olivia Lewis', '2233445575', '3344556686', 'ivy.lewis@cse.edu', 'A+', '797 Maple St', '329 Oak St', 160.00, 'T', 'T', 86.00, 1, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0010', 'Jack Martin', TO_DATE('2002-10-10', 'YYYY-MM-DD'), 'CSE', 'Samuel Martin', '1112233457', 'Sophia Martin', '2233445576', '3344556687', 'jack.martin@cse.edu', 'O+', '798 Maple St', '330 Oak St', 220.00, 'F', 'T', 82.00, 2, 'CSEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0011', 'Kara Wilson', TO_DATE('2002-11-15', 'YYYY-MM-DD'), 'CSE', 'Edward Wilson', '1112233458', 'Nancy Wilson', '2233445577', '3344556688', 'kara.wilson@cse.edu', 'B-', '799 Maple St', '331 Oak St', 140.00, 'T', 'T', 88.00, 0, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0012', 'Liam Moore', TO_DATE('2002-12-20', 'YYYY-MM-DD'), 'CSE', 'James Moore', '1112233459', 'Emma Moore', '2233445578', '3344556689', 'liam.moore@cse.edu', 'AB+', '800 Maple St', '332 Oak St', 130.00, 'T', 'F', 91.00, 1, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0013', 'Mia Taylor', TO_DATE('2003-01-25', 'YYYY-MM-DD'), 'CSE', 'Richard Taylor', '1112233460', 'Emily Taylor', '2233445579', '3344556690', 'mia.taylor@cse.edu', 'O-', '801 Maple St', '333 Oak St', 190.00, 'T', 'T', 84.00, 2, 'CSEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0014', 'Noah Anderson', TO_DATE('2003-02-28', 'YYYY-MM-DD'), 'CSE', 'Thomas Anderson', '1112233461', 'Rachel Anderson', '2233445580', '3344556691', 'noah.anderson@cse.edu', 'A-', '802 Maple St', '334 Oak St', 210.00, 'F', 'T', 87.00, 1, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0015', 'Olivia Thomas', TO_DATE('2003-03-15', 'YYYY-MM-DD'), 'CSE', 'Joseph Thomas', '1112233462', 'Jessica Thomas', '2233445581', '3344556692', 'olivia.thomas@cse.edu', 'B+', '803 Maple St', '335 Oak St', 250.00, 'T', 'T', 80.00, 3, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0016', 'Peter Harris', TO_DATE('2003-04-20', 'YYYY-MM-DD'), 'CSE', 'Charles Harris', '1112233463', 'Diane Harris', '2233445582', '3344556693', 'peter.harris@cse.edu', 'O+', '804 Maple St', '336 Oak St', 100.00, 'T', 'F', 90.00, 0, 'CSEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
  ('22B81A0017', 'Quinn Clark', TO_DATE('2003-05-25', 'YYYY-MM-DD'), 'CSE', 'Michael Clark', '1112233464', 'Mary Clark', '2233445583', '3344556694', 'quinn.clark@cse.edu', 'A+', '805 Maple St', '337 Oak St', 120.00, 'T', 'T', 93.00, 0, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0018', 'Rachel Walker', TO_DATE('2003-06-30', 'YYYY-MM-DD'), 'CSE', 'Paul Walker', '1112233465', 'Sarah Walker', '2233445584', '3344556695', 'rachel.walker@cse.edu', 'B-', '806 Maple St', '338 Oak St', 180.00, 'F', 'T', 82.00, 2, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0019', 'Sam Young', TO_DATE('2003-07-15', 'YYYY-MM-DD'), 'CSE', 'David Young', '1112233466', 'Linda Young', '2233445585', '3344556696', 'sam.young@cse.edu', 'O-', '807 Maple St', '339 Oak St', 200.00, 'T', 'T', 85.00, 1, 'CSEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0020', 'Tina Lewis', TO_DATE('2003-08-20', 'YYYY-MM-DD'), 'CSE', 'Steven Lewis', '1112233467', 'Jessica Lewis', '2233445586', '3344556697', 'tina.lewis@cse.edu', 'A-', '808 Maple St', '340 Oak St', 230.00, 'T', 'F', 77.00, 3, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0021', 'Ursula King', TO_DATE('2003-09-25', 'YYYY-MM-DD'), 'CSE', 'John King', '1112233468', 'Margaret King', '2233445587', '3344556698', 'ursula.king@cse.edu', 'AB-', '809 Maple St', '341 Oak St', 210.00, 'T', 'T', 90.00, 1, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0022', 'Victor Allen', TO_DATE('2003-10-05', 'YYYY-MM-DD'), 'CSE', 'Robert Allen', '1112233469', 'Laura Allen', '2233445588', '3344556699', 'victor.allen@cse.edu', 'O+', '810 Maple St', '342 Oak St', 160.00, 'T', 'T', 85.00, 1, 'CSEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0023', 'Wendy Carter', TO_DATE('2003-11-10', 'YYYY-MM-DD'), 'CSE', 'Paul Carter', '1112233470', 'Nancy Carter', '2233445589', '3344556700', 'wendy.carter@cse.edu', 'A-', '811 Maple St', '343 Oak St', 180.00, 'T', 'F', 82.00, 2, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0024', 'Xander Murphy', TO_DATE('2003-12-15', 'YYYY-MM-DD'), 'CSE', 'Daniel Murphy', '1112233471', 'Linda Murphy', '2233445590', '3344556701', 'xander.murphy@cse.edu', 'B+', '812 Maple St', '344 Oak St', 140.00, 'T', 'T', 90.00, 1, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0025', 'Yara Scott', TO_DATE('2004-01-20', 'YYYY-MM-DD'), 'CSE', 'Michael Scott', '1112233472', 'Rachel Scott', '2233445591', '3344556702', 'yara.scott@cse.edu', 'O-', '813 Maple St', '345 Oak St', 200.00, 'F', 'T', 87.00, 0, 'CSEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0026', 'Zachary Bennett', TO_DATE('2004-02-25', 'YYYY-MM-DD'), 'CSE', 'John Bennett', '1112233473', 'Karen Bennett', '2233445592', '3344556703', 'zachary.bennett@cse.edu', 'AB+', '814 Maple St', '346 Oak St', 220.00, 'T', 'T', 84.00, 2, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0027', 'Amy Collins', TO_DATE('2004-03-30', 'YYYY-MM-DD'), 'CSE', 'Steven Collins', '1112233474', 'Jessica Collins', '2233445593', '3344556704', 'amy.collins@cse.edu', 'A+', '815 Maple St', '347 Oak St', 150.00, 'T', 'T', 89.00, 1, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0028', 'Brian Foster', TO_DATE('2004-04-15', 'YYYY-MM-DD'), 'CSE', 'Thomas Foster', '1112233475', 'Emily Foster', '2233445594', '3344556705', 'brian.foster@cse.edu', 'B-', '816 Maple St', '348 Oak St', 130.00, 'F', 'T', 82.00, 3, 'CSEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0029', 'Catherine Green', TO_DATE('2004-05-20', 'YYYY-MM-DD'), 'CSE', 'David Green', '1112233476', 'Margaret Green', '2233445595', '3344556706', 'catherine.green@cse.edu', 'O+', '817 Maple St', '349 Oak St', 170.00, 'T', 'T', 87.00, 1, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0030', 'Daniel Hayes', TO_DATE('2004-06-25', 'YYYY-MM-DD'), 'CSE', 'Michael Hayes', '1112233477', 'Sarah Hayes', '2233445596', '3344556707', 'daniel.hayes@cse.edu', 'A-', '818 Maple St', '350 Oak St', 200.00, 'T', 'F', 81.00, 2, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0031', 'Ella James', TO_DATE('2004-07-30', 'YYYY-MM-DD'), 'CSE', 'Paul James', '1112233478', 'Anna James', '2233445597', '3344556708', 'ella.james@cse.edu', 'AB-', '819 Maple St', '351 Oak St', 180.00, 'T', 'T', 85.00, 1, 'CSEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0032', 'Frank Kennedy', TO_DATE('2004-08-15', 'YYYY-MM-DD'), 'CSE', 'James Kennedy', '1112233479', 'Nancy Kennedy', '2233445598', '3344556709', 'frank.kennedy@cse.edu', 'B+', '820 Maple St', '352 Oak St', 210.00, 'T', 'T', 82.00, 2, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0033', 'Grace Lewis', TO_DATE('2004-09-10', 'YYYY-MM-DD'), 'CSE', 'Robert Lewis', '1112233480', 'Laura Lewis', '2233445599', '3344556710', 'grace.lewis@cse.edu', 'O-', '821 Maple St', '353 Oak St', 190.00, 'F', 'T', 88.00, 1, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0034', 'Henry Moore', TO_DATE('2004-10-05', 'YYYY-MM-DD'), 'CSE', 'John Moore', '1112233481', 'Mary Moore', '2233445600', '3344556711', 'henry.moore@cse.edu', 'A+', '822 Maple St', '354 Oak St', 160.00, 'T', 'T', 89.00, 0, 'CSEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0035', 'Iris Nelson', TO_DATE('2004-11-25', 'YYYY-MM-DD'), 'CSE', 'William Nelson', '1112233482', 'Samantha Nelson', '2233445601', '3344556712', 'iris.nelson@cse.edu', 'AB+', '823 Maple St', '355 Oak St', 200.00, 'T', 'F', 84.00, 2, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0036', 'Jackie Parker', TO_DATE('2004-12-15', 'YYYY-MM-DD'), 'CSE', 'Charles Parker', '1112233483', 'Linda Parker', '2233445602', '3344556713', 'jackie.parker@cse.edu', 'O+', '824 Maple St', '356 Oak St', 210.00, 'T', 'T', 91.00, 1, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0037', 'Kevin Reed', TO_DATE('2005-01-10', 'YYYY-MM-DD'), 'CSE', 'Daniel Reed', '1112233484', 'Emily Reed', '2233445603', '3344556714', 'kevin.reed@cse.edu', 'B-', '825 Maple St', '357 Oak St', 190.00, 'F', 'T', 79.00, 3, 'CSEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0038', 'Laura Scott', TO_DATE('2005-02-20', 'YYYY-MM-DD'), 'CSE', 'Paul Scott', '1112233485', 'Jessica Scott', '2233445604', '3344556715', 'laura.scott@cse.edu', 'A-', '826 Maple St', '358 Oak St', 180.00, 'T', 'T', 86.00, 2, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0039', 'Michael Turner', TO_DATE('2005-03-15', 'YYYY-MM-DD'), 'CSE', 'James Turner', '1112233486', 'Anna Turner', '2233445605', '3344556716', 'michael.turner@cse.edu', 'O-', '827 Maple St', '359 Oak St', 160.00, 'T', 'F', 83.00, 3, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0040', 'Nina Wright', TO_DATE('2005-04-10', 'YYYY-MM-DD'), 'CSE', 'Steven Wright', '1112233487', 'Karen Wright', '2233445606', '3344556717', 'nina.wright@cse.edu', 'AB-', '828 Maple St', '360 Oak St', 200.00, 'T', 'T', 90.00, 0, 'CSEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0041', 'Oscar Young', TO_DATE('2005-05-05', 'YYYY-MM-DD'), 'CSE', 'John Young', '1112233488', 'Margaret Young', '2233445607', '3344556718', 'oscar.young@cse.edu', 'B+', '829 Maple St', '361 Oak St', 150.00, 'T', 'T', 84.00, 1, 'CSEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0042', 'Paula Adams', TO_DATE('2005-06-10', 'YYYY-MM-DD'), 'CSE', 'Robert Adams', '1112233489', 'Laura Adams', '2233445608', '3344556719', 'paula.adams@cse.edu', 'O+', '830 Maple St', '362 Oak St', 210.00, 'T', 'F', 89.00, 2, 'CSEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
-- ECE Department Students
 ('22B81A0101', 'Carol Davis', TO_DATE('2002-03-20', 'YYYY-MM-DD'), 'ECE', 'Michael Davis', '2223344558', 'Susan Davis', '3324556678', '4455667789', 'carol.davis@ece.edu', 'AB+', '791 ECE St', '323 ECE Ave', 300.00, 'T', 'T', 85.00, 2, 'ECEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0102', 'Alice Johnson', TO_DATE('2002-10-15', 'YYYY-MM-DD'), 'ECE', 'George Johnson', '1112233489', 'Nancy Johnson', '2233445609', '3344556720', 'alice.johnson@ece.edu', 'B+', '901 Maple St', '400 Oak St', 180.00, 'T', 'T', 88.00, 1, 'ECEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0103', 'Bob Evans', TO_DATE('2002-11-20', 'YYYY-MM-DD'), 'ECE', 'James Evans', '1112233490', 'Emily Evans', '2233445610', '3344556721', 'bob.evans@ece.edu', 'O-', '902 Maple St', '401 Oak St', 150.00, 'T', 'T', 84.00, 2, 'ECEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0104', 'Charlie Davis', TO_DATE('2002-12-25', 'YYYY-MM-DD'), 'ECE', 'Robert Davis', '1112233491', 'Sara Davis', '2233445611', '3344556722', 'charlie.davis@ece.edu', 'A-', '903 Maple St', '402 Oak St', 170.00, 'T', 'F', 86.00, 1, 'ECEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0105', 'Diana Miller', TO_DATE('2003-01-30', 'YYYY-MM-DD'), 'ECE', 'Thomas Miller', '1112233492', 'Jessica Miller', '2233445612', '3344556723', 'diana.miller@ece.edu', 'AB+', '904 Maple St', '403 Oak St', 200.00, 'F', 'T', 82.00, 2, 'ECEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0106', 'Ethan Wilson', TO_DATE('2003-02-25', 'YYYY-MM-DD'), 'ECE', 'Daniel Wilson', '1112233493', 'Rachel Wilson', '2233445613', '3344556724', 'ethan.wilson@ece.edu', 'O+', '905 Maple St', '404 Oak St', 160.00, 'T', 'T', 89.00, 0, 'ECEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0107', 'Fiona Taylor', TO_DATE('2003-03-20', 'YYYY-MM-DD'), 'ECE', 'Michael Taylor', '1112233494', 'Karen Taylor', '2233445614', '3344556725', 'fiona.taylor@ece.edu', 'B-', '906 Maple St', '405 Oak St', 140.00, 'T', 'T', 87.00, 1, 'ECEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0108', 'George Anderson', TO_DATE('2003-04-15', 'YYYY-MM-DD'), 'ECE', 'Stephen Anderson', '1112233495', 'Linda Anderson', '2233445615', '3344556726', 'george.anderson@ece.edu', 'A+', '907 Maple St', '406 Oak St', 180.00, 'F', 'T', 85.00, 2, 'ECEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0109', 'Hannah Roberts', TO_DATE('2003-05-10', 'YYYY-MM-DD'), 'ECE', 'John Roberts', '1112233496', 'Margaret Roberts', '2233445616', '3344556727', 'hannah.roberts@ece.edu', 'O-', '908 Maple St', '407 Oak St', 190.00, 'T', 'T', 90.00, 0, 'ECEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0110', 'Isaac Collins', TO_DATE('2003-06-05', 'YYYY-MM-DD'), 'ECE', 'James Collins', '1112233497', 'Anna Collins', '2233445617', '3344556728', 'isaac.collins@ece.edu', 'AB-', '909 Maple St', '408 Oak St', 150.00, 'T', 'F', 83.00, 3, 'ECEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0111', 'Jessica Murphy', TO_DATE('2003-07-01', 'YYYY-MM-DD'), 'ECE', 'Robert Murphy', '1112233498', 'Emily Murphy', '2233445618', '3344556729', 'jessica.murphy@ece.edu', 'B+', '910 Maple St', '409 Oak St', 220.00, 'T', 'T', 88.00, 1, 'ECEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0112', 'Kevin Green', TO_DATE('2003-08-15', 'YYYY-MM-DD'), 'ECE', 'David Green', '1112233499', 'Susan Green', '2233445619', '3344556730', 'kevin.green@ece.edu', 'O+', '911 Maple St', '410 Oak St', 200.00, 'T', 'T', 81.00, 2, 'ECEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0113', 'Laura Adams', TO_DATE('2003-09-20', 'YYYY-MM-DD'), 'ECE', 'Charles Adams', '1112233500', 'Linda Adams', '2233445620', '3344556731', 'laura.adams@ece.edu', 'A-', '912 Maple St', '411 Oak St', 180.00, 'F', 'T', 89.00, 1, 'ECEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0114', 'Mark Baker', TO_DATE('2003-10-25', 'YYYY-MM-DD'), 'ECE', 'Paul Baker', '1112233501', 'Jessica Baker', '2233445621', '3344556732', 'mark.baker@ece.edu', 'B-', '913 Maple St', '412 Oak St', 160.00, 'T', 'F', 84.00, 2, 'ECEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0115', 'Nina Clark', TO_DATE('2003-11-30', 'YYYY-MM-DD'), 'ECE', 'George Clark', '1112233502', 'Nancy Clark', '2233445622', '3344556733', 'nina.clark@ece.edu', 'O-', '914 Maple St', '413 Oak St', 190.00, 'T', 'T', 87.00, 0, 'ECEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0116', 'Oscar Davis', TO_DATE('2004-01-05', 'YYYY-MM-DD'), 'ECE', 'Thomas Davis', '1112233503', 'Emily Davis', '2233445623', '3344556734', 'oscar.davis@ece.edu', 'AB+', '915 Maple St', '414 Oak St', 150.00, 'T', 'T', 83.00, 2, 'ECEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0117', 'Paula Edwards', TO_DATE('2004-02-10', 'YYYY-MM-DD'), 'ECE', 'Robert Edwards', '1112233504', 'Sara Edwards', '2233445624', '3344556735', 'paula.edwards@ece.edu', 'A+', '916 Maple St', '415 Oak St', 170.00, 'F', 'T', 90.00, 1, 'ECEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0118', 'Quinn Foster', TO_DATE('2004-03-15', 'YYYY-MM-DD'), 'ECE', 'James Foster', '1112233505', 'Emily Foster', '2233445625', '3344556736', 'quinn.foster@ece.edu', 'O+', '917 Maple St', '416 Oak St', 200.00, 'T', 'F', 84.00, 3, 'ECEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0119', 'Rachel Garcia', TO_DATE('2004-04-20', 'YYYY-MM-DD'), 'ECE', 'Paul Garcia', '1112233506', 'Nancy Garcia', '2233445626', '3344556737', 'rachel.garcia@ece.edu', 'B-', '918 Maple St', '417 Oak St', 180.00, 'T', 'T', 86.00, 1, 'ECEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0120', 'Sam Harris', TO_DATE('2004-05-25', 'YYYY-MM-DD'), 'ECE', 'Michael Harris', '1112233507', 'Jessica Harris', '2233445627', '3344556738', 'sam.harris@ece.edu', 'A-', '919 Maple St', '418 Oak St', 190.00, 'T', 'T', 82.00, 2, 'ECEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0121', 'Tina Jones', TO_DATE('2004-06-30', 'YYYY-MM-DD'), 'ECE', 'John Jones', '1112233508', 'Sarah Jones', '2233445628', '3344556739', 'tina.jones@ece.edu', 'O-', '920 Maple St', '419 Oak St', 200.00, 'F', 'T', 88.00, 0, 'ECEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
-- EEE Department Students
('22B81A0201', 'David Miller', TO_DATE('2002-04-25', 'YYYY-MM-DD'), 'EEE', 'George Miller', '3334455669', 'Linda Miller', '4435667789', '5566778890', 'david.miller@eee.edu', 'A-', '792 EEE St', '324 EEE Ave', 100.00, 'T', 'T', 92.00, 1, 'EEEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0202', 'Alice Thompson', TO_DATE('2003-01-15', 'YYYY-MM-DD'), 'EEE', 'David Thompson', '1112233509', 'Helen Thompson', '2233445629', '3344556740', 'alice.thompson@eee.edu', 'A+', '1001 Maple St', '500 Oak St', 150.00, 'T', 'T', 85.00, 1, 'EEEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0203', 'Bob Harris', TO_DATE('2003-02-20', 'YYYY-MM-DD'), 'EEE', 'Paul Harris', '1112233510', 'Nancy Harris', '2233445630', '3344556741', 'bob.harris@eee.edu', 'B-', '1002 Maple St', '501 Oak St', 180.00, 'T', 'F', 80.00, 2, 'EEEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0204', 'Charlie Martinez', TO_DATE('2003-03-25', 'YYYY-MM-DD'), 'EEE', 'Robert Martinez', '1112233511', 'Linda Martinez', '2233445631', '3344556742', 'charlie.martinez@eee.edu', 'O-', '1003 Maple St', '502 Oak St', 200.00, 'F', 'T', 82.00, 2, 'EEEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0205', 'Diana Lopez', TO_DATE('2003-04-30', 'YYYY-MM-DD'), 'EEE', 'James Lopez', '1112233512', 'Jessica Lopez', '2233445632', '3344556743', 'diana.lopez@eee.edu', 'AB+', '1004 Maple St', '503 Oak St', 160.00, 'T', 'T', 87.00, 1, 'EEEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0206', 'Ethan Clark', TO_DATE('2003-05-15', 'YYYY-MM-DD'), 'EEE', 'Michael Clark', '1112233513', 'Karen Clark', '2233445633', '3344556744', 'ethan.clark@eee.edu', 'O+', '1005 Maple St', '504 Oak St', 170.00, 'T', 'T', 90.00, 0, 'EEEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0207', 'Fiona Lewis', TO_DATE('2003-06-20', 'YYYY-MM-DD'), 'EEE', 'Daniel Lewis', '1112233514', 'Rachel Lewis', '2233445634', '3344556745', 'fiona.lewis@eee.edu', 'A-', '1006 Maple St', '505 Oak St', 150.00, 'T', 'F', 84.00, 2, 'EEEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0208', 'George Walker', TO_DATE('2003-07-10', 'YYYY-MM-DD'), 'EEE', 'Paul Walker', '1112233515', 'Nancy Walker', '2233445635', '3344556746', 'george.walker@eee.edu', 'B+', '1007 Maple St', '506 Oak St', 180.00, 'T', 'T', 88.00, 1, 'EEEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0209', 'Hannah Young', TO_DATE('2003-08-25', 'YYYY-MM-DD'), 'EEE', 'John Young', '1112233516', 'Margaret Young', '2233445636', '3344556747', 'hannah.young@eee.edu', 'O-', '1008 Maple St', '507 Oak St', 190.00, 'T', 'T', 85.00, 2, 'EEEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0210', 'Isaac Wright', TO_DATE('2003-09-30', 'YYYY-MM-DD'), 'EEE', 'Thomas Wright', '1112233517', 'Jessica Wright', '2233445637', '3344556748', 'isaac.wright@eee.edu', 'AB+', '1009 Maple St', '508 Oak St', 170.00, 'F', 'T', 82.00, 3, 'EEEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0211', 'Jessica Allen', TO_DATE('2003-10-15', 'YYYY-MM-DD'), 'EEE', 'James Allen', '1112233518', 'Helen Allen', '2233445638', '3344556749', 'jessica.allen@eee.edu', 'A+', '1010 Maple St', '509 Oak St', 200.00, 'T', 'F', 88.00, 1, 'EEEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0212', 'Kevin King', TO_DATE('2003-11-20', 'YYYY-MM-DD'), 'EEE', 'Robert King', '1112233519', 'Sara King', '2233445639', '3344556750', 'kevin.king@eee.edu', 'B-', '1011 Maple St', '510 Oak St', 190.00, 'T', 'T', 83.00, 2, 'EEEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0213', 'Laura Scott', TO_DATE('2003-12-25', 'YYYY-MM-DD'), 'EEE', 'David Scott', '1112233520', 'Nancy Scott', '2233445640', '3344556751', 'laura.scott@eee.edu', 'O+', '1012 Maple St', '511 Oak St', 180.00, 'T', 'T', 87.00, 1, 'EEEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0214', 'Mark Green', TO_DATE('2004-01-30', 'YYYY-MM-DD'), 'EEE', 'Paul Green', '1112233521', 'Jessica Green', '2233445641', '3344556752', 'mark.green@eee.edu', 'A-', '1013 Maple St', '512 Oak St', 150.00, 'T', 'F', 84.00, 2, 'EEEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0215', 'Nina Turner', TO_DATE('2004-02-25', 'YYYY-MM-DD'), 'EEE', 'Michael Turner', '1112233522', 'Karen Turner', '2233445642', '3344556753', 'nina.turner@eee.edu', 'O-', '1014 Maple St', '513 Oak St', 200.00, 'T', 'T', 90.00, 1, 'EEEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0216', 'Oscar Rivera', TO_DATE('2004-03-20', 'YYYY-MM-DD'), 'EEE', 'John Rivera', '1112233523', 'Emily Rivera', '2233445643', '3344556754', 'oscar.rivera@eee.edu', 'AB+', '1015 Maple St', '514 Oak St', 160.00, 'F', 'T', 83.00, 3, 'EEEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0217', 'Paula Harris', TO_DATE('2004-04-25', 'YYYY-MM-DD'), 'EEE', 'Thomas Harris', '1112233524', 'Nancy Harris', '2233445644', '3344556755', 'paula.harris@eee.edu', 'B+', '1016 Maple St', '515 Oak St', 190.00, 'T', 'T', 86.00, 2, 'EEEF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0218', 'Quinn Adams', TO_DATE('2004-05-30', 'YYYY-MM-DD'), 'EEE', 'James Adams', '1112233525', 'Jessica Adams', '2233445645', '3344556756', 'quinn.adams@eee.edu', 'O+', '1017 Maple St', '516 Oak St', 200.00, 'T', 'T', 89.00, 0, 'EEEF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0219', 'Rachel Morgan', TO_DATE('2004-06-15', 'YYYY-MM-DD'), 'EEE', 'Robert Morgan', '1112233526', 'Sarah Morgan', '2233445646', '3344556757', 'rachel.morgan@eee.edu', 'A-', '1018 Maple St', '517 Oak St', 170.00, 'T', 'T', 85.00, 1, 'EEEF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0301', 'Alice Brown', TO_DATE('2003-01-12', 'YYYY-MM-DD'), 'Mech', 'David Brown', '1112233527', 'Helen Brown', '2233445647', '3344556758', 'alice.brown@mech.edu', 'O+', '1101 Maple St', '600 Oak St', 150.00, 'T', 'T', 86.00, 1, 'MECHF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0302', 'Bob Wilson', TO_DATE('2003-02-18', 'YYYY-MM-DD'), 'Mech', 'Paul Wilson', '1112233528', 'Nancy Wilson', '2233445648', '3344556759', 'bob.wilson@mech.edu', 'A-', '1102 Maple St', '601 Oak St', 200.00, 'T', 'F', 81.00, 2, 'MECHF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0303', 'Charlie Evans', TO_DATE('2003-03-20', 'YYYY-MM-DD'), 'Mech', 'Robert Evans', '1112233529', 'Jessica Evans', '2233445649', '3344556760', 'charlie.evans@mech.edu', 'B+', '1103 Maple St', '602 Oak St', 180.00, 'T', 'T', 89.00, 1, 'MECHF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0304', 'Diana Taylor', TO_DATE('2003-04-22', 'YYYY-MM-DD'), 'Mech', 'James Taylor', '1112233530', 'Emily Taylor', '2233445650', '3344556761', 'diana.taylor@mech.edu', 'O-', '1104 Maple St', '603 Oak St', 160.00, 'F', 'T', 83.00, 2, 'MECHF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0305', 'Ethan Clark', TO_DATE('2003-05-25', 'YYYY-MM-DD'), 'Mech', 'Michael Clark', '1112233531', 'Karen Clark', '2233445651', '3344556762', 'ethan.clark@mech.edu', 'AB+', '1105 Maple St', '604 Oak St', 170.00, 'T', 'T', 87.00, 1, 'MECHF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0306', 'Fiona Walker', TO_DATE('2003-06-30', 'YYYY-MM-DD'), 'Mech', 'Daniel Walker', '1112233532', 'Rachel Walker', '2233445652', '3344556763', 'fiona.walker@mech.edu', 'A+', '1106 Maple St', '605 Oak St', 200.00, 'T', 'F', 82.00, 3, 'MECHF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0307', 'George Harris', TO_DATE('2003-07-15', 'YYYY-MM-DD'), 'Mech', 'Paul Harris', '1112233533', 'Nancy Harris', '2233445653', '3344556764', 'george.harris@mech.edu', 'B-', '1107 Maple St', '606 Oak St', 180.00, 'T', 'T', 88.00, 1, 'MECHF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0308', 'Hannah Lewis', TO_DATE('2003-08-10', 'YYYY-MM-DD'), 'Mech', 'Thomas Lewis', '1112233534', 'Jessica Lewis', '2233445654', '3344556765', 'hannah.lewis@mech.edu', 'O+', '1108 Maple St', '607 Oak St', 190.00, 'T', 'T', 85.00, 2, 'MECHF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0309', 'Isaac Robinson', TO_DATE('2003-09-05', 'YYYY-MM-DD'), 'Mech', 'James Robinson', '1112233535', 'Emily Robinson', '2233445655', '3344556766', 'isaac.robinson@mech.edu', 'A-', '1109 Maple St', '608 Oak St', 150.00, 'F', 'T', 83.00, 3, 'MECHF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0310', 'Jessica Martinez', TO_DATE('2003-10-20', 'YYYY-MM-DD'), 'Mech', 'Robert Martinez', '1112233536', 'Sara Martinez', '2233445656', '3344556767', 'jessica.martinez@mech.edu', 'B+', '1110 Maple St', '609 Oak St', 170.00, 'T', 'T', 86.00, 2, 'MECHF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0311', 'Kevin Young', TO_DATE('2003-11-15', 'YYYY-MM-DD'), 'Mech', 'Paul Young', '1112233537', 'Nancy Young', '2233445657', '3344556768', 'kevin.young@mech.edu', 'O-', '1111 Maple St', '610 Oak St', 200.00, 'T', 'F', 80.00, 3, 'MECHF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0312', 'Laura King', TO_DATE('2003-12-10', 'YYYY-MM-DD'), 'Mech', 'Michael King', '1112233538', 'Karen King', '2233445658', '3344556769', 'laura.king@mech.edu', 'AB-', '1112 Maple St', '611 Oak St', 180.00, 'T', 'T', 84.00, 1, 'MECHF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0313', 'Mark Wright', TO_DATE('2004-01-25', 'YYYY-MM-DD'), 'Mech', 'David Wright', '1112233539', 'Jessica Wright', '2233445659', '3344556770', 'mark.wright@mech.edu', 'A+', '1113 Maple St', '612 Oak St', 150.00, 'T', 'T', 87.00, 1, 'MECHF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0314', 'Nina Adams', TO_DATE('2004-02-15', 'YYYY-MM-DD'), 'Mech', 'Thomas Adams', '1112233540', 'Emily Adams', '2233445660', '3344556771', 'nina.adams@mech.edu', 'B-', '1114 Maple St', '613 Oak St', 160.00, 'T', 'T', 85.00, 2, 'MECHF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0315', 'Oscar Scott', TO_DATE('2004-03-10', 'YYYY-MM-DD'), 'Mech', 'John Scott', '1112233541', 'Nancy Scott', '2233445661', '3344556772', 'oscar.scott@mech.edu', 'O+', '1115 Maple St', '614 Oak St', 200.00, 'T', 'F', 82.00, 2, 'MECHF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0316', 'Paula Baker', TO_DATE('2004-04-20', 'YYYY-MM-DD'), 'Mech', 'Robert Baker', '1112233542', 'Jessica Baker', '2233445662', '3344556773', 'paula.baker@mech.edu', 'A-', '1116 Maple St', '615 Oak St', 190.00, 'T', 'T', 86.00, 1, 'MECHF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0317', 'Quinn Turner', TO_DATE('2004-05-25', 'YYYY-MM-DD'), 'Mech', 'Paul Turner', '1112233543', 'Sara Turner', '2233445663', '3344556774', 'quinn.turner@mech.edu', 'B+', '1117 Maple St', '616 Oak St', 170.00, 'F', 'T', 89.00, 0, 'MECHF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0318', 'Rachel Green', TO_DATE('2004-06-30', 'YYYY-MM-DD'), 'Mech', 'Thomas Green', '1112233544', 'Nancy Green', '2233445664', '3344556775', 'rachel.green@mech.edu', 'O-', '1118 Maple St', '617 Oak St', 150.00, 'T', 'T', 82.00, 2, 'MECHF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0319', 'Sam Martinez', TO_DATE('2004-07-15', 'YYYY-MM-DD'), 'Mech', 'David Martinez', '1112233545', 'Karen Martinez', '2233445665', '3344556776', 'sam.martinez@mech.edu', 'AB+', '1119 Maple St', '618 Oak St', 180.00, 'T', 'F', 84.00, 3, 'MECHF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0320', 'Tina Robinson', TO_DATE('2004-08-25', 'YYYY-MM-DD'), 'Mech', 'John Robinson', '1112233546', 'Jessica Robinson', '2233445666', '3344556777', 'tina.robinson@mech.edu', 'A+', '1120 Maple St', '619 Oak St', 190.00, 'T', 'T', 88.00, 1, 'MECHF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0401', 'Alice Williams', TO_DATE('2003-01-10', 'YYYY-MM-DD'), 'CIVIL', 'David Williams', '1112233577', 'Helen Williams', '2233445687', '3344556788', 'alice.williams@civil.edu', 'O+', '1201 Maple St', '700 Oak St', 150.00, 'T', 'T', 85.00, 1, 'CIVILF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0402', 'Bob Johnson', TO_DATE('2003-02-15', 'YYYY-MM-DD'), 'CIVIL', 'Paul Johnson', '1112233578', 'Nancy Johnson', '2233445688', '3344556789', 'bob.johnson@civil.edu', 'A-', '1202 Maple St', '701 Oak St', 200.00, 'T', 'F', 80.00, 2, 'CIVILF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0403', 'Charlie Brown', TO_DATE('2003-03-20', 'YYYY-MM-DD'), 'CIVIL', 'Robert Brown', '1112233579', 'Jessica Brown', '2233445689', '3344556790', 'charlie.brown@civil.edu', 'B+', '1203 Maple St', '702 Oak St', 180.00, 'T', 'T', 88.00, 1, 'CIVILF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0404', 'Diana Davis', TO_DATE('2003-04-25', 'YYYY-MM-DD'), 'CIVIL', 'James Davis', '1112233580', 'Emily Davis', '2233445690', '3344556791', 'diana.davis@civil.edu', 'O-', '1204 Maple St', '703 Oak St', 160.00, 'F', 'T', 84.00, 2, 'CIVILF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0405', 'Ethan Miller', TO_DATE('2003-05-30', 'YYYY-MM-DD'), 'CIVIL', 'Michael Miller', '1112233581', 'Karen Miller', '2233445691', '3344556792', 'ethan.miller@civil.edu', 'AB+', '1205 Maple St', '704 Oak St', 170.00, 'T', 'T', 87.00, 1, 'CIVILF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0406', 'Fiona Wilson', TO_DATE('2003-06-15', 'YYYY-MM-DD'), 'CIVIL', 'Daniel Wilson', '1112233582', 'Rachel Wilson', '2233445692', '3344556793', 'fiona.wilson@civil.edu', 'A+', '1206 Maple St', '705 Oak St', 200.00, 'T', 'F', 82.00, 3, 'CIVILF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0407', 'George Taylor', TO_DATE('2003-07-20', 'YYYY-MM-DD'), 'CIVIL', 'Paul Taylor', '1112233583', 'Nancy Taylor', '2233445693', '3344556794', 'george.taylor@civil.edu', 'B-', '1207 Maple St', '706 Oak St', 180.00, 'T', 'T', 89.00, 1, 'CIVILF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0408', 'Hannah Martinez', TO_DATE('2003-08-25', 'YYYY-MM-DD'), 'CIVIL', 'Thomas Martinez', '1112233584', 'Jessica Martinez', '2233445694', '3344556795', 'hannah.martinez@civil.edu', 'O+', '1208 Maple St', '707 Oak St', 190.00, 'T', 'T', 85.00, 2, 'CIVILF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0409', 'Isaac Garcia', TO_DATE('2003-09-10', 'YYYY-MM-DD'), 'CIVIL', 'James Garcia', '1112233585', 'Emily Garcia', '2233445695', '3344556796', 'isaac.garcia@civil.edu', 'A-', '1209 Maple St', '708 Oak St', 150.00, 'F', 'T', 83.00, 3, 'CIVILF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0410', 'Jessica Martinez', TO_DATE('2003-10-05', 'YYYY-MM-DD'), 'CIVIL', 'Robert Martinez', '1112233586', 'Sara Martinez', '2233445696', '3344556797', 'jessica.martinez@civil.edu', 'B+', '1210 Maple St', '709 Oak St', 170.00, 'T', 'T', 86.00, 2, 'CIVILF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0411', 'Kevin Anderson', TO_DATE('2003-11-20', 'YYYY-MM-DD'), 'CIVIL', 'Paul Anderson', '1112233587', 'Nancy Anderson', '2233445697', '3344556798', 'kevin.anderson@civil.edu', 'O-', '1211 Maple St', '710 Oak St', 200.00, 'T', 'F', 80.00, 3, 'CIVILF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0412', 'Laura Hernandez', TO_DATE('2003-12-15', 'YYYY-MM-DD'), 'CIVIL', 'Michael Hernandez', '1112233588', 'Karen Hernandez', '2233445698', '3344556799', 'laura.hernandez@civil.edu', 'AB-', '1212 Maple St', '711 Oak St', 180.00, 'T', 'T', 84.00, 1, 'CIVILF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0413', 'Mark Robinson', TO_DATE('2004-01-10', 'YYYY-MM-DD'), 'CIVIL', 'David Robinson', '1112233589', 'Jessica Robinson', '2233445700', '3344556800', 'mark.robinson@civil.edu', 'A+', '1213 Maple St', '712 Oak St', 150.00, 'T', 'T', 87.00, 1, 'CIVILF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0414', 'Nina Wright', TO_DATE('2004-02-20', 'YYYY-MM-DD'), 'CIVIL', 'Thomas Wright', '1112233590', 'Emily Wright', '2233445701', '3344556801', 'nina.wright@civil.edu', 'B-', '1214 Maple St', '713 Oak St', 160.00, 'T', 'T', 85.00, 2, 'CIVILF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0415', 'Oscar King', TO_DATE('2004-03-15', 'YYYY-MM-DD'), 'CIVIL', 'John King', '1112233591', 'Nancy King', '2233445702', '3344556802', 'oscar.king@civil.edu', 'O+', '1215 Maple St', '714 Oak St', 200.00, 'T', 'F', 82.00, 2, 'CIVILF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0416', 'Paula Thompson', TO_DATE('2004-04-20', 'YYYY-MM-DD'), 'CIVIL', 'Robert Thompson', '1112233592', 'Jessica Thompson', '2233445703', '3344556803', 'paula.thompson@civil.edu', 'A-', '1216 Maple St', '715 Oak St', 190.00, 'T', 'T', 86.00, 1, 'CIVILF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0417', 'Quinn Green', TO_DATE('2004-05-30', 'YYYY-MM-DD'), 'CIVIL', 'Paul Green', '1112233593', 'Sara Green', '2233445704', '3344556804', 'quinn.green@civil.edu', 'B+', '1217 Maple St', '716 Oak St', 170.00, 'F', 'T', 89.00, 0, 'CIVILF002', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0418', 'Rachel Adams', TO_DATE('2004-06-25', 'YYYY-MM-DD'), 'CIVIL', 'Thomas Adams', '1112233594', 'Nancy Adams', '2233445705', '3344556805', 'rachel.adams@civil.edu', 'O-', '1218 Maple St', '717 Oak St', 150.00, 'T', 'T', 82.00, 2, 'CIVILF003', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
 ('22B81A0419', 'Sam Harris', TO_DATE('2004-07-10', 'YYYY-MM-DD'), 'CIVIL', 'David Harris', '1112233595', 'Karen Harris', '2233445706', '3344556806', 'sam.harris@civil.edu', 'AB+', '1219 Maple St', '718 Oak St', 180.00, 'T', 'F', 84.00, 3, 'CIVILF001', 'I');
INSERT INTO Student (RollNo, Name, DOB, Dept, FatherName, FatherContactNumber, MotherName, MotherContactNumber, StudentContactNumber, StudentEmail, BloodGroup, PresentAddress, PermanentAddress, FeePendingAmount, ExamFeePaid, TodayPresent, LatestAttendancePercentage, NumberOfBacklogs, MentorID, AcademicYear)
VALUES
('22B81A0420', 'Tina Lewis', TO_DATE('2004-08-15', 'YYYY-MM-DD'), 'CIVIL', 'John Lewis', '1112233596', 'Jessica Lewis', '2233445707', '3344556807', 'tina.lewis@civil.edu', 'A+', '1220 Maple St', '719 Oak St', 190.00, 'T', 'T', 88.00, 1, 'CIVILF002', 'I');
