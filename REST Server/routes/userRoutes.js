const express = require('express');
const userController = require('./../controllers/userController');
const authController = require('./../controllers/authController');

const router = express.Router();

// USER MUST BE LOGGED IN TO ACCESS THE ROUTES BELOW
router.use(authController.protect);

router.patch('/setAdmin', userController.getMe, userController.setAdmin);
router.patch(
  '/addUserToOutlet',
  userController.getMe,
  userController.addUserToOutlet
);
router.post(
  '/getLocationOfOutlets',
  userController.getMe,
  userController.getLocationOfOutlets
);
router.post('/sendSOS', userController.getMe, userController.sendSOS);

module.exports = router;
