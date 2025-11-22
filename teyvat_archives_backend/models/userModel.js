const db = require('../database');
const bcrypt = require('bcrypt');

const Users = {
  findByUsername: (username) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM users WHERE username = ?', [username], (err, results) => {
        if (err) return reject(err);
        resolve(results[0]); // return the first user
      });
    });
  },

  findByUsernameExcludingUser: (username, user_id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM users WHERE username = ? AND user_id != ?', [username, user_id], (err, results) => {
        if (err) return reject(err);
        resolve(results); // return the first user
      });
    });
  },

  findByEmail: (email) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM users WHERE email = ?', [email], (err, results) => {
        if (err) return reject(err);
        resolve(results[0]);
      });
    });
  },

  getAllUsers: () => {
    return new Promise((resolve, reject) => {
      db.query('SELECT user_id, username, email, role FROM users', (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  },

  getUserById: (id) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT user_id, username, email, role FROM users WHERE user_id = ?', [id], (err, results) => {
        if (err) reject(err);
        resolve(results[0]);
      });
    });
  },

  createUser: (username, email, password, role = 'user') => {
    return new Promise((resolve, reject) => {
      bcrypt.hash(password, 10, (err, hashed) => {
        if (err) return reject(err);

        db.query(
          'INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)',
          [username, email, hashed, role],
          (err, result) => {
            if (err) return reject(err);
            resolve(result);
          }
        );
      });
    });
  },

    updateProfile: (user_id, userData) => {
    return new Promise((resolve, reject) => {
      const { username, email } = userData;
      db.query(
        'UPDATE users SET username = ?, email = ? WHERE user_id = ?',
        [username, email, user_id],
        (err, results) => {
          if (err) reject(err);
          resolve(results);
        }
      );
    });
  },

    deleteProfile: (user_id) => {
    return new Promise((resolve, reject) => {
      db.query('DELETE FROM users WHERE user_id = ?', [user_id], (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  }
};

module.exports = Users;
