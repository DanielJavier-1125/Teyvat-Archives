const express = require('express');
const router = express.Router();
const authenticatetoken = require('../middleware/auth')
const characterController = require('../controllers/characterController');

// Get all characters
router.get('/', authenticatetoken, characterController.getAllCharacters);

// Get characters by element
router.get('/element/:element', authenticatetoken, characterController.getCharactersByElement);

// Get characters by rarity
router.get('/rarity/:rarity', authenticatetoken, characterController.getCharactersByRarity);

// Get character by ID
router.get('/:character_id', authenticatetoken, characterController.getCharacterById);

// Add new character
router.post('/', authenticatetoken, characterController.addCharacter);

// Update character
router.put('/:character_id', authenticatetoken, characterController.updateCharacter);

// Delete character
router.delete('/:character_id', authenticatetoken, characterController.deleteCharacter);

module.exports = router;
