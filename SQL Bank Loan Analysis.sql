select * from bank_loan_data
# To find toal loan appications
select COUNT(id) as total_loan_applications from bank_loan_data

# To find month to date(mtd) toal loan applications
select COUNT(id) as mtd_total_loan_applications from bank_loan_data
where MONTH(issue_date)=12 and YEAR(issue_date)=2021

# To find month over month (mom) toal loan applications
select COUNT(id) as mom_total_loan_applications from bank_loan_data
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

# TO FIND TOTAL FUNDED AMOUNT for month to date (MTD) AND MONTH OVER MONTH (MOM)
select SUM(loan_amount) as total_funded_amount from bank_loan_data
where MONTH(issue_date)=12 and YEAR(issue_date)=2021 

# TO FIND TOTAL AMOUNT RECEIVED FROM BORROWERS for MTD AND MOM
select SUM(total_payment) as total_amount_received from bank_loan_data
where MONTH(issue_date)=12 and YEAR(issue_date)=2021

# TO FIND AVG INTEREST RATE FOR MTD AND MOM
select round( AVG(int_rate),4)*100 as avg_int_rate from bank_loan_data
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

# TO FIND AVG DEBT TO INCOME RATIO (DTI) FOR MTD AND MOM
select round (AVG(dti),4)*100 as avg_dti from bank_loan_data
where MONTH(issue_date)=12 and YEAR(issue_date)=2021

# TO FIND GOOD LOAN PERCENTAGE
SELECT 
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'current' THEN id END) * 100) / COUNT(id) AS good_loan_percentage
FROM 
    bank_loan_data;

# TO FIND GOOD LOAN APPLICATIONS
select COUNT(id) as good_loan_applications from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'current'

# TO FIND GOOD LOAN FUNDED AMOUNT
select SUM(loan_amount) as good_loan_funded_amount from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'current'

# TO FIND GOOD LOAN TOTAL RECEIVED AMOUNT
select SUM(total_payment) as good_loan_received_amount from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'current'

# TO FIND BAD LOAN PERCENTAGE
SELECT 
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / COUNT(id) AS bad_loan_percentage
FROM 
    bank_loan_data;

# TO FIND BAD LOAN APPLICATIONS
select COUNT(id) as bad_loan_applications from bank_loan_data
where loan_status = 'Charged Off'

# TO FIND BAD LOAN FUNDED AMOUNT
select SUM(loan_amount) as bad_loan_funded_amount from bank_loan_data
where loan_status = 'Charged Off'

# TO FIND BAD LOAN TOTAL RECEIVED AMOUNT
select SUM(total_payment) as bad_loan_received_amount from bank_loan_data
where loan_status = 'Charged Off'

# LOAN STATUS GRID VIEW
select loan_status,
COUNT(id) as Total_loan_applications,
sum(loan_amount) as total_funded_amount,
SUM(total_payment) as total_amount_received,
AVG(int_rate)*100 as interest_rate,
AVG(dti)*100 as DTI
from bank_loan_data
group by loan_status

# LOAN STATUS MONTH TO DATE (MTD) GRID VIEW
select loan_status,
SUM(total_payment) as MTD_total_amount_received,
SUM(loan_amount) as MTD_total_funded_amount
from bank_loan_data
where MONTH(issue_date) = 12
group by loan_status

# MONTH  WISE ANALYSIS
select
MONTH(issue_date) as month_number,
DATENAME(MONTH,issue_date) as Month,
COUNT(id) as total_loan_applications,
SUM(loan_amount) as total_funded_amount,
SUM(total_payment) as total_received_amount
from bank_loan_data
group by MONTH(issue_date), DATENAME(MONTH,issue_date)
order by  MONTH(issue_date) 

# REGIONAL ANALYSIS BY STATE
select
address_state,
COUNT(id) as total_loan_applications,
SUM(loan_amount) as total_funded_amount,
SUM(total_payment) as total_received_amount
from bank_loan_data
group by address_state
order by  address_state

# LOAN TERM ANALYSIS
select
term as Loan_term,
COUNT(id) as total_loan_applications,
SUM(loan_amount) as total_funded_amount,
SUM(total_payment) as total_received_amount
from bank_loan_data
group by term
order by  term

# EMPLOYEE LENGTH ANALYSIS
select
emp_length,
COUNT(id) as total_loan_applications,
SUM(loan_amount) as total_funded_amount,
SUM(total_payment) as total_received_amount
from bank_loan_data
group by emp_length
order by emp_length

# LOAN PURPOSE BREAKDOWN
select
purpose,
COUNT(id) as total_loan_applications,
SUM(loan_amount) as total_funded_amount,
SUM(total_payment) as total_received_amount
from bank_loan_data
group by purpose
order by  purpose

# HOME OWNERSHIP ANALYSIS
select
home_ownership,
COUNT(id) as total_loan_applications,
SUM(loan_amount) as total_funded_amount,
SUM(total_payment) as total_received_amount
from bank_loan_data
group by home_ownership
order by home_ownership 






