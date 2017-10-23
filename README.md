Rails[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# My second Project at GA code school - Full Stack Project

-   This is a backend application that provides APIs for the following:
    -   Authenticates users based on user credentials
    -   Provides add, update, show and delete APIs for children
    -   Provides add, update, show and delete APIs for books
-   These APIs are consumed by the front-end application [`Favorite Books`](https://mayoorpatil.github.io/mp-kids-fav-books/index.html)
    -   Here is the link to the front-end application repo [`Favorite Books Repo`](https://github.com/MayoorPatil/mp-kids-fav-books)
-   This application is built using `Ruby on Rails`
-   This is my first project using ruby on rails so any feedback is appreciated

If you have any feedback and/or suggestions. Please connect and share

## Contact me
[LinkedIn](http://www.linkedin.com/pub/mayoor-patil/10/8a0/338)

## Technologies and Tools Used

The following tools and technologies where used to build this application

1.  Ruby on Rails, CURL scripts
2.  GIT for code repository and version control
3.  Postgres SQL database
3.  ATOM editor
4.  This API application is deployed on Heroku for public consumption
    a. Here is the link to the [`Backend Repo`](https://github.com/MayoorPatil/map-rails-api)
    b. Here is the link to the [`Backend Endpoint`](https://map-rails-api.herokuapp.com/)

## Development Process

Here is how I approached the development of this application

1.  Had the requirements broken down into user stories
2.  Based on the stories I spent some time designing the `Entity Relationship Diagram - ERD` and had the high level ERD created
3.  Then I moved on to creating backend resource one at a time and tested it out writing `CRUL Scripts`
  1. Created one CRUD action at one time
4.  Once the CRUL Script testig passed I intergrated the resource with the front-end application `Favorite Books`
  1. Ensured that the front-end application was able to consume the APIs using `AJAX` calls
5.  With every little change I made i unit tested all along to minimize defects and fixes. This helped a lot as I was able to identify minor defects and fix along the way.
6.  All along I also ensured every feature was committed and pushed to the GIT repository. This was specifically helpful since I knew exactly what had changed with each feature and did not have to struggle and go through a ton of code to fix or implement any missing functionality

## Links to backend stories and ERD

[`Backend Stories`](https://github.com/MayoorPatil/map-rails-api/blob/master/public/images/backend-stories.png)

[`ERD`](https://github.com/MayoorPatil/map-rails-api/blob/master/public/images/ERD_FullStack_Project.png)

## API

Scripts are included in [`scripts`](scripts/kids) to test built-in actions.

### Kids

| Verb   | URI Pattern   | Controller#Action |
|--------|---------------|-------------------|
| POST   | `/kids`       | `kids#create`     |
| GET    | `/kids`       | `kids#index`      |
| GET    | `/kids/:id`   | `kids#show`       |
| PATCH  | `/kids/:id`   | `kids#update`     |
| DELETE | `/kids/:id`   | `kids#destroy`    |

#### POST /kids

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/kids"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "kid": {
      "first_name": "'"${FN}"'",
      "last_name": "'"${LN}"'",
      "image_url": ""
    }
  }'
```

```sh
FN="John" LN="Doe"  TOKEN="BAhJIiVlMGQyNjZhNTAyOTdlMWI1YWE4M2RmZWM3ZWM2MWM1NgY6BkVG--07cff8813512c0d715faa418f2a157ab79e8cccf" sh scripts/kids/create.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "kid": {
    "id": 8,
    "first_name": "John",
    "last_name": "Doe",
    "image_url": "",
    "user_id": 1
  }
}
```

#### GET /kids

Request:

```sh
curl --include --request GET "http://localhost:4741/kids" \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
TOKEN="BAhJIiU1ZTM1YmI2NmVkMGZjYzFmZWFmOWI4YjA1MWM3YzQ4MwY6BkVG--ac3b932f392f68465aa419bdd2831f0547370009" sh scripts/kids/get_all_kids.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "kids":[
    {
      "id": 7,
      "first_name": "Amala",
      "last_name": "Patil",
      "image_url": "http://res.cloudinary.com/dvhvgdow9/image/upload/a_0/v1508698413/amala_gyxbo7.jpg",
      "created_at": "2017-10-20T14:58:47.932Z",
      "updated_at": "2017-10-22T18:55:10.307Z",
      "user_id": 1
    },
    {
      "id": 8,
      "first_name": "John",
      "last_name": "Doe",
      "image_url": "http://res.cloudinary.com/dvhvgdow9/image/upload/v1507863307/sample.jpg",
      "created_at": "2017-10-20T15:01:55.314Z",
      "updated_at": "2017-10-22T18:58:43.228Z",
      "user_id": 1
    }
    ]
}
```

#### GET /kids/:id

Request:

```sh
curl --include --request GET "http://localhost:4741/kids/${ID}" \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
TOKEN="BAhJIiU1ZTM1YmI2NmVkMGZjYzFmZWFmOWI4YjA1MWM3YzQ4MwY6BkVG--ac3b932f392f68465aa419bdd2831f0547370009" ID="7" sh scripts/kids/get_kid.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "kid": {
    "id": 7,
    "first_name": "Amala",
    "last_name": "Patil",
    "image_url": "http://res.cloudinary.com/dvhvgdow9/image/upload/a_0/v1508698413/amala_gyxbo7.jpg",
    "books": [
      {
        "id": 7,
        "title": "Mickey Mouse",
        "author": "Mickey",
        "content": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        "image_url": "http://res.cloudinary.com/dvhvgdow9/image/upload/v1508517284/tom_kitten_idd5ln.jpg",
        "created_at": "2017-10-22T15:27:06.578Z",
        "updated_at": "2017-10-22T15:47:17.521Z",
        "kid_id": 7
      }
    ]
  }
}
```
#### PATCH /kids/:id

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/kids/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "kid": {
      "image_url": "'"${LOC}"'"
    }
  }'
```

```sh
TOKEN="BAhJIiU1ZTM1YmI2NmVkMGZjYzFmZWFmOWI4YjA1MWM3YzQ4MwY6BkVG--ac3b932f392f68465aa419bdd2831f0547370009" LOC="https://res.cloudinary.com/dvhvgdow9/image/upload/a_0/v1508698413/amala_gyxbo7.jpg" sh scripts/kids/update.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "kid": {
    "id": 7,
    "first_name": "Amala",
    "last_name": "Patil",
    "image_url": "https://res.cloudinary.com/dvhvgdow9/image/upload/a_0/v1508698413/amala_gyxbo7.jpg",
    "books": [
      {
        "id": 7,
        "title": "Mickey Mouse",
        "author": "Mickey",
        "content": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        "image_url": "http://res.cloudinary.com/dvhvgdow9/image/upload/v1508517284/tom_kitten_idd5ln.jpg",
        "created_at": "2017-10-22T15:27:06.578Z",
        "updated_at": "2017-10-22T15:47:17.521Z",
        "kid_id": 7
      }
    ]
  }
}
```

#### DELETE /kids/:id

Request:

```sh
curl http://localhost:4741/kids/${ID} \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/destroy.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Books

| Verb   | URI Pattern    | Controller#Action |
|--------|----------------|-------------------|
| POST   | `/books`       | `books#create`    |
| GET    | `/books`       | `books#index`     |
| GET    | `/books/:id`   | `books#show`      |
| PATCH  | `/books/:id`   | `books#update`    |
| DELETE | `/books/:id`   | `books#destroy`   |

#### POST /books

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/books"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "book": {
      "title": "'"${TL}"'",
      "author": "'"${AUT}"'",
      "content": "",
      "image_url": ""
    }
  }'
```

```sh
TL="Tom Kitten" AUT="Tom" TOKEN="BAhJIiVlMGQyNjZhNTAyOTdlMWI1YWE4M2RmZWM3ZWM2MWM1NgY6BkVG--07cff8813512c0d715faa418f2a157ab79e8cccf" sh scripts/books/create.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "book": {
    "id": 3,
    "title": "Tom Kitten",
    "author": "Tom",
    "content": "",
    "image_url": "",
    "kid_id": 3
  }
}
```

#### GET /books

Request:

```sh
curl --include --request GET "http://localhost:4741/books" \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "book": {
      "kid_id": "'"${KID_ID}"'"
    }
  }'
```

```sh
TOKEN="BAhJIiU1ZTM1YmI2NmVkMGZjYzFmZWFmOWI4YjA1MWM3YzQ4MwY6BkVG--ac3b932f392f68465aa419bdd2831f0547370009" KID_ID=7 sh scripts/books/get_all_books.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "books": [
    {
      "id": 7,
      "title": "Mayoor",
      "author": "Manmohan Patil",
      "content": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image_url": "http://res.cloudinary.com/dvhvgdow9/image/upload/v1508517284/tom_kitten_idd5ln.jpg"
    }
  ]
}
```

#### GET /books/:id

Request:

```sh
curl --include --request GET "http://localhost:4741/kids/${ID}" \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
TOKEN="BAhJIiU1ZTM1YmI2NmVkMGZjYzFmZWFmOWI4YjA1MWM3YzQ4MwY6BkVG--ac3b932f392f68465aa419bdd2831f0547370009" KID_ID=7 ID=7 sh scripts/books/get_book.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "books": [
    {
      "id": 7,
      "title": "Mayoor",
      "author": "Manmohan Patil",
      "content": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image_url": "http://res.cloudinary.com/dvhvgdow9/image/upload/v1508517284/tom_kitten_idd5ln.jpg"
    }
  ]
}
```
#### PATCH /books/:id

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/books/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "book": {
      "image_url": "'"${LOC}"'"
    }
  }'
```

```sh
ID="2" TOKEN="BAhJIiU1ZTM1YmI2NmVkMGZjYzFmZWFmOWI4YjA1MWM3YzQ4MwY6BkVG--ac3b932f392f68465aa419bdd2831f0547370009" LOC="https://res.cloudinary.com/dvhvgdow9/image/upload/v1508517277/shopkins_alleay.jpg" sh scripts/books/update.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "book": {
    "id": 2,
    "title": "Shopkins",
    "author": "",
    "content": "",
    "image_url": "https://res.cloudinary.com/dvhvgdow9/image/upload/v1508517277/shopkins_alleay.jpg"
  }
}
```

#### DELETE /books/:id

Request:

```sh
curl http://localhost:4741/books/${ID} \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/books/destroy.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```


## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
