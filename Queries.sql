select * from customer;

#active policies
SELECT *
FROM insurance_policy
WHERE status='Active';

#customer owns multiple vehicles
SELECT c.customer_id,
       CONCAT(c.first_name,' ',c.last_name) AS customer_name,
       COUNT(v.vehicle_id) AS total_vehicles
FROM customer c
JOIN vehicle v
ON c.customer_id=v.customer_id
GROUP BY c.customer_id
HAVING COUNT(v.vehicle_id)>1;

#Total premium collected
SELECT SUM(amount) AS total_premium
FROM payment
WHERE payment_status='Paid';

#payment pending status
select * from payment
where payment_status ="pending";

SELECT *
FROM payment
WHERE payment_status='Failed';

#payment history
SELECT
c.customer_id,
c.first_name,
p.payment_date,
p.amount,
p.payment_status
FROM customer c
JOIN vehicle v
ON c.customer_id=v.customer_id
JOIN insurance_policy i
ON v.vehicle_id=i.vehicle_id
JOIN payment p
ON i.policy_id=p.policy_id;

#Highest premium policy
SELECT *
FROM insurance_policy
ORDER BY premium_amount DESC
LIMIT 1;

#Lowest Premium Policy
SELECT *
FROM insurance_policy
ORDER BY premium_amount
LIMIT 1;

#approved Claims
select * from claim_details
where claim_status = "Approved";

#pending claims
select * from claim_details
where claim_status = "pending";

select count(claim_id) from claim_details
where claim_status = "pending";

#Rejected claims
SELECT *
FROM claim_details
WHERE claim_status='Rejected';

#Total claim amount paid
SELECT SUM(claim_amount)
FROM claim_details
WHERE claim_status='Approved';

SELECT
c.first_name,
c.last_name,
cd.claim_amount,
cd.claim_status
FROM customer c
JOIN vehicle v
ON c.customer_id=v.customer_id
JOIN insurance_policy i
ON v.vehicle_id=i.vehicle_id
JOIN claim_details cd
ON i.policy_id=cd.policy_id;

SELECT i.policy_id
FROM insurance_policy i
LEFT JOIN claim_details c
ON i.policy_id=c.policy_id
WHERE c.policy_id IS NULL;

SELECT brand,
COUNT(*) total
FROM vehicle
GROUP BY brand;

SELECT
policy_type,
COUNT(*)
FROM insurance_policy
GROUP BY policy_type
ORDER BY COUNT(*) DESC;

#Premium Collected by Payment Method
SELECT
payment_method,
SUM(amount)
FROM payment
WHERE payment_status='Paid'
GROUP BY payment_method;

#Agent-wise Customer Count
SELECT
branch,
COUNT(*) total_agents
FROM agent
GROUP BY branch;

#Customers with More Than One Claim
SELECT
c.customer_id,
COUNT(cd.claim_id) total_claims
FROM customer c
JOIN vehicle v
ON c.customer_id=v.customer_id
JOIN insurance_policy i
ON v.vehicle_id=i.vehicle_id
JOIN claim_details cd
ON i.policy_id=cd.policy_id
GROUP BY c.customer_id
HAVING COUNT(cd.claim_id)>1;

SELECT
MONTH(payment_date) Month_No,
SUM(amount)
FROM payment
WHERE payment_status='Paid'
GROUP BY MONTH(payment_date);

SELECT *
FROM claim_details
ORDER BY claim_amount DESC
LIMIT 10;

SELECT
c.customer_id,
CONCAT(c.first_name,' ',c.last_name) Customer_Name,
v.vehicle_number,
v.brand,
i.policy_number,
i.policy_type,
p.amount,
cd.claim_status
FROM customer c
JOIN vehicle v
ON c.customer_id=v.customer_id
JOIN insurance_policy i
ON v.vehicle_id=i.vehicle_id
LEFT JOIN payment p
ON i.policy_id=p.policy_id
LEFT JOIN claim_details cd
ON i.policy_id=cd.policy_id;
