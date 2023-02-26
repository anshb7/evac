const mongoose = require('mongoose');

// A USER MUST SEND HIS NAME AND PHONE NUMBER
const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: [true, 'A user must have a name'],
  },
  phoneNumber: {
    type: String,
    required: [true, 'Please provide your phone number'],
    unique: true,
    // PHONE NUMBER MUST BE UNIQUE
  },
  emergencyContact: {
    type: String,
    required: [true, 'Please provide emergency contact'],
  },
  password: {
    type: String,
    required: [true, 'Please provide your password'],
  },
  location: {
    type: {
      type: String,
      enum: ['Point'],
      required: true,
    },
    coordinates: {
      type: [Number],
      required: true,
    },
  },
});

// CREATING AN OBJECT USER BASED ON THE USER SCHEMA
const User = mongoose.model('User', userSchema);

// EXPORTING THE USER OBJECT
module.exports = User;
