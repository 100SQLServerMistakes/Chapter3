SELECT
      e.EmployeeID 'EmployeeID'
    , e.FirstName 'FirstName'
    , e.LastName 'LastName'
    , e.DateOfBirth 'DateOfBirth'
    , (
	    SELECT 
             ch.ContractStartDate 'StartDate'
           , ch.ContractEndDate 'EndDate'
           , (
                SELECT
                    s.Skill 'Skill'
		    FROM Skills s
		    INNER JOIN ContractSkills cs
		        ON s.SkillsID = cs.SkillID 
                   WHERE cs.ContractHistoryID = ch.ContractHistoryID
                   FOR XML PATH(''), TYPE, ROOT('Skills')
        )
        FROM ContractHistory ch
        WHERE EmployeeID = e.EmployeeID
        FOR XML PATH('Contract'), TYPE, ROOT('Contracts')
    )
FROM Employees e
WHERE EmployeeID = 23
FOR XML PATH('Employee'), ROOT('EmployeeContracts') ;
