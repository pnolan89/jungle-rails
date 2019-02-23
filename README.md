Jungle
=====================

A mini e-commerce application built with Rails 4.2.

### Features
- Visitors can view a list of products, including details and ratings associated with each
- Visitors can items to a cart, and checkout using Swipe
- Past order details can be viewed after purchase
- Users can create accounts and write reviews on products
- Admins can delete, edit, and create new products and categories


### Project Stack
 - Front End: HTML, SASS, Bootstrap
 - Back End: Ruby on Rails

### Screenshots
![Catalogue View](https://github.com/pnolan89/jungle-rails/blob/master/docs/Screen%20Shot%202019-02-22%20at%205.42.37%20PM.png?raw=true
1)
![Product Details Page](https://github.com/pnolan89/jungle-rails/blob/master/docs/Screen%20Shot%202019-02-22%20at%205.43.23%20PM.png?raw=true)
![Reviews Sample](https://github.com/pnolan89/jungle-rails/blob/master/docs/Screen%20Shot%202019-02-22%20at%205.47.53%20PM.png?raw=true)

### Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

### Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

### Dependencies

* Rails 4.2
* PostgreSQL 9.x
* Stripe
* Bcrypt
