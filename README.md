# Inventory Management System

This is an Inventory Management System built with Ruby on Rails and SQLite3. The application allows users to manage products, categories, and stock transactions, while providing authentication for secure login and registration.

## Features

- **Dashboard**: View a summary of key data and quick links to manage products, categories, and stock transactions.
- **Product Management**: Add, edit, view, and delete products in the inventory.
- **Category Management**: Create, edit, and delete product categories.
- **Stock Transactions**: Track stock movements (incoming and outgoing) for each product.
- **User Authentication**: Users can sign up, log in, and manage their inventory.

## Technologies Used

- **Ruby on Rails**: A powerful web framework for building database-backed web applications.
- **SQLite3**: A lightweight database used for development and testing.
- **Tailwind CSS**: A utility-first CSS framework used for responsive styling.
- **Render**: Platform used for deployment.

## Installation

To get started with the project, follow these steps:

### Prerequisites

- Ruby (2.7 or higher)
- Rails (6.0 or higher)
- SQLite3

### Steps

1. **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/inventory-management.git
    cd inventory-management
    ```

2. **Install dependencies**:
    ```bash
    bundle install
    ```

3. **Set up the database**:
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```

4. **Start the Rails server**:
    ```bash
    rails server
    ```

    The application should now be running at `http://localhost:3000`.

## Deployment

This application is deployed on Render. You can access the live version here: [Inventory Management on Render](https://your-app-name.onrender.com)

To deploy the application to Render, follow these steps:

1. Create an account on [Render](https://render.com).
2. Connect your GitHub repository to Render.
3. Set up a new "Web Service" for the Rails app.
4. Set the environment variables for your production database, if necessary.
5. Deploy the application!

## Usage

Once the application is running, you can:

- **Sign up** or **Log in** to your account to manage your inventory.
- On the **Dashboard**, view quick links to all sections (Products, Categories, Stock Transactions).
- **Add** new products, categories, and stock transactions.
- **Edit** or **Delete** existing products or categories.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- **Ruby on Rails**: A framework that made building this project fast and easy.
- **Tailwind CSS**: Used for creating a responsive and clean design.
- **SQLite3**: For the lightweight, easy-to-use database solution.
- **Render**: Platform for deploying the application with ease.

## Contributing

Feel free to fork this project and submit pull requests for any improvements or fixes.

---

If you have any issues or feature requests, please open an issue on this repository!

