const db = require('../database')
const Build = require('../models/buildModel');

const buildController = {

    getAllBuilds: async (req, res) => {
    try {
      const builds = await Build.getAllBuild();
      res.json({
        success: true,
        data: builds
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching builds',
        error: error.message
      });
    }
  },

    getMyBuilds: async (req, res) => {
    try {
      const user_id = req.user.user_id;
      const builds = await Build.getBuildsByUserId(user_id);
      
      res.json({
        success: true,
        data: builds
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching builds',
        error: error.message
      });
    }
  },

    getBuildById: async (req, res) => {
    try {
      const build = await Build.getBuildById(req.params.id);
      if (!build) {
        return res.status(404).json({
          success: false,
          message: 'Build not found'
        });
      }
      res.json({
        success: true,
        data: build
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching build!',
        error: error.message
      });
    }
  },

    getBuildByCharacterId: async (req, res) => {
    try {
      const build = await Build.getBuildByCharacterId(req.params.character_id);
      if (!build) {
        return res.status(404).json({
          success: false,
          message: 'Builds for Character not found'
        });
      }
      res.json({
        success: true,
        data: build
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching build!',
        error: error.message
      });
    }
  },

  createBuild: async (req, res) => {
    try {
      const { character_id, weapon_id, artifact_id, notes } = req.body;
      const user_id = req.user.user_id;

      if (!character_id || !weapon_id || !artifact_id) {
        return res.status(400).json({
          success: false,
          message: 'character_id, weapon_id, and artifact_id are required inp'
        });
      }

      const [[charExists]] = await db.promise().query("SELECT character_id FROM characters WHERE character_id = ?", [character_id]);
      if (!charExists) {
        return res.status(400).json({
          success: false, 
          message: "Character not Found"});
      }
      
      const [[weaponExists]] = await db.promise().query("SELECT weapon_id FROM weapons WHERE weapon_id = ?", [weapon_id]);
      if (!weaponExists) {
        return res.status(400).json({
          success: false,
          message: "Weapon not Found"
        });
      }
      const [[weaponType]] = await db.promise().query("SELECT type FROM weapons WHERE weapon_id = ?", [weapon_id]);
      const [[characterType]] = await db.promise().query("SELECT weapon_type FROM characters WHERE character_id = ?", [character_id]);
      if (weaponType.type != characterType.weapon_type) {
        return res.status(400).json({
          success: false,
          message: "Weapon does not match with Character!"
        });
      }

      const [[artifactExists]] = await db.promise().query("SELECT artifact_id FROM artifacts WHERE artifact_id = ?", [artifact_id]);
      if (!artifactExists) {
        return res.status(400).json({
          success: false,
          message: "Artifact not Found"
        });
      }

      const newBuild = await Build.createBuild({
        user_id,
        character_id,
        weapon_id,
        artifact_id,
        notes
      });

      res.status(201).json({
        success: true,
        message: 'Build created successfully',
        data: newBuild
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error creating build',
        error: error.message
      });
    }
  },

    updateBuild: async (req, res) => {
    try {
      const { weapon_id, artifact_id, notes } = req.body;
      const build_id = req.params.id;
      const username = req.user.username;

      // Check if build exists
      const existingBuild = await Build.getBuildById(build_id);
      if (!existingBuild) {
        return res.status(404).json({
          success: false,
          message: 'Build not found'
        });
      }

      // Validation
      if (username != existingBuild.build_creator) {
        return res.status(403).json({
          success: false,
          message: "You are not the creator of this build!"
        });
      }

      if (!weapon_id || !artifact_id ) {
        return res.status(400).json({
          success: false,
          message: 'weapon_id and artifact_id fields are required'
        });
      }

      const [[weaponExists]] = await db.promise().query("SELECT weapon_id FROM weapons WHERE weapon_id = ?", [weapon_id]);
      if (!weaponExists) {
        return res.status(400).json({
          success: false,
          message: "Weapon not Found"
        });
      }

      const [[weaponType]] = await db.promise().query("SELECT type FROM weapons WHERE weapon_id = ?", [weapon_id]);
      const [[characterType]] = await db.promise().query("SELECT weapon_type FROM characters WHERE name = ?", [existingBuild.character_name]);
      if (weaponType.type != characterType.weapon_type) {
        return res.status(400).json({
          success: false,
          message: "Weapon does not match with Character!"
        });
      }

      const [[artifactExists]] = await db.promise().query("SELECT artifact_id FROM artifacts WHERE artifact_id = ?", [artifact_id]);
      if (!artifactExists) {
        return res.status(400).json({
          success: false,
          message: "Artifact not Found"
        });
      }

      await Build.updateBuild(build_id, {
        weapon_id,
        artifact_id,
        notes
      });

      res.json({
        success: true,
        message: 'Build updated successfully'
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error updating build',
        error: error.message
      });
    }
  },

    deleteBuild: async (req, res) => {
    try {
      const build_id = req.params.id;
      const username = req.user.username;

      const existingBuild = await Build.getBuildById(build_id);
      if (!existingBuild) {
        return res.status(404).json({
          success: false,
          message: 'Build not found'
        });
      }
      
      const role = req.user.role;
      if (role != "admin" && username != existingBuild.build_creator) {
        return res.status(403).json({
          success: false,
          message: 'You do not have Admin Privileges!'
        });
      }

      await Build.deleteBuild(build_id);

      res.json({
        success: true,
        message: 'Build deleted successfully'
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error deleting build',
        error: error.message
      });
    }
  }

};

module.exports = buildController

