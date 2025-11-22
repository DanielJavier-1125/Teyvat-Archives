const express = require('express');
const router = express.Router();
const authenticatetoken = require('../middleware/auth')
const weaponController = require('../controllers/weaponController');

// GET /api/weapons - Get all weapons
router.get('/', authenticatetoken, weaponController.getAllWeapons);

// GET /api/weapons/type/:type - Get weapons by type
router.get('/type/:type', authenticatetoken, weaponController.getWeaponsByType);

// GET /api/weapons/rarity/:rarity - Get weapons by rarity
router.get('/rarity/:rarity', authenticatetoken, weaponController.getWeaponsByRarity);

// GET /api/weapons/:weapon_id - Get weapon by ID
router.get('/:weapon_id', authenticatetoken, weaponController.getWeaponById);

// POST /api/weapons - Add new weapon
router.post('/', authenticatetoken, weaponController.addWeapon);

// PUT /api/weapons/:weapon_id - Update weapon
router.put('/:weapon_id', authenticatetoken, weaponController.updateWeapon);

// DELETE /api/weapons/:weapon_id - Delete weapon
router.delete('/:weapon_id', authenticatetoken, weaponController.deleteWeapon);

module.exports = router;
