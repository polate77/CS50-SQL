# Personal Finance Tracker

#### Video Demo: https://youtu.be/TKECZ-494k0

#### Description:

This project is a comprehensive relational database designed to solve a common real-world problem: personal finance management. The goal of this database is to provide a robust backend for an application that allows users to track their income, expenses, and savings across multiple financial institutions. By organizing financial data into a structured SQL database, users can gain clear insights into their spending habits and ensure they are staying within their monthly budgets.

The database consists of four primary entities, each representing a crucial aspect of the financial tracking process:

1. **Users:** This table stores the core information about the account holders, including their first name, last name, and a unique email address. This serves as the foundation for the entire system, allowing multiple users to maintain separate, private financial records.

2. **Accounts:** Rather than tying all financial data directly to a user, I created a separate `accounts` table. This allows a single user to manage multiple bank accounts, such as a checking account, a savings account, or a credit card. Each account has a specific type and a current balance. This design choice introduces a one-to-many relationship between users and accounts, which is essential for real-world financial tracking.

3. **Categories:** To help users understand where their money is going, I created a `categories` table. This table stores the types of expenses (e.g., Groceries, Rent, Entertainment) along with a monthly budget for each category. This allows the application to not only track transactions but also alert users if they are overspending in a specific area.

4. **Transactions:** The heart of the database is the `transactions` table. This table records every movement of money. Each transaction is linked to a specific account and, optionally, to a category. It includes the amount, the date, and a brief description. This creates a many-to-one relationship where many transactions can belong to a single account and a single category.

**Optimization:**
Because a user will likely accumulate thousands of transactions over time, querying the database for recent activity could become slow. To optimize the database for speed, I created an index on the `transaction_date` column in the transactions table. This ensures that queries filtering by date will execute much faster, providing a better user experience.

**Limitations and Future Improvements:**
One limitation of this current schema is that it does not natively handle transfers between accounts. If a user transfers $100 from their checking to their savings, the database would record this as two separate transactions (a negative amount in checking and a positive amount in savings). In the future, I could improve this design by adding a `transfers` table that explicitly links these two transactions together, ensuring the data remains perfectly accurate and easy to audit.
