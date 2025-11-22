const db = require('../database');
    
const Build = {

    getAllBuild: () => {
    return new Promise((resolve, reject) => {
      db.query('SELECT b.build_id, u.username AS build_creator, c.name AS character_name, c.rarity AS character_rarity, c.element AS character_element, w.name AS weapon_name, w.type AS weapon_type, w.rarity AS weapon_rarity, a.name as artifact_set, b.notes, b.average_rating, b.created_at, b.updated_at FROM builds b JOIN users u ON b.user_id = u.user_id JOIN characters c ON b.character_id = c.character_id JOIN weapons w ON b.weapon_id = w.weapon_id JOIN artifacts a ON b.artifact_id = a.artifact_id;', (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  },

    getBuildsByUserId: (id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT b.build_id, u.username AS build_creator, c.name AS character_name, c.rarity AS character_rarity, c.element AS character_element, w.name AS weapon_name, w.type AS weapon_type, w.rarity AS weapon_rarity, a.name as artifact_set, b.notes, b.average_rating, b.created_at, b.updated_at FROM builds b JOIN users u ON b.user_id = u.user_id JOIN characters c ON b.character_id = c.character_id JOIN weapons w ON b.weapon_id = w.weapon_id JOIN artifacts a ON b.artifact_id = a.artifact_id WHERE b.user_id = ?;', [id], (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  },

    getBuildById: (id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT b.build_id, u.username AS build_creator, c.name AS character_name, c.rarity AS character_rarity, c.element AS character_element, w.name AS weapon_name, w.type AS weapon_type, w.rarity AS weapon_rarity, a.name as artifact_set, b.notes, b.average_rating, b.created_at, b.updated_at FROM builds b JOIN users u ON b.user_id = u.user_id JOIN characters c ON b.character_id = c.character_id JOIN weapons w ON b.weapon_id = w.weapon_id JOIN artifacts a ON b.artifact_id = a.artifact_id WHERE build_id = ?', [id], (err, results) => {
        if (err) reject(err);
        resolve(results[0]);
      });
    });
  },

    getBuildByCharacterId: (character_id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT b.build_id, u.username AS build_creator, c.name AS character_name, c.rarity AS character_rarity, c.element AS character_element, w.name AS weapon_name, w.type AS weapon_type, w.rarity AS weapon_rarity, a.name as artifact_set, b.notes, b.average_rating, b.created_at, b.updated_at FROM builds b JOIN users u ON b.user_id = u.user_id JOIN characters c ON b.character_id = c.character_id JOIN weapons w ON b.weapon_id = w.weapon_id JOIN artifacts a ON b.artifact_id = a.artifact_id WHERE b.character_id = ?', [character_id], (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  },

    createBuild: (buildData) => {
        return new Promise((resolve, reject) => {
        const { user_id, character_id, weapon_id, artifact_id, notes } = buildData;
        db.query(
            'INSERT INTO builds (user_id, character_id, weapon_id, artifact_id, notes) VALUES (?, ?, ?, ?, ?)',
            [user_id, character_id, weapon_id, artifact_id, notes],
            (err, results) => {
            if (err) reject(err);
            resolve({ build_id: results.insertId, ...buildData });
            }
        );
        });
    },
    
    updateBuild: (build_id, buildData) => {
    return new Promise((resolve, reject) => {
      const { weapon_id, artifact_id, notes } = buildData;
      db.query(
        'UPDATE builds SET weapon_id = ?, artifact_id = ?, notes = ? WHERE build_id = ?',
        [weapon_id, artifact_id, notes, build_id],
        (err, results) => {
          if (err) reject(err);
          resolve(results);
        }
      );
    });
  },

    deleteBuild: (build_id) => {
    return new Promise((resolve, reject) => {
      db.query('DELETE FROM builds WHERE build_id = ?', [build_id], (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  }
};

module.exports = Build