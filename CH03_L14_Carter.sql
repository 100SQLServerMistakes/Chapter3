CREATE TABLE ContractHistory (
    ContractHistoryID        SMALLINT    NOT NULL    PRIMARY KEY    IDENTITY,
    EmployeeID               SMALLINT    NOT NULL    REFERENCES dbo.Employees(EmployeeID),
	ContractStartDate    DATE        NOT NULL,
	ContractEndDate      DATE        NOT NULL
) ;

CREATE TABLE Skills (
    SkillsID    SMALLINT    NOT NULL    PRIMARY KEY    IDENTITY,
	Skill       VARCHAR(30) NOT NULL
) ;

CREATE TABLE ContractSkills (
    ContractSkillsID        INT         NOT NULL    PRIMARY KEY    IDENTITY,
	ContractHistoryID   SMALLINT    NOT NULL    REFERENCES dbo.ContractHistory(ContractHistoryID),
	SkillID             SMALLINT    NOT NULL    REFERENCES dbo.Skills(SkillsID)
) ;
