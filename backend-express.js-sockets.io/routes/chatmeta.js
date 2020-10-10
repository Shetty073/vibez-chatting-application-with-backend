const router = require('express').Router();
const { verifyAuthToken } = require('../verifytoken');
const User = require('../models/user');
const Chat = require('../models/chat');
const Group = require('../models/group');


// This endpoint creates a new Chat for two users
router.post('/chatid', verifyAuthToken, (req, res) => {
    // req.body.userone.phoneno;
    // req.body.usetwo.phoneno;
    // TODO: Complete this
    res.send('chatid');
});


// This endpoint creates a new Group for two users
router.post('/groupid', verifyAuthToken, (req, res) => {
    // req.body.name
    // req.body.members
    // TODO: Complete this
    res.send('groupid');
});


// This endpoint returns the User object for the requested phoneno.
router.post('/', verifyAuthToken, (req, res) => {
    // req.body.phoneno;
    // TODO: Complete this
    res.send('userdata');
});


module.exports = router;
