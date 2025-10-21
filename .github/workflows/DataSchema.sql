CREATE TABLE app_users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    financial_stability VARCHAR(100)
);


CREATE TABLE user_budgets (
    budget_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    budget_period VARCHAR(20) NOT NULL,
    planned_income DECIMAL(12, 2),
    planned_expense DECIMAL(12, 2),
    FOREIGN KEY (user_id) REFERENCES app_users (user_id)
);


CREATE TABLE finance_reports (
    report_id INT PRIMARY KEY,
    budget_id INT NOT NULL,
    report_type VARCHAR(50) NOT NULL,
    report_period VARCHAR(20) NOT NULL,
    report_content TEXT,
    FOREIGN KEY (budget_id) REFERENCES user_budgets (budget_id)
);


CREATE TABLE income_records (
    income_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    report_id INT,
    income_source VARCHAR(100) NOT NULL,
    amount DECIMAL(12, 2) NOT NULL CHECK (amount >= 0),
    income_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES app_users (user_id),
    FOREIGN KEY (report_id) REFERENCES finance_reports (report_id)
);


CREATE TABLE expense_records (
    expense_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    report_id INT,
    expense_category VARCHAR(100) NOT NULL,
    amount DECIMAL(12, 2) NOT NULL CHECK (amount >= 0),
    expense_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES app_users (user_id),
    FOREIGN KEY (report_id) REFERENCES finance_reports (report_id)
);
