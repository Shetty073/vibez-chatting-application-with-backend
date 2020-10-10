const mongoose = require('mongoose');
const { Schema } = mongoose;
const User = require('./user');

const groupSchema = new Schema({
    name: {
        type: String
    },
    members: {
        type: [User]
    },
});

module.exports = mongoose.model('Group', groupSchema);
