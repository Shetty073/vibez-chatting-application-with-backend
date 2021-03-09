import React from "react";
import UserListCard from "../components/UserListCard";
import chats from "../models/dummy";

function Chats() {
    document.body.style.overflow = "hidden";

    const handleChatClick = (e) => {
        console.log(e);
    };

    const userListCards = chats.map((chat) => (
        <UserListCard
            key={chat.name !== undefined ? chat.name : chat.userTwo.email}
            profileImg={
                chat.name !== undefined
                    ? chat.profileImage
                    : chat.userTwo.profileImage
            }
            chatName={chat.name !== undefined ? chat.name : chat.userTwo.name}
            lastMessage={
                chat.name !== undefined
                    ? `${
                          chat.messages[chat.messages.length - 1].author.name
                      }: ${chat.messages[chat.messages.length - 1].message}`
                    : chat.messages[chat.messages.length - 1].message
            }
            onClick={handleChatClick}
        />
    ));

    // active UserListCard class append:  border-l-4 border-blue-400

    return (
        <div className='shadow-lg rounded-lg'>
            <div className='px-5 py-5 flex justify-between items-center bg-white border-b-2'>
                <div className='font-semibold text-2xl'>Vibez Chat</div>
                <div className='h-12 w-12 p-2 bg-yellow-500 rounded-full text-white font-semibold flex items-center justify-center'>
                    AS
                </div>
            </div>

            <div className='flex flex-row justify-between bg-white h-screen'>
                {/* user list col */}
                <div className='flex flex-col w-full md:w-2/5 border-r-2 overflow-y-auto'>
                    {/* search chats */}
                    <div className='border-b-2 py-4 px-2'>
                        <input
                            type='text'
                            placeholder='search chatting'
                            className='py-2 px-2 border-2 border-gray-200 rounded-2xl w-full'
                        />
                    </div>
                    {/* chat user list */}
                    {userListCards}
                </div>

                {/* Chat window */}
                <div className='w-4/5 md:w-full hidden md:block px-5 flex flex-col h-screen justify-between'>
                    <div className='flex flex-col mt-5 mb-auto overflow-y-auto'>
                        <div className='flex justify-end mb-4'>
                            <div className='mr-2 py-3 px-4 bg-blue-400 rounded-bl-3xl rounded-tl-3xl rounded-tr-xl text-white'>
                                Welcome to group everyone !
                            </div>
                            <img
                                src='https://source.unsplash.com/vpOeXr5wmR4/600x600'
                                className='object-cover h-8 w-8 rounded-full'
                                alt=''
                            />
                        </div>

                        <div className='flex justify-start mb-4'>
                            <img
                                src='https://source.unsplash.com/vpOeXr5wmR4/600x600'
                                className='object-cover h-8 w-8 rounded-full'
                                alt=''
                            />
                            <div className='ml-2 py-3 px-4 bg-gray-400 rounded-br-3xl rounded-tr-3xl rounded-tl-xl text-white'>
                                Lorem ipsum dolor sit amet consectetur
                                adipisicing elit. Quaerat at praesentium, aut
                                ullam delectus odio error sit rem. Architecto
                                nulla doloribus laborum illo rem enim dolor odio
                                saepe, consequatur quas?
                            </div>
                        </div>

                        <div className='flex justify-end mb-4'>
                            <div>
                                <div className='mr-2 py-3 px-4 bg-blue-400 rounded-bl-3xl rounded-tl-3xl rounded-tr-xl text-white'>
                                    Lorem ipsum dolor, sit amet consectetur
                                    adipisicing elit. Magnam, repudiandae.
                                </div>

                                <div className='mt-4 mr-2 py-3 px-4 bg-blue-400 rounded-bl-3xl rounded-tl-3xl rounded-tr-xl text-white'>
                                    Lorem ipsum dolor sit amet consectetur
                                    adipisicing elit. Debitis, reiciendis!
                                </div>
                            </div>
                            <img
                                src='https://source.unsplash.com/vpOeXr5wmR4/600x600'
                                className='object-cover h-8 w-8 rounded-full'
                                alt=''
                            />
                        </div>

                        <div className='flex justify-start mb-4'>
                            <img
                                src='https://source.unsplash.com/vpOeXr5wmR4/600x600'
                                className='object-cover h-8 w-8 rounded-full'
                                alt=''
                            />
                            <div className='ml-2 py-3 px-4 bg-gray-400 rounded-br-3xl rounded-tr-3xl rounded-tl-xl text-white'>
                                happy holiday guys!
                            </div>
                        </div>
                    </div>

                    {/* message textinput */}
                    <div className='py-5 sticky bottom-0 z-10'>
                        <input
                            className='w-full bg-gray-300 py-5 px-3 rounded-xl'
                            type='text'
                            placeholder='type your message here...'
                        />
                    </div>
                </div>

                {/* Chat or group info */}
                <div className='w-2/5 hidden md:block border-l-2 px-5'>
                    <div className='flex flex-col'>
                        <div className='font-semibold text-xl py-4'>
                            Mern Stack Group
                        </div>
                        <img
                            src='https://source.unsplash.com/L2cxSuKWbpo/600x600'
                            className='object-cover rounded-xl h-64'
                            alt=''
                        />
                        <div className='font-semibold py-4'>
                            Created 22 Sep 2021
                        </div>
                        <div className='font-light'>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit. Deserunt, perspiciatis!
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Chats;
