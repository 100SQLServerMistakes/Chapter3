DECLARE @EmployeeID INT ;

SET @EmployeeID = 14 ;

SELECT 
    FirstName
  , LastName
  , Salary
FROM Employees
WHERE ManagerHierarchyID.GetLevel() = (
    SELECT 
	    ManagerHierarchyID.GetLevel()
    FROM Employees
	WHERE EmployeeID = @EmployeeID
) ;
