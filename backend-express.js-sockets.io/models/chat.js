const mongoose = require('mongoose');
const { Schema } = mongoose;
const User = require('./user');

const chatSchema = new Schema({
    userOne: {
        type: User
    },
    userTwo: {
        type: User
    }
});

module.exports = mongoose.model('Chat', chatSchema);
