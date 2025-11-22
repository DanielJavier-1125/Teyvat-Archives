const express = require('express');
const cors = require('cors');
const app = express();
require('dotenv').config();

const PORT = process.env.PORT;
const authenticateToken = require('./middleware/auth');
const authorizeRole = require('./middleware/role');
const userRoutes = require('./routes/userRoutes');
const characterRoutes = require('./routes/characterRoutes');
const weaponRoutes = require('./routes/weaponRoutes');
const artifactRoutes = require('./routes/artifactRoutes');
const buildRoutes = require('./routes/buildRoutes');
const ratingRoutes = require('./routes/ratingRoutes')

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/users', userRoutes);
app.use('/characters', characterRoutes);
app.use('/weapons', weaponRoutes);
app.use('/artifacts', artifactRoutes)
app.use('/builds', buildRoutes);
app.use('/ratings', ratingRoutes)

app.get('/protected', authenticateToken, (req, res) => {
  res.json({ message: 'This is protected data', user: req.user });
});

app.get('/admin', authenticateToken, authorizeRole('admin'), (req, res) => {
  res.json({ message: 'Admin only data', user: req.user });
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});