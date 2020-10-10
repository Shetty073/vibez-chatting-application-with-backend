const express = require('express');
const app = express();
const http = require('http').createServer(app);
const io = require('socket.io')(http);
const bodyParser = require('body-parser');
const dotenv = require('dotenv');
const mongoose = require('mongoose');
// import routes
const authRoutes = require('./routes/auth');
const chatMetaRoutes = require('./routes/chatmeta');


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
app.use('/api/chat', chatMetaRoutes);


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


// socket.io code
let connections = 0;
io.on('connection', socket => {

    // Whenever a new socket connects increment the connections counter and console.log()
    // the active user count.
    connections++;
    console.log(`Clients connected: ${connections}`);

    // 'join' adds the user to a particular room.
    // This is for one on one private chats and not for groups.
    // Two users will share a room and communicate with each other.
    // There are alternative approaches to achive private chat between two users
    // but this seemed to be the simplest one yet.
    socket.on('join', chat => {
        socket.join(chat.chatid);
    });

    // 'message' event is for exchanging the actual messages
    socket.on('message', message => {
        socket.broadcast.to(message.chatid).emit('message', message);
    });

    // 'typing' event is emitted on the client side whenever the user's keyboard is 
    // actve and the user is typing.
    socket.on('typing', user => {
        socket.broadcast.to(user.chatid).emit('typing', user);
    });


    // Below events are exactly like the above ones but for group chats
    socket.on('joingroup', group => {
        socket.join(group.groupid);
    });

    socket.on('messagegroup', message => {
        socket.broadcast.to(message.groupid).emit('messagegroup', message.body);
    });

    socket.on('typinggroup', user => {
        socket.broadcast.to(user.groupid).emit('typinggroup', user);
    });

    // Whenever a socket disconnects decrement the connections counter and console.log()
    // the active user count.
    socket.on('disconnect', () => {
        connections--;
        console.log(`Clients connected: ${connections}`);
    });
});

// Get the port from the system environment, if not available then set it as 3000
const PORT = process.env.PORT || 3000;

// Start the server
http.listen(PORT, () => {
    console.log(`Server started on http://localhost:${PORT}`)
})

