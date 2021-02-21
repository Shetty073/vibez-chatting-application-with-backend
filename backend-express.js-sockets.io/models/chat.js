const mongoose = require("mongoose");
const { Schema } = mongoose;
const User = require("./user");

const chatSchema = new Schema(
    {
        userOne: {
            type: Schema.Types.ObjectId,
            ref: "User",
        },
        userTwo: {
            type: Schema.Types.ObjectId,
            ref: "User",
        },
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Chat", chatSchema);
