use hw5;

#Creating table for results of violation code for restaurants by ZIPCODE.
CREATE TABLE results SELECT  restaurants.ZIPCODE, COUNT(restaurants.VIOLATION_CODE) AS NumberofViolations
FROM restaurants GROUP BY ZIPCODE;

#Creating table for results of 311calls by ZIPCODE
CREATE TABLE 311calls_results SELECT 311calls.Incident_Zip, 311calls.Complaint_Type, 
COUNT(311calls.Complaint_Type) AS NumberOf311Complaints
FROM 311calls GROUP BY Incident_Zip;

#Joining my results by ZIPCODE for number of 311 complaints and restaurant violations
CREATE TABLE combined_results
SELECT
	results.ZIPCODE,
	results.NumberofViolations,
    311calls_results.NumberOf311Complaints,
    311calls_results.Complaint_Type
FROM 311calls_results
INNER JOIN results ON 311calls_results.Incident_Zip=results.ZIPCODE;

SELECT * from combined_results;

