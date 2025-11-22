const db = require('../database')
const Build = require('../models/buildModel');
const Character = require('../models/characterModel')
const Rating = require('../models/ratingModel');

const ratingController = { 


    rateTarget: async (req, res) => {
        try {
        
        const allowedTargets = ['build', 'character'];
        const { target_type, target_id, score, comments } = req.body;
        const user_id = req.user.user_id;

        if (!target_type || !target_id || !score ) {
            return res.status(400).json({
            success: false,
            message: 'target_type, target_id, score are required inputs!'
            });
        }

        if (!allowedTargets.includes(target_type)) {
            return res.status(400).json({
            success: false,
            message: 'Invalid Target! Must only input "build" or "character"!'
            });
        }
        
        if (target_type == "build") {
            const targetBuild = await Build.getBuildById(target_id);
            if (!targetBuild) {
                return res.status(400).json({
                success: false, 
                message: "Build not Found"
            });
            }
        }

        if (target_type == "character") {
            const targetCharacter = await Character.getById(target_id);
            if (!targetCharacter) {
                return res.status(400).json({
                success: false, 
                message: "Character not Found"
            });
            }
        }

        if (score < 1 || score > 5) {
             return res.status(400).json({
            success: false,
            message: "Score must be between 1 and 5"
            });
        }

        const newRating = await Rating.rateTarget({
            user_id,
            target_type,
            target_id,
            score,
            comments
        });

        res.status(201).json({
            success: true,
            message: 'Target rated successfully',
            data: newRating
        });
        } catch (error) {
        res.status(500).json({
            success: false,
            message: 'Error creating rating',
            error: error.message
        });
        }
    },

    getMyRatings: async (req, res) => {
    try {
      const user_id = req.user.user_id;
      const ratings = await Rating.getRatingsByMe(user_id);
      res.json({
        success: true,
        data: ratings
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching ratings',
        error: error.message
      });
    }
  },

    getRatingByTargetId: async (req, res) => {
    try {
      
        const target = req.params.target
        if (target == "build"){
            const buildRating = await Rating.getRatingsByBuildId(req.params.id);
            if (!buildRating) {
            return res.status(404).json({
            success: false,
            message: 'There are no ratings for this build!'
            });
            }
            res.json({
            success: true,
            data: buildRating
            });
        }
        if (target == "character") {
            const characterRating = await Rating.getRatingsByCharacterId(req.params.id);
            if (!characterRating) {
            return res.status(404).json({
            success: false,
            message: 'There are no ratings for this Character!'
            });
            }
            res.json({
            success: true,
            data: characterRating
            });
        }
        
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching build!',
        error: error.message
      });
    }
  },

    getAverageRatingByTargetId: async (req, res) => {
    try {
      
        const target = req.params.target
        if (target == "build"){
            const buildRating = await Rating.getAverageRatingsByBuildId(req.params.id);
            if (!buildRating) {
            return res.status(404).json({
            success: false,
            message: 'There are no ratings for this build!'
            });
            }
            res.json({
            success: true,
            data: buildRating
            });
        }
        if (target == "character") {
            const characterRating = await Rating.getAverageRatingsByCharacterId(req.params.id);
            if (!characterRating) {
            return res.status(404).json({
            success: false,
            message: 'There are no ratings for this Character!'
            });
            }
            res.json({
            success: true,
            data: characterRating
            });
        }
        
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error fetching build!',
        error: error.message
      });
    }
  },

    updateRating: async (req, res) => {
    try {
      const { score, comments } = req.body;
      const rating_id = req.params.id;
      const user_id = req.user.user_id;

      const existingRating = await Rating.getRatingById(rating_id);
      if (!existingRating) {
        return res.status(404).json({
          success: false,
          message: 'Rating not found'
        });
      }

      if (user_id != existingRating.user_id) {
        return res.status(403).json({
          success: false,
          message: "You are not the creator of this rating!"
        });
      }

      if (!score) {
        return res.status(400).json({
          success: false,
          message: 'score field is required!'
        });
      }

      if (score < 1 || score > 5) {
             return res.status(400).json({
            success: false,
            message: "Score must be between 1 and 5"
            });
        }

      await Rating.updateRating(rating_id, {
        score,
        comments
      });

      res.json({
        success: true,
        message: 'Rating updated successfully'
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error updating rating',
        error: error.message
      });
    }
  },

    deleteRating: async (req, res) => {
    try {
      const rating_id = req.params.id;
      const user_id = req.user.user_id;

      const existingRating = await Rating.getRatingById(rating_id);
      if (!existingRating) {
        return res.status(404).json({
          success: false,
          message: 'Rating not found'
        });
      }

      const role = req.user.role;
      if (role != "admin" && user_id != existingRating.user_id) {
        return res.status(403).json({
          success: false,
          message: 'You do not have Admin Privileges!'
        });
      }

      await Rating.deleteRating(rating_id);

      res.json({
        success: true,
        message: 'Rating deleted successfully!'
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        message: 'Error deleting rating!',
        error: error.message
      });
    }
  }

};

module.exports = ratingController;