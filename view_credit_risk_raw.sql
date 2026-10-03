CREATE VIEW vw_credit_risk_raw AS
SELECT
	person_age,
	person_income,
	person_home_ownership,
	coalesce(person_emp_length, 0) AS person_emp_lenght,
	loan_intent,
	loan_grade,
	loan_amnt,
	coalesce(loan_int_rate, (SELECT ROUND(avg(loan_int_rate), 2) FROM credit_risk_raw)) AS loan_int_rate,
	loan_status,
	CASE 
		WHEN loan_status = 1 THEN 'Inadimplente' 
		ELSE 'Adimplente'
	END AS status_inadimplencia,
	loan_percent_income,
	cb_person_default_on_file,
	cb_person_cred_hist_length
FROM credit_risk_raw

where person_age <= 100 AND (person_emp_length IS NULL OR person_emp_length <= person_age)

