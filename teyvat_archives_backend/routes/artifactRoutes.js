const express = require('express');
const router = express.Router();
const artifactController = require('../controllers/artifactController');

// GET /api/artifacts - Get all students
router.get('/', artifactController.getAllArtifacts);

// // GET /api/artifacts/:id - Get artifact by ID
router.get('/:id', artifactController.getArtifactById);

// // POST /api/artifacts - Add new artifact
router.post('/', artifactController.addArtifacts);

// // PUT /api/artifacts/:id - Update artifact
router.put('/:id', artifactController.updateArtifact);

// // DELETE /api/artifacts/:id - Delete artifact
router.delete('/:id', artifactController.deleteArtifacts);

module.exports = router;