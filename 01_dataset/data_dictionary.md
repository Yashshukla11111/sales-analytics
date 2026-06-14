## Customers Table
- customer_id: Unique customer identifier
- name: Customer full name
- email: Customer email
- city: Customer city
- state: Customer state
- gender: Male / Female / Other
- age: Customer age

## Orders Table
- order_id: Unique order identifier
- customer_id: Links to customers table
- product_id: Links to products table
- order_date: Date of order
- quantity: Units ordered
- total_amount: Order total value
- payment_mode: UPI / Debit Card / Credit Card etc

## Products Table
- product_id: Unique product identifier
- product_name: Name of product
- category: Product category
- unit_price: Selling price
- cost_price: Cost price
- profit_margin: Profit margin percentage
- stock_quantity: Available stock
