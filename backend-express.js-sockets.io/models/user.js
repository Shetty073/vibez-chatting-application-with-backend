const mongoose = require("mongoose");
const { Schema } = mongoose;

const userSchema = new Schema(
    {
        name: {
            type: String,
            required: true,
            min: 3,
            max: 255,
        },
        email: {
            type: String,
            required: true,
            unique: true,
            min: 6,
            max: 255,
        },
        password: {
            type: String,
            required: true,
            min: 6,
            max: 1024,
        },
        lastseen: {
            type: Date,
            required: false,
        },
        chats: [
            {
                type: Schema.Types.ObjectId,
                ref: "Chat",
            },
        ],
        groups: [
            {
                type: Schema.Types.ObjectId,
                ref: "Group",
            },
        ],
        isBot: {
            type: Boolean,
            default: false,
        },
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("User", userSchema);
