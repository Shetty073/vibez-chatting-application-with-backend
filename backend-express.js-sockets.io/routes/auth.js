const router = require('express').Router();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const User = require('../models/user');
const { registerDataValidation, loginDataValidation } = require('../validation');
const { verifyAuthToken } = require('../verifytoken');


// endpoints
router.post('/register', async (req, res) => {
    // Validate the data before creating a user
    const {error} = registerDataValidation(req.body);
    if (error) return res.status(400).json({
        success: false,
        message: error.details[0].message
    });

    // Check if the user already exists in the database
    const emailExist = await User.findOne({email: req.body.email});
    if (emailExist) return res.status(400).json({
        success: false,
        message: 'Account already exists'
    });

    // Salt and hash the password before storing it
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(req.body.password, salt);

    // Create a new user
    const user = new User({
        name: req.body.name,
        email: req.body.email,
        password: hashedPassword
    });

    try {
        const savedUser = await user.save();
        const token = jwt.sign({_id: user._id}, process.env.TOKEN_SECRET);
        return res.header('auth-token', token).json({
            success: true,
            userId: savedUser._id
        });

    } catch (err) {
        return res.status(400).json({
            success: false,
            message: err
        });
    }

});


router.post('/login', async (req, res) => {
    // Validate the data before we login a user
    const {error} = loginDataValidation(req.body);
    if (error) return res.status(400).json({
        success: false,
        message: error.details[0].message
    });

    // Check if the user already exists in the database
    const user = await User.findOne({email: req.body.email});
    if (!user) return res.status(400).json({
        success: false,
        message: 'Email id or password is invalid'
    });

    // Check if the password matches
    const validPass = await bcrypt.compare(req.body.password, user.password);
    // If the password doesn't match send error message
    if (!validPass) return res.status(400).json({
        success: false,
        message: 'Email id or password is invalid'
    });

    // If the password matches create jsonwebtoken and send it back via header
    const token = jwt.sign({_id: user._id}, process.env.TOKEN_SECRET);
    res.header('auth-token', token).json({
        success: true
    });
});


// temp route for testing jwt functionality
router.post('/testjwtaccess', verifyAuthToken, (req, res) => {
    res.send(req.user);

    /*
    If the auth-token header has valid jsonwebtoken then the following response will be displayed to client

    {
        "_id": "5f7c653061fb380bec53eeca",
        "iat": 1601990959
    }

    */
});

module.exports = router;
