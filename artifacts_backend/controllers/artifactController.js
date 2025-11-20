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

//   // Add new artifact
  addArtifacts: async (req, res) => {
    try {
      const { name, set_bonus_2pc, set_bonus_4pc, rarity } = req.body;

      // Validation
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

//   // Update artifacts
  updateArtifact: async (req, res) => {
    try {
      const { name, set_bonus_2pc, set_bonus_4pc, rarity } = req.body;
      const artifactId = req.params.id;

      // Check if artifact exists
      const existingArtifact = await Artifacts.getById(artifactId);
      if (!existingArtifact) {
        return res.status(404).json({
          success: false,
          message: 'Artifact not found'
        });
      }

      // Validation
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

//   // Delete artifact
  deleteArtifacts: async (req, res) => {
    try {
      const artifactId = req.params.id;

      // Check if artifact exists
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
  },

//   // Get students by status
  // getStudentsByStatus: async (req, res) => {
  //   try {
  //     const { status } = req.params;
  //     const students = await Student.getByStatus(status);
      
  //     res.json({
  //       success: true,
  //       data: students
  //     });
  //   } catch (error) {
  //     res.status(500).json({
  //       success: false,
  //       message: 'Error fetching students by status',
  //       error: error.message
  //     });
  //   }
  // },
  // //   // Get students by status
  // getStudentsByFirstName: async (req, res) => {
  //   try {
  //     const { firstname } = req.params;
  //     const students = await Student.getByFirstName(firstname);
      
  //     res.json({
  //       success: true,
  //       data: students
  //     });
  //   } catch (error) {
  //     res.status(500).json({
  //       success: false,
  //       message: 'Error fetching students by firstname',
  //       error: error.message
  //     });
  //   }
  // }
};

module.exports = artifactController;