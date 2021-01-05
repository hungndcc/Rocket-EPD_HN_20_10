<<<<<<< HEAD
DROP DATABASE if exists TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;


CREATE TABLE Department (
	DepartmentID 		TINYINT 			AUTO_INCREMENT,
    DepartmentName 		VARCHAR(50) 		NOT NULL,
    PRIMARY KEY (DepartmentID)
);  

CREATE TABLE `Position`(
	PositionID 			TINYINT UNSIGNED 	AUTO_INCREMENT,
    PositionName 		VARCHAR(55) 	NOT NULL,
    PRIMARY KEY (PositionID)
);

CREATE TABLE `Account`(
	AccountID 			TINYINT 		NOT NULL		AUTO_INCREMENT,
    Username 			VARCHAR(50) 	NOT NULL		UNIQUE,
    Email 				VARCHAR(255) 	NOT NULL		UNIQUE,
    Fullname 			VARCHAR(50) 	NOT NULL,
    DepartmentID 		TINYINT,
    PositionID 			TINYINT ,
    CreateDate 			DATE,
    FOREIGN KEY (DepartmentID) 			REFERENCES Department(DepartmentID),
    PRIMARY KEY (AccountID)
);

CREATE TABLE `Group`(
	GroupID 			TINYINT 					AUTO_INCREMENT,
	GroupName 			VARCHAR(50)		NOT NULL,
	CreatorID 			TINYINT 		NOT NULL,
	CreateDate 			DATE,
    FOREIGN KEY (CreatorID) 			REFERENCES `Account`(AccountID),
    PRIMARY KEY (GroupID)
);

CREATE TABLE GroupAccount(
	GroupID 			TINYINT 		NOT NULL,
    AccountID 			TINYINT 		NOT NULL,
    JoinDate 			DATE,
	FOREIGN KEY (GroupID) 				REFERENCES `Group`(GroupID),
	FOREIGN KEY (AccountID) 			REFERENCES `Account`(AccountID)
);

CREATE TABLE TypeQuestion(
	TypeID 				TINYINT  		NOT NULL	AUTO_INCREMENT,
    TypeName 			VARCHAR(50),
    PRIMARY KEY (TypeID)
);

CREATE TABLE CategoryQuestion(
	CategoryID 			TINYINT 		NOT NULL	AUTO_INCREMENT,
    CategoryName 		VARCHAR(55),
    PRIMARY KEY (CategoryID) 
) ;
CREATE TABLE Question(
	QuestionID 			TINYINT 		NOT NULL	AUTO_INCREMENT,
    Content 			VARCHAR(255),
    CategoryID 			TINYINT 		NOT NULL,
    TypeID 				TINYINT			NOT NULL,
    CreatorID 			TINYINT 		NOT NULL,
    CreateDate 			DATE,
	FOREIGN KEY (CategoryID) 			REFERENCES CategoryQuestion(CategoryID),
	FOREIGN KEY (TypeID) 				REFERENCES TypeQuestion(TypeID),
	FOREIGN KEY (CreatorID) 			REFERENCES `Account`(AccountID),
    PRIMARY KEY (QuestionID)
);
CREATE TABLE	Answer(
	AnswerID			TINYINT			NOT NULL	AUTO_INCREMENT,
    Content				VARCHAR(255),
    QuestionID			TINYINT			NOT NULL,
    isCorrect			TINYINT			NOT NULL,
    PRIMARY KEY	(AnswerID),
    FOREIGN KEY	(QuestionID)			REFERENCES Question(QuestionID)
);

CREATE TABLE Exam(
	ExamID 				TINYINT			NOT NULL	AUTO_INCREMENT,
    `Code`				VARCHAR(50),
    Title 				VARCHAR(50),
    CategoryID 			TINYINT 		NOT NULL,
    Duration 			TINYINT,
    CreatorID 			TINYINT 		NOT NULL,
    CreateDate 			DATE,
	FOREIGN KEY (CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
	FOREIGN KEY (CreatorID) 	REFERENCES `Account`(AccountID),
	PRIMARY KEY (ExamID)
);

CREATE TABLE ExamQuestion(
	ExamID 				TINYINT,
    QuestionID 			TINYINT,
	FOREIGN KEY (ExamID) 		REFERENCES Exam(ExamID),
	FOREIGN KEY (QuestionID) 	REFERENCES Question(QuestionID)
);

INSERT INTO Department 
VALUES		('1',		'Marketing'		),
			('2',		'Sale'			),
            ('3',		'Bảo vệ'		),
            ('4',		'Nhân sự'		),
            ('5',		'Kỹ thuật'		),
            ('6',		'Tài chính'		),
            ('7',		'Phó giám đốc'	),
            ('8',		'Giám đốc'		),
            ('9',		'Thư kí'		),
            ('10',		'Bán hàng'		);
            
INSERT INTO Position
VALUES 		('1',	'Dev'			),
			('2',	'Test'			),
			('3',	'Sctrum Master'	),
			('4',	'PM'			);
            
INSERT INTO `Account` 	(AccountID   	 ,Username       			,Email									,Fullname      			,DepartmentID		,PositionID		,CreateDate		)

VALUES 					
                        (1,      		'hungndcc',   				'hungndcc@gmail.com',      				'Nguyễn Quốc Hùng',		'1',				4,    			'2020-03-05'),      
						(2,      		'phucndcc',   				'minhphuc18@gmail.com',      			'Đoàn Minh Phúc'  ,   	'2',				1,				'2020-03-06'),                         
						(3,      		'phuongk',   				'vuongducphuong@gmail.com',     		'Vương Đức Phương',   	'3',				3,				'2020-04-02'),                         
						(4,				'ninhdelta',  				'ninh.delta@gmail.com',      			'Lê Quang Ninh'   ,   	'4',				2,				'2020-05-05'),                         
						(5,      		'nvhvt1992',  				'nvhvt1992@gmail.com',      			'Nguyễn Vĩnh Hà',    	'5',				1,				'2020-06-15'),                         
						(6,      		'chuong9',   				'chuongcao99@gmail.com',     			'Cao Thế Chương',    	'6',				2,				'2020-03-23'),                         
						(7,      		'kaidinh97',  				'vudk97@gmail.com',       				'Vũ Đình Khải',     	'7',				3,				'2020-07-05'),                         
						(8,      		'tintin',   				'tintin@gmail.com',      				'Đặng Đức Tin',     	'8',				1,				'2020-01-05'),                         
						(9,      		'phuong2k',   				'phuong2k@gmail.com',      				'Nguyễn Thu Phương',  	'1',				2,				'2020-02-12'),                         
						(10,     		'caixedap',   				'xuanteo@gmail.com',      				'Cao Xuan Hoan',  		'2',				3,				'2020-06-1'	);
                        
INSERT INTO `Group`	( GroupName				,CreatorID		,CreateDate)
VALUES				(N'Testing System'		,'5'			,'2019-03-05'),
					(N'Developement'		,'1'			,'2020-03-07'),
                    (N'VTI Sale 01'			,'2'			,'2020-03-09'),
                    (N'VTI Sale 02'			,'3'			,'2020-03-10'),
                    (N'VTI Sale 02'			,'4'			,'2020-03-28'),
                    (N'VTI Creator'			,'6'			,'2020-04-06'),
                    (N'VTI Marketing 01'	,'7'			,'2020-07-07'),
                    (N'Management'			,'8'			,'2020-04-08'),
                    (N'Chat with love'		,'9'			,'2020-04-09'),
                    (N'Vi Ti Ai'			,'10'			,'2020-04-10');
INSERT INTO GroupAccount	(	GroupID		,AccountID		,JoinDate		)
VALUES						(		'1'		,	'1'			,'2019-03-05'	),
							(		'2'		,	'2'			,'2019-03-07'	),
                            (		'3'		,	'3'			,'2019-03-09'	),
                            (		'4'		,	'4'			,'2019-03-10'	),
                            (		'5'		,	'5'			,'2019-03-28'	),
                            (		'6'		,	'6'			,'2019-04-06'	),
                            (		'7'		,	'7'			,'2019-04-07'	),
                            (		'8'		,	'1'			,'2019-04-08'	),
                            (		'9'		,	'9'			,'2019-04-09'	),
                            (		'10'	,	'10'		,'2019-04-10'	);
                            
INSERT INTO typequestion 	(TypeID 		,TypeName			)
VALUES						('1'			,'Essay'			),
							('2' 			,'Multiple-Choice'	);
INSERT INTO	categoryquestion(CategoryID				,CategoryName		)
VALUES						('1'					,'Java'				),                    
							('2'					,'ASP.NET'			),
                            ('3'					,'ADO.NET'			),
                            ('4'					,'SQL'				),
                            ('5'					,'Postman'			),
                            ('6'					,'Ruby'				),
                            ('7'					,'C Sharp'			),
                            ('8'					,'PHP'				);
INSERT INTO Question 		(QuestionID				,Content				,CategoryID		,TypeID		,CreatorID		,CreateDate		)
VALUES						('1'					,'Câu hỏi về Java Câu hỏi về JavaCâu hỏi về JavaCâu hỏi về JavaCâu hỏi về Java'		,	'1'			,	'1'		,	'1'			,'2020-04-05'	),
							('2'					,'Câu hỏi về PHP Câu hỏi về PHPCâu hỏi về PHPCâu hỏi về PHPCâu hỏi về PHP'		,	'8'			,	'2'		,	'2'			,'2020-04-05'	),
							('3'					,'Câu hỏi về Ruby'		,	'6'			,	'1'		,	'4'			,'2020-04-06'	),
                            ('4'					,'Câu hỏi về Postman'	,	'5'			,	'1'		,	'5'			,'2020-04-06'	),
                            ('5'					,'Câu hỏi về ADO.NET'	,	'3'			,	'2'		,	'6'			,'2020-04-06'	),
                            ('6'					,'Câu hỏi về ASP.NET'	,	'2'			,	'1'		,	'7'			,'2020-04-06'	),
                            ('7'					,'Câu hỏi về SQL'		,	'4'			,	'2'		,	'9'			,'2020-04-07'	),
                            ('8'					,'Câu hỏi về Python'	,	'7'			,	'1'		,	'10'		,'2020-04-07'	);

INSERT INTO Answer			(AnswerID			,Content			,QuestionID			,isCorrect	)
VALUES						('1'				,'Trả lời 01Trả lời 01Trả lời 01Trả lời 01Trả lời 01Trả lời 01'		,	1				,	0		),
                            ('2'				,'Trả lời 02Trả lời 02Trả lời 02Trả lời 02Trả lời 02Trả lời 02'		,	1				,	1		),
                            ('3'				,'Trả lời 03'		,	1				,	0		),
                            ('4'				,'Trả lời 04'		,	1				,	1		),
                            ('5'				,'Trả lời 05'		,	2				,	1		),
                            ('6'				,'Trả lời 06'		,	3				,	1		),
                            ('7'				,'Trả lời 07'		,	4				,	0		),
                            ('8'				,'Trả lời 08'		,	8				,	0		),
                            ('9'				,'Trả lời 09'		,	7				,	1		),
                            ('10'				,'Trả lời 10'		,	5				,	1		); 

INSERT INTO	Exam			(ExamID				,`Code`			,Title				,CategoryID		,Duration		,CreatorID		,CreateDate			)
VALUES						('1'				,'VTIQ001'		,'Đề thi Java'		,	'1'			,	60			,	'5'			,'2019-04-05'		),
                            ('2'				,'VTIQ002'		,'Đề thi SQL'		,	'7'			,	60			,	'1'			,'2019-04-05'		),
                            ('3'				,'VTIQ003'		,'Đề thi Ruby'		,	'6'			,	60			,	'3'			,'2020-04-08'		),
                            ('4'				,'VTIQ004'		,'Đề thi Postman'	,	'5'			,	120			,	'4'			,'2020-04-10'		),
                            ('5'				,'VTIQ005'		,'Đề thi ADO.NET'	,	'3'			,	60			,	'6'			,'2020-04-05'		),
                            ('6'				,'VTIQ006'		,'Đề thi ASP.NET'	,	'2'			,	60			,	'7'			,'2020-04-05'		),
                            ('7'				,'VTIQ007'		,'Đề thi PHP'		,	'8'			,	60			,	'8'			,'2020-04-07'		),
                            ('8'				,'VTIQ008'		,'Đề thi Postman'	,	'4'			,	90			,	'9'			,'2020-04-07'		);
INSERT INTO ExamQuestion	(ExamID			,QuestionID)
VALUES						('1'			,'1'),
							('2'			,'2'),
                            ('3'			,'3'),
                            ('4'			,'4'),
                            ('5'			,'5'),
                            ('6'			,'6'),
                            ('7'			,'7'),
                            ('8'			,'8');
                            
						
                            
                            


=======
/*============================== CREATE DATABASE =======================================*/
/*======================================================================================*/
DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;

/*============================== CREATE TABLE=== =======================================*/
/*======================================================================================*/

-- create table 1: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 			NVARCHAR(30) NOT NULL UNIQUE KEY
);

-- create table 2: Posittion
DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
	PositionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName			ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

-- create table 3: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email					VARCHAR(50) NOT NULL UNIQUE KEY,
    Username				VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName				NVARCHAR(50) NOT NULL,
    DepartmentID 			TINYINT UNSIGNED NOT NULL,
    PositionID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- create table 4: Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName				NVARCHAR(50) NOT NULL UNIQUE KEY,
    CreatorID				TINYINT UNSIGNED,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- create table 5: GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID					TINYINT UNSIGNED NOT NULL,
    AccountID				TINYINT UNSIGNED NOT NULL,
    JoinDate				DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID,AccountID),
    FOREIGN KEY(GroupID) 		REFERENCES `Group`(GroupID) 
);

-- create table 6: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName 		ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);

-- create table 7: CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
    CategoryID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName			NVARCHAR(50) NOT NULL UNIQUE KEY
);

-- create table 8: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(100) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    TypeID					TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) 		REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountId) 
);

-- create table 9: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
    AnswerID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(100) NOT NULL,
    QuestionID				TINYINT UNSIGNED NOT NULL,
    isCorrect				BIT DEFAULT 1,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

-- create table 10: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
    ExamID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`					CHAR(10) NOT NULL,
    Title					NVARCHAR(50) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    Duration				TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- create table 11: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
    ExamID				TINYINT UNSIGNED NOT NULL,
	QuestionID			TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
    PRIMARY KEY (ExamID,QuestionID)
);

/*============================== INSERT DATABASE =======================================*/
/*======================================================================================*/
-- Add data Department
INSERT INTO Department(DepartmentName) 
VALUES
						(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);
    
-- Add data position
INSERT INTO Position	(PositionName	) 
VALUES 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			); 


-- Add data Account
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('haidang29productions@gmail.com'	, 'dangblack'		,'Nguyễn hải Đăng'		,   '5'			,   '1'		,'2020-03-05'),
					('account1@gmail.com'				, 'quanganh'		,'Nguyen Chien Thang2'	,   '1'			,   '2'		,'2020-03-05'),
                    ('account2@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   '2'			,   '3'		,'2020-03-07'),
                    ('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   '3'			,   '4'		,'2020-03-08'),
                    ('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang1'	,   '4'			,   '4'		,'2020-03-10'),
                    ('dapphatchetngay@gmail.com'		, 'khabanh'			,'Ngo Ba Kha'			,   '6'			,   '3'		,'2020-04-05'),
                    ('songcodaoly@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '7'			,   '2'		, NULL		),
                    ('sontungmtp@gmail.com'				, 'tungnui'			,'Nguyen Thanh Tung'	,   '8'			,   '1'		,'2020-04-07'),
                    ('duongghuu@gmail.com'				, 'duongghuu'		,'Duong Van Huu'		,   '9'			,   '2'		,'2020-04-07'),
                    ('vtiaccademy@gmail.com'			, 'vtiaccademy'		,'Vi Ti Ai'				,   '10'		,   '1'		,'2020-04-09');

-- Add data Group
INSERT INTO `Group`	(  GroupName			, CreatorID		, CreateDate)
VALUES 				(N'Testing System'		,   5			,'2019-03-05'),
					(N'Development'			,   1			,'2020-03-07'),
                    (N'VTI Sale 01'			,   2			,'2020-03-09'),
                    (N'VTI Sale 02'			,   3			,'2020-03-10'),
                    (N'VTI Sale 03'			,   4			,'2020-03-28'),
                    (N'VTI Creator'			,   6			,'2020-04-06'),
                    (N'VTI Marketing 01'	,   7			,'2020-04-07'),
                    (N'Management'			,   8			,'2020-04-08'),
                    (N'Chat with love'		,   9			,'2020-04-09'),
                    (N'Vi Ti Ai'			,   10			,'2020-04-10');

-- Add data GroupAccount
INSERT INTO `GroupAccount`	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	1		,    1		,'2019-03-05'),
							(	1		,    2		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	3		,    4		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	1		,    3		,'2020-04-06'),
							(	1		,    7		,'2020-04-07'),
							(	8		,    3		,'2020-04-08'),
							(	1		,    9		,'2020-04-09'),
							(	10		,    10		,'2020-04-10');


-- Add data TypeQuestion
INSERT INTO TypeQuestion	(TypeName			) 
VALUES 						('Essay'			), 
							('Multiple-Choice'	); 


-- Add data CategoryQuestion
INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 								('Java'			),
									('ASP.NET'		),
									('ADO.NET'		),
									('SQL'			),
									('Postman'		),
									('Ruby'			),
									('Python'		),
									('C++'			),
									('C Sharp'		),
									('PHP'			);
													
-- Add data Question
INSERT INTO Question	(Content			, CategoryID, TypeID		, CreatorID	, CreateDate )
VALUES 					(N'Câu hỏi về Java ',	1		,   '1'			,   '2'		,'2020-04-05'),
						(N'Câu Hỏi về PHP'	,	10		,   '2'			,   '2'		,'2020-04-05'),
						(N'Hỏi về C#'		,	9		,   '2'			,   '3'		,'2020-04-06'),
						(N'Hỏi về Ruby'		,	6		,   '1'			,   '4'		,'2020-04-06'),
						(N'Hỏi về Postman'	,	5		,   '1'			,   '5'		,'2020-04-06'),
						(N'Hỏi về ADO.NET'	,	3		,   '2'			,   '6'		,'2020-04-06'),
						(N'Hỏi về ASP.NET'	,	2		,   '1'			,   '7'		,'2020-04-06'),
						(N'Hỏi về C++'		,	8		,   '1'			,   '8'		,'2020-04-07'),
						(N'Hỏi về SQL'		,	4		,   '2'			,   '9'		,'2020-04-07'),
						(N'Hỏi về Python'	,	7		,   '1'			,   '10'	,'2020-04-07');

-- Add data Answers
INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		),
                    (N'Trả lời 06'	,   3			,	1		),
                    (N'Trả lời 07'	,   4			,	0		),
                    (N'Trả lời 08'	,   8			,	0		),
                    (N'Trả lời 09'	,   9			,	1		),
                    (N'Trả lời 10'	,   10			,	1		);
	
-- Add data Exam
INSERT INTO Exam	(`Code`			, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('VTIQ001'		, N'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('VTIQ002'		, N'Đề thi PHP'			,	10			,	60		,   '2'			,'2019-04-05'),
                    ('VTIQ003'		, N'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
                    
                    
-- Add data ExamQuestion
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		5		),
						(	2	,		10		), 
						(	3	,		4		), 
						(	4	,		3		), 
						(	5	,		7		), 
						(	6	,		10		), 
						(	7	,		2		), 
						(	8	,		10		), 
						(	9	,		9		), 
						(	10	,		8		); 
>>>>>>> 95c19a66cab20716376d6b166cf0255b58a43f3b
