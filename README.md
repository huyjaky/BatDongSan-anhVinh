-src
--config
--controllers
--routers
--views
--index.js
.env

nodemon:
"start": "nodemon --inspect src/index.js",

lib:
"dependencies": {
  "body-parser": "^1.20.2",
  "dotenv": "^16.0.3",
  "ejs": "^3.1.9",
  "express": "^4.18.2",
  "mariadb": "^3.1.1",
  "sequelize": "^6.29.3",
  "sequelize-cli": "^6.6.0"
},
"devDependencies": {
  "nodemon": "^2.0.21"
}


// config database in pj

cd src

npx sequelize-cli init