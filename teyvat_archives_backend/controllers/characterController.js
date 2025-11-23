const Character = require('../models/characterModel');

const characterController = {

  // Get all characters
  getAllCharacters: async (req, res) => {
    try {
      const characters = await Character.getAll();
      res.json({
        success: true,
        data: characters
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching characters',
        error: error.message
      });
    }
  },

  // Get character by ID (character_id)
  getCharacterById: async (req, res) => {
    try {
      const characterId = req.params.character_id;
      const character = await Character.getById(characterId);

      if (!character) {
        return res.status(404).json({
          success: false,
          message: 'Character not found'
        });
      }

      res.json({
        success: true,
        data: character
      });

    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching character',
        error: error.message
      });
    }
  },

  // Create new character
  addCharacter: async (req, res) => {
    try {
      const { character_id, name, element, weapon_type, rarity, region } = req.body;

      const role = req.user.role;
      if (role != "admin") {
        return res.status(403).json({
          success: false,
          message: 'You do not have Admin Privileges!'
        });
      }
      
      // Validation
      if (!character_id || !name || !element || !weapon_type || !rarity || !region) {
        return res.status(400).json({
          success: false,
          message: 'All fields (character_id, name, element, weapon_type, rarity, region) are required'
        });
      }

      const newCharacter = await Character.create({
        character_id,
        name,
        element,
        weapon_type,
        rarity,
        region
      });

      res.status(201).json({
        success: true,
        message: 'Character created successfully',
        data: newCharacter
      });

    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error creating character',
        error: error.message
      });
    }
  },

  // Update character
  updateCharacter: async (req, res) => {
    try {
      const { name, element, weapon_type, rarity, region } = req.body;
      const characterId = req.params.character_id;

      const role = req.user.role;
      if (role != "admin") {
        return res.status(403).json({
          success: false,
          message: 'You do not have Admin Privileges!'
        });
      }

      // Check if character exists
      const existingCharacter = await Character.getById(characterId);
      if (!existingCharacter) {
        return res.status(404).json({
          success: false,
          message: 'Character not found'
        });
      }

      // Validation
      if (!name || !element || !weapon_type || !rarity || !region) {
        return res.status(400).json({
          success: false,
          message: 'All fields (name, element, weapon_type, rarity, region) are required'
        });
      }

      await Character.update(characterId, {
        name,
        element,
        weapon_type,
        rarity,
        region
      });

      res.json({
        success: true,
        message: 'Character updated successfully'
      });

    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error updating character',
        error: error.message
      });
    }
  },

  // Delete character
  deleteCharacter: async (req, res) => {
    try {
      const characterId = req.params.character_id;

      const role = req.user.role;
      if (role != "admin") {
        return res.status(403).json({
          success: false,
          message: 'You do not have Admin Privileges!'
        });
      }

      const existingCharacter = await Character.getById(characterId);
      if (!existingCharacter) {
        return res.status(404).json({
          success: false,
          message: 'Character not found'
        });
      }

      await Character.delete(characterId);

      res.json({
        success: true,
        message: 'Character deleted successfully'
      });

    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error deleting character',
        error: error.message
      });
    }
  },

  // Get characters by element
  getCharactersByElement: async (req, res) => {
    try {
      const { element } = req.params;
      const characters = await Character.getByElement(element);

      res.json({
        success: true,
        data: characters
      });

    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching characters by element',
        error: error.message
      });
    }
  },

  // Get characters by rarity
  getCharactersByRarity: async (req, res) => {
    try {
      const { rarity } = req.params;
      const characters = await Character.getByRarity(rarity);

      res.json({
        success: true,
        data: characters
      });

    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching characters by rarity',
        error: error.message
      });
    }
  }
};

module.exports = characterController;
