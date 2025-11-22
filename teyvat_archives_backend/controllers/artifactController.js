const Artifacts = require('../models/artifactModel');

const artifactController = {
  // Get all artifacts
  getAllArtifacts: async (req, res) => {
    try {
      const artifact = await Artifacts.getAll();
      res.json({
        success: true,
        data: artifact
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching artifact',
        error: error.message
      });
    }
  },

  // Get artifact by ID
  getArtifactById: async (req, res) => {
    try {
      const artifact = await Artifacts.getById(req.params.id);
      if (!artifact) {
        return res.status(404).json({
          success: false,
          message: 'Artifact not found'
        });
      }
      res.json({
        success: true,
        data: artifact
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching artifact',
        error: error.message
      });
    }
  },

  addArtifacts: async (req, res) => {
    try {
      const { name, set_bonus_2pc, set_bonus_4pc, rarity } = req.body;

      if (!name || !set_bonus_2pc || !set_bonus_4pc || !rarity) {
        return res.status(400).json({
          success: false,
          message: 'All fields (name, set_bonus_2pc, set_bonus_4pc, rarity) are required'
        });
      }

      const newArtifact = await Artifacts.create({
        name,
        set_bonus_2pc,
        set_bonus_4pc,
        rarity
      });

      res.status(201).json({
        success: true,
        message: 'Artifact added successfully',
        data: newArtifact
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error adding artifact',
        error: error.message
      });
    }
  },

  updateArtifact: async (req, res) => {
    try {
      const { name, set_bonus_2pc, set_bonus_4pc, rarity } = req.body;
      const artifactId = req.params.id;

      const existingArtifact = await Artifacts.getById(artifactId);
      if (!existingArtifact) {
        return res.status(404).json({
          success: false,
          message: 'Artifact not found'
        });
      }

      if (!name || !set_bonus_2pc || !set_bonus_4pc || !rarity) {
        return res.status(400).json({
          success: false,
          message: 'All fields (name, set_bonus_2pc, set_bonus_4pc, rarity) are required'
        });
      }

      await Artifacts.update(artifactId, {
        name,
        set_bonus_2pc,
        set_bonus_4pc,
        stararitytus
      });

      res.json({
        success: true,
        message: 'Artifact updated successfully'
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error updating artifact',
        error: error.message
      });
    }
  },

  deleteArtifacts: async (req, res) => {
    try {
      const artifactId = req.params.id;

      const existingArtifact = await Artifacts.getById(artifactId);
      if (!existingArtifact) {
        return res.status(404).json({
          success: false,
          message: 'Artifact not found'
        });
      }

      await Artifacts.delete(artifactId);

      res.json({
        success: true,
        message: 'Artifact deleted successfully'
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error deleting Artifact',
        error: error.message
      });
    }
  }

};

module.exports = artifactController;