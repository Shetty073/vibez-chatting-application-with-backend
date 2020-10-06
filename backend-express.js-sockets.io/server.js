const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const dotenv = require('dotenv');
const mongoose = require('mongoose');
// import routes
const authRoutes = require('./routes/auth');


dotenv.config();

// Connect to db
mongoose.connect(
    process.env.DB_CONNECT,
    () => console.log('Connected to db')
);


// Middlewares
// bodyParser middleware
// support parsing of application/x-www-form-urlencoded post data
app.use(bodyParser.urlencoded({extended: true}));
// support parsing of application/json type post data
app.use(bodyParser.json());

// route middlewares
app.use('/api/user', authRoutes);


// Handling request for invalid URI
app.use(function(req, res, next) {
    let obj = {success: false};
    if (req.method === "DELETE") {
        obj.message = "DELETE method not supported";
    } else {
        obj.message = "Invalid URI";
    }
    res.status(404).json(obj);
});


// Get the port from the system environment, if not available then set it as 3000
const PORT = process.env.PORT || 3000

// Start the server
app.listen(PORT, () => {
    console.log(`Server started on http://localhost:${PORT}`)
})

