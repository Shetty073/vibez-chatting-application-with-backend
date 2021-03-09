import React from "react";

function UserListCard(props) {
    return (
        <div className='flex flex-row py-4 px-2 justify-start border-b-2 cursor-pointer'>
            <div className='mr-2'>
                <img
                    src={props.profileImg}
                    className='object-cover h-12 w-12 rounded-full'
                    alt=''
                />
            </div>
            <div>
                <div className='text-lg font-semibold'>{props.chatName}</div>
                <span className='text-gray-500'>{props.lastMessage}</span>
            </div>
        </div>
    );
}

export default UserListCard;
