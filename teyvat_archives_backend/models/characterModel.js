const db = require('../database');

const Character = {
  getAll: () => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM characters', (err, results) => {
        if (err) return reject(err);
        resolve(results);
      });
    });
  },

  getById: (character_id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM characters WHERE character_id = ?', [character_id], (err, results) => {
        if (err) return reject(err);
        if (!results || results.length === 0) return resolve(null);
        resolve(results[0]);
      });
    });
  },

  create: (characterData) => {
    return new Promise((resolve, reject) => {
      const { character_id, name, element, weapon_type, rarity, region } = characterData;
      db.query(
        'INSERT INTO characters (character_id, name, element, weapon_type, rarity, region) VALUES (?, ?, ?, ?, ?, ?)',
        [character_id, name, element, weapon_type, rarity, region],
        (err, results) => {
          if (err) return reject(err);
          resolve({characterData});
        }
      );
    });
  },

  update: (character_id, characterData) => {
    return new Promise((resolve, reject) => {
      const { name, element, weapon_type, rarity, region } = characterData;
      db.query(
        'UPDATE characters SET name = ?, element = ?, weapon_type = ?, rarity = ?, region = ? WHERE character_id = ?',
        [name, element, weapon_type, rarity, region, character_id],
        (err, results) => {
          if (err) return reject(err);
          resolve(results);
        }
      );
    });
  },

  delete: (character_id) => {
    return new Promise((resolve, reject) => {
      db.query('DELETE FROM characters WHERE character_id = ?', [character_id], (err, results) => {
        if (err) return reject(err);
        resolve(results);
      });
    });
  },

  getByElement: (element) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM characters WHERE element = ?', [element], (err, results) => {
        if (err) return reject(err);
        resolve(results);
      });
    });
  },

  getByRarity: (rarity) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM characters WHERE rarity = ?', [rarity], (err, results) => {
        if (err) return reject(err);
        resolve(results);
      });
    });
  }
};

module.exports = Character;
