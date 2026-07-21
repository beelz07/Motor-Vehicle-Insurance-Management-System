-- 1. Customer
INSERT INTO customer
(first_name, last_name, gender, phone, email, address, license_number)
VALUES
(...);

-- 2. Vehicle
INSERT INTO vehicle
(customer_id, vehicle_number, vehicle_type, brand, model, manufacture_year, chassis_number, engine_number)
VALUES
(...);

-- 3. Insurance Policy
INSERT INTO insurance_policy
(vehicle_id, policy_number, policy_type, start_date, end_date, premium_amount, coverage_amount, status)
VALUES
(...);

-- 4. Payment
INSERT INTO payment
(policy_id, payment_date, amount, payment_method, payment_status)
VALUES
(...);

-- 5. Claim Details
INSERT INTO claim_details
(policy_id, claim_date, claim_amount, claim_status, description)
VALUES
(...);

-- 6. Agent
INSERT INTO agent
(agent_name, phone, email, branch)
VALUES
(...);
