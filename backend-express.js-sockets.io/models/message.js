const mongoose = require("mongoose");
const { Schema } = mongoose;

const chatSchema = new Schema(
    {
        message: {
            type: String,
        },
        author: {
            type: Schema.Types.ObjectId,
            ref: "User",
        },
        chat: {
            type: Schema.Types.ObjectId,
            ref: "Chat",
        },
        group: {
            type: Schema.Types.ObjectId,
            ref: "Group",
        },
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Chat", chatSchema);
