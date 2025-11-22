const Weapon = require('../models/weaponModel');

const weaponController = {

  // Get all weapons
  getAllWeapons: async (req, res) => {
    try {
      const weapons = await Weapon.getAll();
      res.json({
        success: true,
        data: weapons
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching weapons',
        error: error.message
      });
    }
  },

  // Get weapon by ID (weapon_id)
  getWeaponById: async (req, res) => {
    try {
      const weaponId = req.params.weapon_id;
      const weapon = await Weapon.getById(weaponId);

      if (!weapon) {
        return res.status(404).json({
          success: false,
          message: 'Weapon not found'
        });
      }

      res.json({
        success: true,
        data: weapon
      });

    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching weapon',
        error: error.message
      });
    }
  },

  // Create new weapon
  addWeapon: async (req, res) => {
    try {
      const { name, type, rarity, base_attack, secondary_stat, effect } = req.body;

      // Validation: Require at least name, rarity, and base_attack
      if (!name || rarity === undefined || base_attack === undefined) {
        return res.status(400).json({
          success: false,
          message: 'Fields (name, rarity, base_attack) are required'
        });
      }

      const newWeapon = await Weapon.create({
        name,
        type,
        rarity,
        base_attack,
        secondary_stat,
        effect
      });

      res.status(201).json({
        success: true,
        message: 'Weapon created successfully',
        data: newWeapon
      });

    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error creating weapon',
        error: error.message
      });
    }
  },

  // Update weapon
  updateWeapon: async (req, res) => {
    try {
      const weaponId = req.params.weapon_id;
      const { name, type, rarity, base_attack, secondary_stat, effect } = req.body;

      // Check if weapon exists
      const existingWeapon = await Weapon.getById(weaponId);
      if (!existingWeapon) {
        return res.status(404).json({
          success: false,
          message: 'Weapon not found'
        });
      }

      // Validation
      if (!name || rarity === undefined || base_attack === undefined) {
        return res.status(400).json({
          success: false,
          message: 'Fields (name, rarity, base_attack) are required'
        });
      }

      await Weapon.update(weaponId, {
        name,
        type,
        rarity,
        base_attack,
        secondary_stat,
        effect
      });

      res.json({
        success: true,
        message: 'Weapon updated successfully'
      });

    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error updating weapon',
        error: error.message
      });
    }
  },

  // Delete weapon
  deleteWeapon: async (req, res) => {
    try {
      const weaponId = req.params.weapon_id;

      // Check if weapon exists
      const existingWeapon = await Weapon.getById(weaponId);
      if (!existingWeapon) {
        return res.status(404).json({
          success: false,
          message: 'Weapon not found'
        });
      }

      await Weapon.delete(weaponId);

      res.json({
        success: true,
        message: 'Weapon deleted successfully'
      });

    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error deleting weapon',
        error: error.message
      });
    }
  },

  // Get weapons by type
  getWeaponsByType: async (req, res) => {
    try {
      const { type } = req.params;
      const weapons = await Weapon.getByType(type);

      res.json({
        success: true,
        data: weapons
      });

    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching weapons by type',
        error: error.message
      });
    }
  },

  // Get weapons by rarity
  getWeaponsByRarity: async (req, res) => {
    try {
      const { rarity } = req.params;
      const weapons = await Weapon.getByRarity(rarity);

      res.json({
        success: true,
        data: weapons
      });

    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching weapons by rarity',
        error: error.message
      });
    }
  }
};

module.exports = weaponController;
