DROP DATABASE IF EXISTS FresherTrainingManagement;
CREATE DATABASE FresherTrainingManagement;

USE 	FresherTrainingManagement;

CREATE TABLE	Trainee (
	Trainee_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FUll_Name			VARCHAR(50) NOT NULL,
    Birth_Date			DATE NOT NULL,
    Gender				ENUM('male','female','unknow') NOT NULL,
    ET_IQ				TINYINT(20)	UNSIGNED NOT NULL,
    ET_Gmath			TINYINT(20)	UNSIGNED NOT NULL,
    ET_English			TINYINT(50)	UNSIGNED NOT NULL,
    Training_Class		VARCHAR(10) NOT NULL,
    Evalunation_Notes	NVARCHAR(500) NOT NULL
);

/*
ALTER TABLE		Trainee
ADD				VTI_Account	VARCHAR(50) UNIQUE NOT NULL;
*/
-- Question 1: Thêm ít nhất 10 bản ghi vào table

INSERT INTO Trainee (Full_Name				,Birth_Date		,Gender		,ET_IQ		,ET_Gmath	,ET_English		,Training_Class		,Evalunation_Notes) 
 
VALUES 				('Nguyen Quoc Hung'		,'1997-01-08'	,'male'		,'20'		,'19'		,'40'			,'class_1'			,'note1'),
					('Pham Van Quyet'		,'1998-12-02'	,'male'		,'19'		,'18'		,'50'			,'class_1'			,'note2'),
					('Nguyen Vinh Ha'		,'1998-06-25'	,'male'		,'18'		,'17'		,'30'			,'class_2'			,'note3'),
					('Cao The Chuong'		,'1997-11-22'	,'male'		,'17'		,'16'		,'40'			,'class_3'			,'note4'),
					('Doan Quang Vu'		,'1998-03-20'	,'male'		,'16'		,'15'		,'25'			,'class_4'			,'note5'),
					('Duong Minh Tuyen'		,'1998-10-12'	,'male'		,'17'		,'16'		,'35'			,'class_2'			,'note6'),
					('Nguyen Thu Phuong'	,'1998-07-05'	,'female'	,'18'		,'17'		,'45'			,'class_6'			,'note7'),
					('Le Quang Trau'		,'1997-02-16'	,'female'	,'19'		,'18'		,'44'			,'class_2'			,'note8'),
					('Cao Xuan Teo'			,'1998-11-12'	,'female'	,'20'		,'19'		,'43'			,'class_3'			,'note9'),
					('Phan Van Duc'			,'1998-08-17'	,'female'	,'20'		,'20'		,'42'			,'class_5'			,'note10');
                    
-- 2.  Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,nhóm chúng thành các tháng sinh khác nhau

SELECT *, COUNT(1) AS 'so_luong'
FROM	trainee
WHERE	ET_IQ >= 18 AND ET_Gmath >= 18 AND ET_English >= 3
GROUP BY Birth_Date;

-- 3. Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)

SELECT 	* 
FROM	trainee
WHERE LENGTH(full_name)  = (SELECT MAX(LENGTH(full_name)) FROM trainee);

-- 4. Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
-- ET_IQ + ET_Gmath>=20
-- ET_IQ>=8
-- ET_Gmath>=8
-- ET_English>=18
SELECT 	* 
FROM	trainee
WHERE 	ET_IQ + ET_Gmath>=20 AND ET_IQ>=8 AND ET_Gmath>=8 AND ET_English>=18;

-- 5. xóa thực tập sinh có TraineeID = 3

DELETE FROM Trainee
WHERE	Trainee_ID = 3;

-- 6. Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database

UPDATE 	Trainee
SET		Training_Class = 'Class_2'
WHERE	Trainee_ID = 5;

-- =========================================================================================================================================================================
-- Exercise 2:


-- Question 1:

CREATE TABLE	Department (
	Department_Number 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Department_Name		VARCHAR(50) UNIQUE NOT NULL

);

CREATE TABLE	Employee_Table (
	Employee_Number		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Employee_Name		VARCHAR(50) UNIQUE NOT NULL,
    Department_Number	TINYINT UNSIGNED,
    FOREIGN KEY (Department_Number) REFERENCES	Department(Department_Number)
);

CREATE TABLE	Employee_Skill_Table (
	Employee_Number	TINYINT UNSIGNED NOT NULL,
	Skill_Code		VARCHAR(50) NOT NULL,
    Date_Registered DATE
);

-- Question 2:

INSERT INTO Department (Department_Number	,Department_Name)
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

INSERT INTO Employee_Table (Employee_Number			,Employee_Name			,Department_Number)
VALUES						('1'					,'Nguyen Quoc Hung'		,'2'				),
							('2'					,'Pham Van Quyet'		,'1'				),
							('3'					,'Nguyen Vinh Ha'		,'1'				),
							('4'					,'Cao The Chuong'		,'2'				),
							('5'					,'Doan Quang Vu'		,'1'				),
							('6'					,'Duong Minh Tuyen'		,'4'				),
							('7'					,'Nguyen Thu Phuong'	,'5'				),
							('8'					,'Le Quang Trau'		,'3'				),
							('9'					,'Phan Van Duc'			,'8'				);


INSERT INTO employee_skill_table 	(Employee_Number,		Skill_Code,				Date_Registered)
VALUES								('1',					'Java',					'2019-01-13'),
									('2',					'HTML',					'2019-01-13'),
									('3',					'C',					'2019-01-13'),
									('4',					'C++',					'2018-02-14'),
									('5',					'Python',				'2020-03-13'),
									('6',					'PHP',					'2019-01-13'),
									('7',					'Golang',				'2019-01-13'),
									('8',					'Ruby',					'2019-01-13'),
									('9',					'verilog',				'2019-01-13'),
									('4',					'Assembly',				'2019-01-13'),
									('5',					'Shell',				'2019-01-13'),
									('8',					'.NET',					'2019-01-13');

-- Question 3:

SELECT 	et.Employee_Name
FROM 	Employee_Table et
INNER JOIN	employee_skill_table es ON et.Employee_Number = es.Employee_Number
WHERE 	es.Skill_Code = 'Java';







