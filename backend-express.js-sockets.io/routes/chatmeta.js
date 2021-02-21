const router = require("express").Router();
const { verifyAuthToken } = require("../verifytoken");
const User = require("../models/user");
const Chat = require("../models/chat");
const Group = require("../models/group");

// This endpoint creates a new Chat for two users
router.post("/createchat", verifyAuthToken, async (req, res) => {
    // Takes two user ids in request
    // sends chat object in response

    let userOneId = req.body.useroneid;
    let userTwoId = req.body.usertwoid;

    let userOne = await User.findById(userOneId).exec();

    if (!userOne) {
        console.log(userOne);
        return res.status(400).json({
            success: false,
            message: "User one not found!",
        });
    }

    let userTwo = await User.findById(userTwoId).exec();

    if (!userTwo) {
        return res.status(400).json({
            success: false,
            message: "User two not found!",
        });
    }

    const chat = new Chat({
        userOne: userOne._id,
        userTwo: userTwo._id,
    });

    await chat.save();

    userOne.chats.push(chat._id);
    await userOne.save();

    userTwo.chats.push(chat._id);
    await userTwo.save();

    res.status(200).json({
        success: true,
        chat: chat,
    });
});

// This endpoint creates a new Group for two users
router.post("/creategroup", verifyAuthToken, async (req, res) => {
    // Takes sgoup name string and list of memberids in request
    // sends group object in response

    let groupName = req.body.name;
    let memberIds = req.body.memberIds;

    const group = new Group({
        name: groupName,
    });

    memberIds.forEach(async (memberId) => {
        group.members.push(memberId);
        await group.save();

        let member = await User.findById(memberId).exec();
        member.groups.push(group);
    });

    await group.save();

    res.status(200).json({
        success: true,
        group: group,
    });
});

module.exports = router;
