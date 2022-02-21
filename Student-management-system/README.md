# RUN PROJECT ON DEVELOMENT

## BACK

- On php MyAdmin, create a new database : tasks_db

- Go to /back
- Copy the .env.example to .env

- on .env file, update the database name :
  DB_DATABASE=tasks_db

- Launch composer install
- Launch npm install
- Launch php artisan migrate

- Launch php artisan key:generate
- Launch php artisan storage:link ( to allow the image folder to be public)

- Launch php artisan serve

## FRONT

- Go to /front
- Launch npm install
- Run npm run serve to launch on developpment mode

# RUN PROJECT ON PRODUCTION

## First time :

    - Clone project

    - On php MyAdmin, create a  new database : tasks_db

    - Go to /back
    - Copy the .env.example to .env
    - on  .env file, update the database name :
    	DB_DATABASE=tasks_db

    - Launch  composer install
    - Launch  npm install
    - Launch php artisan migrate
    - Launch  php artisan key:generate

    - Go to /front
    - Launch  npm install

## Other times :

    - git pull

    - Go to /front
    - Run npm run build
