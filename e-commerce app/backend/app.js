const bodyParser = require('body-parser');
const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');
require('dotenv').config();

const app = express();
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.options('*', cors());

// const hostname = process.env.HOST || 'localhost';
// const port = process.env.PORT || 3000;
const hostname = 'localhost';
const port = 3000;

// Connect to database
mongoose.connect(process.env.MONGODB_URI, {});
const db = mongoose.connection;
db.on('error', (error) => console.error(error));
db.once('open', () => console.log('Connected to database'));


// Routes
app.use('/auth', require('./routes/auth'));
app.use('/store', require('./routes/store'));


// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://${hostname}:${port}`);
});
