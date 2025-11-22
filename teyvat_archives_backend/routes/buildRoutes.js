const express = require('express');
const router = express.Router();
const authenticatetoken = require('../middleware/auth')
const buildController = require('../controllers/buildController');

router.get('/', buildController.getAllBuilds);

router.get('/me', authenticatetoken, buildController.getMyBuilds);

router.post('/create', authenticatetoken, buildController.createBuild);

router.get('/:id', authenticatetoken, buildController.getBuildById);

router.get('/character/:character_id', authenticatetoken, buildController.getBuildByCharacterId);

router.put('/:id', authenticatetoken, buildController.updateBuild);

router.delete('/delete/:id', authenticatetoken, buildController.deleteBuild);

module.exports = router