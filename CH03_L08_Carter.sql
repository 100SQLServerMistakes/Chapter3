DECLARE @EmployeeID INT ;

SET @EmployeeID = 22

; WITH EmployeeCTE AS  
(  
   SELECT 
       employeeid
     , firstname
     , lastname
     , managerid
	 , Role
     , 0 as Level
   FROM Employees 
   WHERE EmployeeID = @EmployeeID
   UNION ALL  
   SELECT 
       emp.EmployeeID
     , emp.FirstName
     , emp.LastName
     , emp.ManagerID
     , emp.Role
     , Level + 1
   FROM employees emp
   INNER JOIN EmployeeCTE cte 
      ON emp.EmployeeID = cte.ManagerID  
)

SELECT 
    firstname
  , lastname
  , Role 
FROM EmployeeCTE 
WHERE Level = 2 ;
