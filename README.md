# Backend Test Case

# Installation

1. Clone this repository

```sh
git clone https://github.com/arsyad12/BE-Test-PT.Eigen.git
```

2. Change directory to BE-Test-PT.Eigen

```sh
cd BE-Test-PT.Eigen
```

3. Install all of the required modules

```sh
npm install
```

4. Create PostgreSQL database in your local database

```sh
create database library;
```

5. Create and configure `.env` file in the root directory, example credentials are provided in [.env.example](./.env.example)

6. run this command for running in development environment

```sh
npm run dev
```

## Built With

These are the libraries and service used for building this backend API

- [Node.js](https://nodejs.org)
- [Express](https://expressjs.com)
- [PostgreSQL](https://www.postgresql.org)
- [Json Web Token](https://jwt.io)
- [bcrypt](https://www.npmjs.com/package/bcrypt)
- [swagger](https://swagger.io/)

## Entities

- Member
- Book

## Use Case

- Members can borrow books with conditions
    - [x]  Members may not borrow more than 2 books
    - [x]  Borrowed books are not borrowed by other members
    - [x]  Member is currently not being penalized
- Member returns the book with conditions
    - [x]  The returned book is a book that the member has borrowed
    - [x]  If the book is returned after more than 7 days, the member will be subject to a penalty. Member with penalty cannot able to borrow the book for 3 days
- Check the book
    - [x]  Shows all existing books and quantities
    - [x]  Books that are being borrowed are not counted
- Member check
    - [x]  Shows all existing members
    - [x]  The number of books being borrowed by each member
