const express = require('express');
const router = express.Router();
const authenticatetoken = require('../middleware/auth')
const ratingController = require('../controllers/ratingController');

router.post('/rate', authenticatetoken, ratingController.rateTarget);
router.get('/:target/:id', authenticatetoken, ratingController.getRatingByTargetId);
router.get('/average/:target/:id', authenticatetoken, ratingController.getAverageRatingByTargetId);
router.get('/me', authenticatetoken, ratingController.getMyRatings);
router.put('/update/:id', authenticatetoken, ratingController.updateRating);
router.delete('/delete/:id', authenticatetoken, ratingController.deleteRating);

module.exports = router;