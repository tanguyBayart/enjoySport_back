const express = require("express");
const app = express();
const port = 3000;
const mysql = require("mysql2");

// create the connection to database
const connection = mysql.createConnection({
  host: "nout.o2switch.net",
  port: "2083",
  user: "iaam4644",
  password: "LXEy-ypcT-nk7@",
  database: "iaam4644_enjoysport",
});

app.get("/", (req, res) => {
  res.send(`Hello World from ${req.hostname}`);
});

app.get("/toto", (req, res) => {
  res.send("Welcome Mr. Toto!");
});

app.get("/test", (req, res) => {
  res.send(connection.query);
});

app.listen(port, () => {
  console.log(`EnjoySport back app listening at http://localhost:${port}`);
  console.log();
});

// simple query
connection.query(
  'SELECT * FROM `table` WHERE `name` = "Page" AND `age` > 45',
  function (err, results, fields) {
    console.log(results); // results contains rows returned by server
    console.log(fields); // fields contains extra meta data about results, if available
    console.log(err);
  }
);
