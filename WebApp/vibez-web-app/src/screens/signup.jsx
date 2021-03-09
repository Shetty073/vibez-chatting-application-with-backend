import React from "react";

function SignUp() {
    const handleSignUp = (e) => {
        e.preventDefault();

        console.log("Sign Up");
    };

    return (
        <div className='min-h-screen pt-12 md:pt-40 pb-3 px-2 md:px-0 bg-gradient-to-br from-red-200 via-yellow-500 to-yellow-800'>
            <header className='max-w-lg mx-auto'>
                <h1 className='text-white text-5xl text-center font-bold'>
                    Signup
                </h1>
            </header>

            <div className='bg-white max-w-lg mx-auto p-8 md:p-12 my-10 rounded-lg shadow-2xl'>
                <form onSubmit={handleSignUp}>
                    <div className='mb-6 pt-3 rounded bg-gray-200'>
                        <label
                            htmlFor='name'
                            className='block text-yellow-600 text-sm font-bold mb-2 ml-3'
                        >
                            Name
                        </label>
                        <input
                            type='text'
                            id='name'
                            autoComplete='on'
                            className='bg-gray-200 rounded w-full text-gray-700 focus:outline-none border-b-4 border-gray-300 focus:border-yellow-600 transition duration-500 px-3 pb-3'
                            required
                        />
                    </div>
                    <div className='mb-6 pt-3 rounded bg-gray-200'>
                        <label
                            htmlFor='email'
                            className='block text-yellow-600 text-sm font-bold mb-2 ml-3'
                        >
                            Email
                        </label>
                        <input
                            type='email'
                            id='email'
                            autoComplete='on'
                            className='bg-gray-200 rounded w-full text-gray-700 focus:outline-none border-b-4 border-gray-300 focus:border-yellow-600 transition duration-500 px-3 pb-3'
                            required
                        />
                    </div>
                    <div className='mb-3 pt-3 rounded bg-gray-200'>
                        <label
                            htmlFor='password'
                            className='block text-yellow-600 text-sm font-bold mb-2 ml-3'
                        >
                            Password
                        </label>
                        <input
                            type='password'
                            id='password'
                            autoComplete='on'
                            className='bg-gray-200 rounded w-full text-gray-700 focus:outline-none border-b-4 border-gray-300 focus:border-yellow-600 transition duration-500 px-3 pb-3'
                            required
                        />
                    </div>
                    <div className='mb-3 pt-3 rounded bg-gray-200'>
                        <label
                            htmlFor='confirm_password'
                            className='block text-yellow-600 text-sm font-bold mb-2 ml-3'
                        >
                            Confirm Password
                        </label>
                        <input
                            type='password'
                            id='confirm_password'
                            autoComplete='on'
                            className='bg-gray-200 rounded w-full text-gray-700 focus:outline-none border-b-4 border-gray-300 focus:border-yellow-600 transition duration-500 px-3 pb-3'
                            required
                        />
                    </div>
                    <div className='border border-red-300 bg-red-200 rounded px-2 py-1 mb-2 text-red-500 font-bold hidden'>
                        Error
                    </div>
                    <button
                        type='submit'
                        className='bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-2 px-2 rounded shadow-lg hover:shadow-xl transition duration-200 focus:outline-none'
                    >
                        Signin
                    </button>
                </form>
            </div>
        </div>
    );
}

export default SignUp;
