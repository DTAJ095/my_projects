const express = require('express');
const hashPassword = require('../utils').hashPassword;
const router = express.Router();
const User = require('../models/users');


// Create a new user
router.post('/register', async (req, res) => {
    const { firstName, lastName, email, password } = req.body;
    if (!firstName || !lastName || !email || !password) {
        return res.status(400).json({ error: 'Please enter all fields' });
    }

    const existingUser = await User.findOne({ email });
    if (existingUser) {
        return res.status(400).json({ error: 'User already exists' });
    }
    const userName = `${firstName}_${lastName}`;
    const newUser = new User({ 
        firstName: firstName, 
        lastName: lastName, 
        userName, 
        email, 
        password: await hashPassword(password),
    });
    try {
        await newUser.save();
        res.status(201).json({ success: true, message: 'User created successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
});

// Login a user
router.post('/login', async (req, res) => {
    const { email, password } = req.body;
    if (!email || !password) {
        return res.status(400).json({ error: 'Please enter all fields' });
    }

    try {
        const existingUser = await User.findOne({ email });
        if (!existingUser) {
            return res.status(404).json({ error: 'User not found' });
        }
        
        const isPasswordCorrect = await bcrypt.compare(password, existingUser.password);
        if (!isPasswordCorrect) {
            return res.status(400).json({ error: 'Invalid credentials' });
        }
        if (isPasswordCorrect && existingUser) {
            res.status(200).json({ success: true, message: 'User logged in successfully' });
        }
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
});

// Forgot password
router.post('/forgot-password', async (req, res) => {
    const { email } = req.body;
    const { newPassword } = req.body;
    if (!email) {
        return res.status(400).json({ error: 'Please enter your email' });
    }

    const existingUser = await User.findOne({ email });
    if (!existingUser) {
        return res.status(404).json({ error: 'User not found' });
    }
    const newHashedPassword = await hashPassword(newPassword);
    existingUser.password = newHashedPassword;
    try {
        await existingUser.save();
        res.status(200).json({ success: true, message: 'Password reset successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    } 
});

// Get user by email
router.get('/getUserByEmail/:email', async (req, res) => {
    const { email } = req.params;
    if (!email) {
        return res.status(400).json({ error: 'Please enter your email' });
    }

    const existingUser = await User.findOne({ email });
    if (!existingUser) {
        return res.status(404).json({ error: 'User not found' });
    }
    res.status(200).json({ success: true, user: existingUser });
});

// Update user details
router.put('/updateUser/:email', async (req, res) => {
    const { email } = req.params;
    const { firstName, lastName, userName, password } = req.body;
    if (!email) {
        return res.status(400).json({ error: 'Please enter your email' });
    }

    const existingUser = await User.findOne({ email });
    if (!existingUser) {
        return res.status(404).json({ error: 'User not found' });
    }
    existingUser.firstName = firstName;
    existingUser.lastName = lastName;
    existingUser.userName = userName;
    existingUser.password = await hashPassword(password);
    try {
        await existingUser.save();
        res.status(200).json({ success: true, message: 'User updated successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' });
    }
});

module.exports = router;