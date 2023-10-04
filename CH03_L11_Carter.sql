DECLARE @Manager HIERARCHYID ;  

SELECT @Manager = ManagerHierarchyID  
FROM Employees
WHERE EmployeeID = 2 ;  

SELECT
      EmployeeID
    , FirstName
    , LastName
    , ManagerHierarchyID.ToString()
FROM Employees
WHERE ManagerHierarchyID.IsDescendantOf(@Manager) = 1 ;
