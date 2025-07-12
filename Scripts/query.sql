 SELECT * FROM employee;

 SELECT model, EngineType FROM model LIMIT 5;

 SELECT sql FROM sqlite_schema WHERE name= 'employee';

 SELECT emp.firstName,
        emp.lastName,
        emp.title,
        mng.firstName AS ManagerFirstName,
        mng.lastName AS ManagerLastName
  FROM employee emp 
  INNER JOIN employee mng 
  ON emp.managerId = mng.employeeId;

  SELECT emp.firstName,
         emp.lastName,
         emp.startDate,
         emp.title,
         sal.salesAmount,
         sal.salesId
  FROM employee emp 
  LEFT JOIN sales sal 
  ON emp.employeeId = sal.employeeId
  WHERE emp.title = 'Sales Person' AND
  sal.salesId IS NULL;
-------- SQL server (full outer join) is not there so will use union to combine 3 queries.
  SELECT sal.salesId,
         sal.salesAmount,
         cust.firstName,
         cust.customerId,
         cust.city
  FROM customer cust 
  OUTER FULL JOIN sales sal 
  ON cust.customerId = sal.salesId;

---------------------------
  SELECT cust.firstName,
         cust.lastName,
         cust.customerId,
         sal.salesId,
         sal.salesAmount,
         sal.soldDate
FROM customer cust 
INNER JOIN sales sal 
ON cust.customerId = sal.customerId
UNION
SELECT cust.firstName,
         cust.lastName,
         cust.customerId,
         sal.salesId,
         sal.salesAmount,
         sal.soldDate
FROM customer cust
LEFT JOIN sales sal 
ON cust.customerId = sal.customerId
WHERE sal.salesId ISNULL
UNION
SELECT cust.firstName,
         cust.lastName,
         cust.customerId,
         sal.salesId,
         sal.salesAmount,
         sal.soldDate
FROM customer cust 
RIGHT JOIN sales sal 
ON cust.customerId = sal.customerId
WHERE cust.customerId ISNULL;
