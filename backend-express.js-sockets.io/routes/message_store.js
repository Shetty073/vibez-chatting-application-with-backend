const router = require("express").Router();
const { verifyAuthToken } = require("../verifytoken");
const User = require("../models/user");
const Chat = require("../models/chat");
const Group = require("../models/group");

// Routes here

module.exports = router;
