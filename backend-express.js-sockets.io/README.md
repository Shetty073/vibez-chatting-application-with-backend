# This folder contains the backend for the Vibez chat application

### This readme is a work in progress just like the project. Expect it to be updated along the progression of this project.

#### Technologies used:
+ Express
+ Mongo db

#### Documentation:

##### File structure
+ We are using routes `express.Router()` for our endpoints in this application.
+ `server.js` is the starting point of our application which contains the code for starting the server.
+ `validation.js` file contains the code for validation (using `joi`) of user submitted data.
+ `verifytoken.js` file contains the `verifyAuthToken` middleware code which is used for verfying the jsonwebtoken validity for authentication/authorization purposes.
+ This project uses `dotenv` for accessing the `.env` file which contains the following variables:
    + DB_CONNECT - The mongo db connection string
    + PORT - The port on which the server should run on
    + TOKEN_SECRET - The cryptographically generated random string which is provided as the secret key to the `jwt.sign()` function for generating the token.
+ The `routes` folder contains all the route files which include:
    + `auth.js` - This file contains the code for authentication routes (`/login`, `/register`)
    > __NOTE:__ The authentication routes must be prefixed by /api/user during API call (e.g. /api/user/login)
+ The `models` folder contains the mongoose schemas (or models), as of right now it contains the following files:
    + `user.js` - which contains the User model
