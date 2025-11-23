const db = require('../database');

const Rating = {

    rateTarget: (rating) => {
        return new Promise((resolve, reject) => {
        const { user_id, target_type, target_id, score, comments } = rating;
        db.query(
            'INSERT INTO ratings (user_id, target_type, target_id, score, comment) VALUES (?, ?, ?, ?, ?)',
            [user_id, target_type, target_id, score, comments],
            (err, results) => {
            if (err) reject(err);
            resolve({ rating_id: results.insertId, ...rating });
            }
        );
        });
    },

    getRatingsByMe: (id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT r.rating_id, r.target_type, CASE WHEN r.target_type = "build" THEN b.character_id WHEN r.target_type = "character" THEN c.character_id END AS Character_Name, r.score AS Score, r.comment AS Comment FROM ratings r LEFT JOIN builds b ON r.target_type = "build" AND r.target_id = b.build_id LEFT JOIN characters c ON r.target_type = "character" AND r.target_id = c.character_id WHERE r.user_id = ?;', [id], (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  },

    getRatingById: (id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM ratings WHERE rating_id = ?;', [id], (err, results) => {
        if (err) reject(err);
        resolve(results[0]);
      });
    });
  },

    getRatingsByBuildId: (id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT ROW_NUMBER() OVER (ORDER BY r.rating_id) AS Ratings, own.username as Build_Creator, c.name as Character_Build, w.name as Weapon, a.name as Artifacts, r.score as Score, r.comment as Comment, u.username as Rater, r.updated_at as Date_Rated FROM ratings r JOIN builds b ON r.target_id = b.build_id JOIN characters c ON b.character_id = c.character_id JOIN weapons w ON b.weapon_id = w.weapon_id JOIN artifacts a ON b.artifact_id = a.artifact_id JOIN users own ON b.user_id = own.user_id JOIN users u ON r.user_id = u.user_id WHERE target_id = ?;', [id], (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  },

    getRatingsByCharacterId: (id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT ROW_NUMBER() OVER (ORDER BY r.rating_id) AS Ratings, c.name as Character_Name, c.rarity as Rarity, c.weapon_type as Weapon, r.score as Score, r.comment as Comment, r.updated_at as Date_Rated FROM ratings r JOIN characters c ON r.target_id = c.character_id WHERE target_id = ?;', [id], (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  },

    getAverageRatingsByCharacterId: (id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT name as Character_Name, rarity as Rarity, weapon_type as Weapon, character_rating as Character_Rating FROM characters WHERE character_id = ?;', [id], (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  },
    
    getAverageRatingsByBuildId: (id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT u.username as Build_Creator, c.name as Character_Name, w.name as Weapon, a.name as Artifact_Set, b.average_rating as Average_Rating FROM builds b JOIN users u ON b.user_id = u.user_id JOIN characters c ON b.character_id = c.character_id JOIN weapons w ON b.weapon_id = w.weapon_id JOIN artifacts a ON b.artifact_id = a.artifact_id WHERE build_id = ?;', [id], (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  },

    updateRating: (rating_id, ratingData) => {
    return new Promise((resolve, reject) => {
      const { score, comments } = ratingData;
      db.query(
        'UPDATE ratings SET score = ?, comment = ? WHERE rating_id = ?',
        [score, comments, rating_id],
        (err, results) => {
          if (err) reject(err);
          resolve(results);
        }
      );
    });
  },

    deleteRating: (rating_id) => {
    return new Promise((resolve, reject) => {
      db.query('DELETE FROM ratings WHERE rating_id = ?', [rating_id], (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  }
}

module.exports = Rating