const mongoose = require('mongoose');
const { Schema } = mongoose;
const { chatSchema } = require('./chat').schema;
const { groupSchema } = require('./group').schema;

const userSchema = new Schema({
    name: {
        type: String,
        required: true,
        min: 3,
        max: 255
    },
    email: {
        type: String,
        required: true,
        unique: true,
        min: 6,
        max: 255,
    },
    phone: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true,
        min: 6,
        max: 1024,
    },
    joindate: {
        type: Date,
        default: Date.now
    },
    lastseen: {
        type: Date,
        required: false
    },
    chats: {
        type: [chatSchema],
        required: false
    },
    groups: {
        type: [groupSchema],
        required: false
    },
    isBot: {
        type: Boolean,
        default: false
    }
});

module.exports = mongoose.model('User', userSchema);
