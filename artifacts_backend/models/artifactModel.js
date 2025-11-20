const db = require('../database');

const Artifacts = {
  // Get all students
  getAll: () => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM artifacts', (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  },

  // Get student by ID
  getById: (id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM tbl_students WHERE id = ?', [id], (err, results) => {
        if (err) reject(err);
        resolve(results[0]);
      });
    });
  },

//   // Add new artifact
  add: (artifactData) => {
    return new Promise((resolve, reject) => {
      const { name, set_bonus_2pc, set_bonus_4pc, rarity } = artifactData;
      db.query(
        'INSERT INTO artifacts (name, set_bonus_2pc, set_bonus_4pc, rarity) VALUES (?, ?, ?, ?)',
        [name, set_bonus_2pc, set_bonus_4pc, rarity],
        (err, results) => {
          if (err) reject(err);
          resolve({ id: results.insertId, ...artifactData });
        }
      );
    });
  },

//   // Update artifacts
  update: (id, artifactData) => {
    return new Promise((resolve, reject) => {
      const { name, set_bonus_2pc, set_bonus_4pc, rarity } = artifactData;
      db.query(
        'UPDATE artifacts SET firstname = ?, lastname = ?, course = ?, status = ? WHERE id = ?',
        [name, set_bonus_2pc, set_bonus_4pc, rarity, id],
        (err, results) => {
          if (err) reject(err);
          resolve(results);
        }
      );
    });
  },

//   // Delete student
  delete: (id) => {
    return new Promise((resolve, reject) => {
      db.query('DELETE FROM artifacts WHERE id = ?', [id], (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  },

  // Get students by status
  // getByStatus: (status) => {
  //   return new Promise((resolve, reject) => {
  //     db.query('SELECT * FROM tbl_students WHERE status = ?', [status], (err, results) => {
  //       if (err) reject(err);
  //       resolve(results);
  //     });
  //   });
  // },
  // // Get students by status
  // getByFirstName: (firstname) => {
  //   return new Promise((resolve, reject) => {
  //     db.query('SELECT * FROM tbl_students WHERE firstname = ?', [firstname], (err, results) => {
  //       if (err) reject(err);
  //       resolve(results);
  //     });
  //   });
  // }
};

module.exports = Artifacts;