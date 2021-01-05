DROP DATABASE IF EXISTS FresherTrainingManagement;
CREATE DATABASE FresherTrainingManagement;

USE 	FresherTrainingManagement;

CREATE TABLE	Trainee (
	TraineeID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FUll_Name			VARCHAR(50) NOT NULL,
    Birth_Date			DATE NOT NULL,
    Gender				ENUM('male','female','unknow') NOT NULL,
    ET_IQ				TINYINT(20)	UNSIGNED NOT NULL,
    ET_Gmath			TINYINT(20)	UNSIGNED NOT NULL,
    ET_English			TINYINT(50)	UNSIGNED NOT NULL,
    TrainingClass		VARCHAR(10) NOT NULL,
    Evalunation_Notes	NVARCHAR(500) NOT NULL
);

ALTER TABLE		Trainee
ADD				VTI_Account	VARCHAR(50) UNIQUE NOT NULL;

