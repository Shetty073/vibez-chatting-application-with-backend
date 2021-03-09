const mongoose = require("mongoose");
const { Schema } = mongoose;
const User = require("./user");

const groupSchema = new Schema(
    {
        name: {
            type: String,
        },
        members: [
            {
                type: Schema.Types.ObjectId,
                ref: "User",
            },
        ],
        messages: [
            {
                type: Schema.Types.ObjectId,
                ref: "Message",
            },
        ],
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Group", groupSchema);
