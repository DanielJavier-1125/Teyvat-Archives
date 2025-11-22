const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const authenticateToken = require('../middleware/auth');

router.post('/login', userController.login);
router.post('/register', userController.register);
router.get('/me', authenticateToken, userController.getMyProfile)
router.put('/me/update', authenticateToken, userController.updateMyProfile)
router.delete('/me/delete', authenticateToken, userController.deleteMyProfile);

//Admin Routes
router.get('/all', authenticateToken, userController.getAllUsers);
router.get('/:id', authenticateToken, userController.getUserById);
router.put('/update/:id', authenticateToken, userController.updateProfile);
router.delete('/delete/:id', authenticateToken, userController.deleteProfile)


module.exports = router;