# Computer Shop

This is a simple computer shop application built with Django. The project includes PayPal and local bank payment options, along with an admin dashboard for managing products, orders, and payments.

## Table of Contents
1. [Description](#description)
2. [Features](#features)
3. [Installation](#installation)
4. [Usage](#usage)
6. [Payment Integration](#payment-integration)

## Description

This project is designed for managing a computer shop with a user-friendly interface. Customers can browse products, add them to the cart, and make payments using PayPal or a local bank. The admin dashboard allows the shop owner to manage inventory, orders, and customer details efficiently.

## Features

- **Product Management:** Add, update, and delete products.
- **Cart System:** Customers can add products to their cart and proceed to checkout.
- **Payment Integration:** Supports PayPal and local bank payments(not fully functional).
- **Order Management:** Track and manage customer orders.
- **Admin Dashboard:** Comprehensive dashboard for managing products, orders, and payments.

## Installation

Follow these steps to set up the project locally:

1. **Clone the repository in an environment:**

   ```bash
   git clone https://github.com/monykappa/Computer-Shop.git
   ```
2. **Go to project:**
      ```bash
      cd Computer-Shop
      ```
3. **Install the required packages:**
   ```bash
   pip install -r requirements.txt
   ```
4. **Import data using MySQL:**
   ```bash
   In project, you will see pc_shop_db.sql, then go to PhpMyAdmin,
   Create a new database name pc_shop_db,
   next import pc_shop_db.sql to that database.
   ```

   ** All data is include in that pc_shop_db.sql.

   
5. **Migrate the project:**
   
   Makemigrations:
   
   ```bash
   python manage.py makemigrations
   ```
   or type this to makemigrations:
   ```bash
   ma
   ```
   
   Migrate:

   ```bash
   python manage.py migrate
   ```
   or type this to migrate:
   ```bash
   mi
   ```
   
## Usage
1. **Run the project:**
   ```bash
   python manage.py runserver
   ```
   or simply type this to run
   ```bash
   run
   ```
2. **Project in browser:**
   ```bash
   127.0.0.1:8000
   ```
3. **Craete Superadmin user:**
  If you want to access admin page you need to create a super admin user by using this command:

  ```bash
  python manage.py createsuperuser
  ```
4. **Admin page:**

   To go to admin page simply type this in browser url:

  ```bash
  127.0.0.1:8000/dashboard/
  ```

## Payment Integration
If you want to use with Paypal:

Step 1: go to paypal website to create a sandbox account.
Step 2: Create an app and get the Client ID.
Step 3: Create an (.env) file.
Step 3: Paste the Client ID in the (.env) file 
Example:
```bash
PAYPAL_CLIENT_ID=abcabcabc123123123123
```
## Project Preview

![Screenshot 2024-08-19 130449](https://github.com/user-attachments/assets/971853e5-b068-4431-b7f3-634c8364e0bd)

![Screenshot 2024-08-19 130504](https://github.com/user-attachments/assets/1bf05682-fe41-46db-8f36-e39a643d6862)

![Screenshot 2024-08-19 130511](https://github.com/user-attachments/assets/2dafd6db-2636-4420-9a1c-b569146373f0)

![Screenshot 2024-08-19 130528](https://github.com/user-attachments/assets/9b170146-420f-4116-a545-d610888387c8)

![Screenshot 2024-08-19 130535](https://github.com/user-attachments/assets/1ef56766-d61a-4e85-830c-7c35f536ebb3)

![Screenshot 2024-08-19 130543](https://github.com/user-attachments/assets/d12025b1-9303-4026-a2e1-7557eebf43ee)

![Screenshot 2024-08-19 130553](https://github.com/user-attachments/assets/9314efb3-6759-4de8-8546-8390655ef0a6)

## Thanks
