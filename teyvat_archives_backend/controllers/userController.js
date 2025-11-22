const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const Users = require('../models/userModel');

const userController = {
  login: async (req, res) => {
    try {
      const { username, password } = req.body;
      const user = await Users.findByUsername(username);

      if (!user) {
        return res.status(401).json({ message: 'Invalid credentials' });
      }

      const valid = await bcrypt.compare(password, user.password);

      if (!valid) {
        return res.status(401).json({ message: 'Invalid credentials' });
      }

      const token = jwt.sign(
        { user_id: user.user_id, username: user.username, role: user.role },
        process.env.JWT_SECRET,
        { expiresIn: '3h' }
      );

      res.json({ token });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error logging in',
        error: error.message
      });
    }
  },

  register: async (req, res) => {
  try {
    const { username, email, password, role } = req.body;

    if (!username || !email || !password) {
        return res.status(400).json({
          success: false,
          message: 'username, email, and password fields are required!'
        });
      }

    if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      return res.status(400).json({
      success: false,
      message: "Invalid email format"
        });
      }

    const existingUser = await Users.findByUsername(username);
    if (existingUser) {
      return res.status(400).json({ message: 'Username already exists' });
    }

    const existingEmail = await Users.findByEmail(email);
    if (existingEmail) {
      return res.status(400).json({ message: 'Email already exists' });
    }

    const result = await Users.createUser(username, email, password, role);

    res.status(201).json({
      success: true,
      message: 'User created',
      userId: result.insertId
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error registering user',
      error: error.message
    });
  }
},

  getAllUsers: async (req, res) => {
    try {
      const role = req.user.role;

      if (role != "admin") {
        return res.status(403).json({
          success: false,
          message: 'You do not have Admin Privileges!'
        });
      }

      const users = await Users.getAllUsers();
      res.json({
        success: true,
        data: users
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching users!',
        error: error.message
      });
    }
  },

  getUserById: async (req, res) => {
    try {
      const role = req.user.role;
      if (role != "admin") {
        return res.status(403).json({
          success: false,
          message: 'You do not have Admin Privileges!'
        });
      }
      
      const user = await Users.getUserById(req.params.id);
      if (!user) {
        return res.status(404).json({
          success: false,
          message: 'User not found!'
        });
      }
      res.json({
        success: true,
        data: user
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching User!',
        error: error.message
      });
    }
  },

  getMyProfile: async (req, res) => {
    try {
      const user_id = req.user.user_id;
      const myProfile = await Users.getUserById(user_id);
      res.json({
        success: true,
        data: myProfile
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching your profile!',
        error: error.message
      });
    }
  },

  updateMyProfile: async (req, res) => {
    try {
      const { username, email } = req.body;
      const user_id = req.user.user_id;

      if (!username || !email) {
        return res.status(400).json({
          success: false,
          message: 'username and email fields are required!'
        });
      }

      const existingUsername = await Users.findByUsernameExcludingUser(username, user_id);
      if (existingUsername.length > 0) {
        return res.status(403).json({
          success: false,
          message: 'Username already exists!'
        });
      }

      if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      return res.status(400).json({
      success: false,
      message: "Invalid email format"
        });
      }

      await Users.updateProfile(user_id, {
        username,
        email
      });

      res.json({
        success: true,
        message: 'Profile updated successfully'
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error updating profile',
        error: error.message
      });
    }
  },

  updateProfile: async (req, res) => {
    try {
      const { username, email } = req.body;
      const user_id = req.params.id

      if (!username || !email) {
        return res.status(400).json({
          success: false,
          message: 'username and email fields are required!'
        });
      }

      const role = req.user.role;
      if (role != "admin") {
        return res.status(403).json({
          success: false,
          message: 'You do not have Admin Privileges!'
        });
      }

      const existingUsername = await Users.findByUsername(username);
      if (existingUsername.length > 0) {
        return res.status(403).json({
          success: false,
          message: 'Username already exists!'
        });
      }

      if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      return res.status(400).json({
      success: false,
      message: "Invalid email format"
        });
      }

      await Users.updateProfile(user_id, {
        username,
        email
      });

      res.json({
        success: true,
        message: 'Profile updated successfully'
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error updating profile',
        error: error.message
      });
    }
  },

  deleteMyProfile: async (req, res) => {
    try {
      const user_id = req.user.user_id;

      await Users.deleteProfile(user_id);

      res.json({
        success: true,
        message: 'User deleted successfully!'
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error deleting User!',
        error: error.message
      });
    }
  },

  deleteProfile: async (req, res) => {
    try {
      const user_id = req.params.id;

      const role = req.user.role;
      if (role != "admin") {
        return res.status(403).json({
          success: false,
          message: 'You do not have Admin Privileges!'
        });
      }

      await Users.deleteProfile(user_id);

      res.json({
        success: true,
        message: 'User deleted successfully!'
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error deleting User!',
        error: error.message
      });
    }
  }

    
};

module.exports = userController;
