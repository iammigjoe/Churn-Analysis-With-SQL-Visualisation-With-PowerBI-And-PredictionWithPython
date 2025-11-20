------ Data Exploration – Check Distinct Values ------
SELECT Gender, Count(Gender) as TotalCount,
Count(Gender) * 1.0 / (Select Count(*) from stg_Churn)  as Percentage
from stg_Churn
Group by Gender

SELECT Contract, Count(Contract) as TotalCount,
Count(Contract) * 1.0 / (Select Count(*) from stg_Churn)  as Percentage
from stg_Churn
Group by Contract


SELECT Customer_Status, Count(Customer_Status) as TotalCount, Sum(Total_Revenue) as TotalRev,
Sum(Total_Revenue) / (Select sum(Total_Revenue) from stg_Churn) * 100  as RevPercentage
from stg_Churn
Group by Customer_Status

SELECT State, Count(State) as TotalCount,
Count(State) * 1.0 / (Select Count(*) from stg_Churn)  as Percentage
from stg_Churn
Group by State
Order by Percentage desc


----- Data Exploration – Check Nulls -----
SELECT 
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN Number_of_Referrals IS NULL THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,
    SUM(CASE WHEN Tenure_in_Months IS NULL THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(CASE WHEN Value_Deal IS NULL THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(CASE WHEN Phone_Service IS NULL THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(CASE WHEN Multiple_Lines IS NULL THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(CASE WHEN Internet_Service IS NULL THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(CASE WHEN Online_Security IS NULL THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(CASE WHEN Online_Backup IS NULL THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(CASE WHEN Device_Protection_Plan IS NULL THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(CASE WHEN Premium_Support IS NULL THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(CASE WHEN Streaming_TV IS NULL THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(CASE WHEN Streaming_Movies IS NULL THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(CASE WHEN Streaming_Music IS NULL THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(CASE WHEN Unlimited_Data IS NULL THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(CASE WHEN Paperless_Billing IS NULL THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM stg_Churn;

---- TABLE TO INSERT DATA WITH NON NULLS --------
CREATE TABLE prod_churn (
    customer_id                TEXT PRIMARY KEY,
    gender                     TEXT,
    age                        INTEGER,
    married                    TEXT,
    state                      TEXT,
    number_of_referrals        INTEGER,
    tenure_in_months           INTEGER,
    value_deal                 TEXT,
    phone_service              TEXT,
    multiple_lines             TEXT,
    internet_service           TEXT,
    internet_type              TEXT,
    online_security            TEXT,
    online_backup              TEXT,
    device_protection_plan     TEXT,
    premium_support            TEXT,
    streaming_tv               TEXT,
    streaming_movies           TEXT,
    streaming_music            TEXT,
    unlimited_data             TEXT,
    contract                   TEXT,
    paperless_billing          TEXT,
    payment_method             TEXT,
    monthly_charge             NUMERIC(10,2),
    total_charges              NUMERIC(12,2),
    total_refunds              NUMERIC(12,2),
    total_extra_data_charges   NUMERIC(12,2),
    total_long_distance_charges NUMERIC(12,2),
    total_revenue              NUMERIC(12,2),
    customer_status            TEXT,
    churn_category             TEXT,
    churn_reason               TEXT
);

INSERT INTO prod_churn (
    customer_id,
    gender,
    age,
    married,
    state,
    number_of_referrals,
    tenure_in_months,
    value_deal,
    phone_service,
    multiple_lines,
    internet_service,
    internet_type,
    online_security,
    online_backup,
    device_protection_plan,
    premium_support,
    streaming_tv,
    streaming_movies,
    streaming_music,
    unlimited_data,
    contract,
    paperless_billing,
    payment_method,
    monthly_charge,
    total_charges,
    total_refunds,
    total_extra_data_charges,
    total_long_distance_charges,
    total_revenue,
    customer_status,
    churn_category,
    churn_reason
)
SELECT
    customer_id,
    gender,
    age,
    married,
    state,
    number_of_referrals,
    tenure_in_months,
    COALESCE(value_deal, 'None'),
    phone_service,
    COALESCE(multiple_lines, 'No'),
    internet_service,
    COALESCE(internet_type, 'None'),
    COALESCE(online_security, 'No'),
    COALESCE(online_backup, 'No'),
    COALESCE(device_protection_plan, 'No'),
    COALESCE(premium_support, 'No'),
    COALESCE(streaming_tv, 'No'),
    COALESCE(streaming_movies, 'No'),
    COALESCE(streaming_music, 'No'),
    COALESCE(unlimited_data, 'No'),
    contract,
    paperless_billing,
    payment_method,
    monthly_charge,
    total_charges,
    total_refunds,
    total_extra_data_charges,
    total_long_distance_charges,
    total_revenue,
    customer_status,
    COALESCE(churn_category, 'Others'),
    COALESCE(churn_reason, 'Others')
FROM stg_churn
WHERE 
    customer_id IS NOT NULL
    AND gender IS NOT NULL
    AND age IS NOT NULL
    AND married IS NOT NULL
    AND state IS NOT NULL
    AND number_of_referrals IS NOT NULL
    AND tenure_in_months IS NOT NULL
    AND phone_service IS NOT NULL
    AND internet_service IS NOT NULL
    AND contract IS NOT NULL
    AND paperless_billing IS NOT NULL
    AND payment_method IS NOT NULL
    AND monthly_charge IS NOT NULL
    AND total_charges IS NOT NULL
    AND total_refunds IS NOT NULL
    AND total_extra_data_charges IS NOT NULL
    AND total_long_distance_charges IS NOT NULL
    AND total_revenue IS NOT NULL
    AND customer_status IS NOT NULL;


----- Create View for Power BI -----
Create View vw_ChurnData as
	select * from prod_Churn where Customer_Status In ('Churned', 'Stayed')


Create View vw_JoinData as
	select * from prod_Churn where Customer_Status = 'Joined'

