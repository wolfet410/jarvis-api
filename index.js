const express = require('express'),
  app = express(),
  mysql = require('mysql'),
  cors = require('cors'),
  bodyParser = require('body-parser');

db = mysql.createConnection({
  host: 'localhost',
  user: 'jarvis',
  password: '******',
  database: 'jarvis'
})

var server = {
  port: 4040
};

const pagesRouter = require('./routes/pages');
const elementsRouter = require('./routes/elements');
const viewpagebuttonsRouter = require('./routes/viewpagebuttons');

app.use(cors())
app.use(bodyParser.json());
app.use('/pages', pagesRouter);
app.use('/elements', elementsRouter);
app.use('/viewpagebuttons', viewpagebuttonsRouter);

app.listen( server.port , () => console.log(`Server started, listening port: ${server.port}`));
