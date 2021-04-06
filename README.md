# 💎 My Company.

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/itsazzad/rails-devise-graphql/graphs/commit-activity)
[![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://github.com/itsazzad/rails-devise-graphql/blob/master/LICENSE)
![GitHub top language](https://img.shields.io/github/languages/top/itsazzad/rails-devise-graphql)
![GitHub issues](https://img.shields.io/github/issues/itsazzad/rails-devise-graphql)

My CompanyS

### Versions

- Current ruby version `2.6.x`
- Bundler version `2.1.4`
- Rails version `6.0.X`
- PostgreSQL Server as db connector

### Dependencies

Started with the help of the follwoing repos:

- [💎 Rails 6 boilerplate with devise, JWT, graphQL, CanCanCan and RailsAdmin.](https://github.com/zauberware/rails-devise-graphql)

## 🚀 Quick start

Clone env_sample to .env for local development. We set it up with default rails 3000 and client 8000 ports:

```sh
cp env_sample .env
```

If you are running Docker on Linux, the files rails new created are owned by root. This happens because the container runs as the root user. If this is the case, change the ownership of the new files.

```sh
sudo chown -R $USER:$USER .
```

Now that you’ve got a new Gemfile, you need to build the image again. (This, and changes to the Gemfile or the Dockerfile, should be the only times you’ll need to rebuild.)

```sh
docker-compose build
```

You can now boot the app with docker-compose up:

```sh
docker-compose up
```

Finally, you need to create the database. In another terminal, run:

```sh
docker-compose run web rake db:create
docker-compose run web rake db:migrate
docker-compose run web rake db:seed
```

### View the Rails welcome page!

That’s it. Your app should now be running on port 3000 on your Docker daemon.

On Docker Desktop for Mac and Docker Desktop for Windows, go to http://localhost:3000 on a web browser to see the Rails Welcome.

Point the GraphQL IDE to http://0.0.0.0:3000/graphql

### Stop the application

To stop the application, run `docker-compose down` in your project directory. You can use the same terminal window in which you started the database, or another one where you have access to a command prompt. This is a clean way to stop the application.

```sh
docker-compose down
docker-compose down --rmi local -v --remove-orphans
```

### Restart the application

To restart the application run `docker-compose up` in the project directory.

### Rebuild the application

If you make changes to the Gemfile or the Compose file to try out some different configurations, you need to rebuild. Some changes require only `docker-compose up --build`, but a full rebuild requires a re-run of `docker-compose run web bundle install` to sync changes in the Gemfile.lock to the host, followed by `docker-compose up --build`.

Here is an example of the first case, where a full rebuild is not necessary. Suppose you simply want to change the exposed port on the local host from 3000 in our first example to 3001. Make the change to the Compose file to expose port 3000 on the container through a new port, 3001, on the host, and save the changes:

```sh
ports:
  - "3001:3000"
```

Now, rebuild and restart the app with `docker-compose up --build`.

Inside the container, your app is running on the same port as before 3000, but the Rails Welcome is now available on http://localhost:3001 on your local host.
