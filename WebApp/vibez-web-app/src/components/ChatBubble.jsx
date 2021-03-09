import React from "react";

function ChatBubble(props) {
    const className = `mr-2 py-3 px-4 ${props.bgColor} rounded-bl-3xl ${props.bubbleCorners} text-white`;

    return (
        <div className='flex justify-end mb-4'>
            <div className={className}>{props.message}</div>
            <img
                src={props.profileImg}
                className='object-cover h-8 w-8 rounded-full'
                alt=''
            />
        </div>
    );
}

export default ChatBubble;
