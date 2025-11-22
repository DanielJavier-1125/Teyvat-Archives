const db = require('../database');

const Weapon = {
  getAll: () => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM weapons', (err, results) => {
        if (err) return reject(err);
        resolve(results);
      });
    });
  },

  getById: (weapon_id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM weapons WHERE weapon_id = ?', [weapon_id], (err, results) => {
        if (err) return reject(err);
        if (!results || results.length === 0) return resolve(null);
        resolve(results[0]);
      });
    });
  },

  create: (weaponData) => {
    return new Promise((resolve, reject) => {
      const { name, type, rarity, base_attack, secondary_stat, effect } = weaponData;
      db.query(
        `INSERT INTO weapons (name, type, rarity, base_attack, secondary_stat, effect) 
         VALUES (?, ?, ?, ?, ?, ?)`,
        [name, type, rarity, base_attack, secondary_stat, effect],
        (err, results) => {
          if (err) return reject(err);
          resolve({ weapon_id: results.insertId, ...weaponData });
        }
      );
    });
  },

  update: (weapon_id, weaponData) => {
    return new Promise((resolve, reject) => {
      const { name, type, rarity, base_attack, secondary_stat, effect } = weaponData;
      db.query(
        `UPDATE weapons SET name = ?, type = ?, rarity = ?, base_attack = ?, secondary_stat = ?, effect = ? 
         WHERE weapon_id = ?`,
        [name, type, rarity, base_attack, secondary_stat, effect, weapon_id],
        (err, results) => {
          if (err) return reject(err);
          resolve(results);
        }
      );
    });
  },

  delete: (weapon_id) => {
    return new Promise((resolve, reject) => {
      db.query('DELETE FROM weapons WHERE weapon_id = ?', [weapon_id], (err, results) => {
        if (err) return reject(err);
        resolve(results);
      });
    });
  },

  getByType: (type) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM weapons WHERE type = ?', [type], (err, results) => {
        if (err) return reject(err);
        resolve(results);
      });
    });
  },

  getByRarity: (rarity) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM weapons WHERE rarity = ?', [rarity], (err, results) => {
        if (err) return reject(err);
        resolve(results);
      });
    });
  }
};

module.exports = Weapon;
