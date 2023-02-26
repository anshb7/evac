const mongoose = require('mongoose');
const User = require('./userModel');

const outletSchema = new mongoose.Schema({
  name: {
    type: String,
    required: [true, 'A user must have a name'],
    unique: true,
  },
  location: {
    type: {
      type: String,
      enum: ['Point'],
      required: [true, 'Please set type as point'],
    },
    coordinates: {
      type: [Number],
      required: [true, 'Please set coordinates for your outlet'],
    },
  },
  radius: {
    type: Number,
    required: [true, 'Please set radius for your outlet'],
  },
  isOpen: {
    type: Boolean,
    default: true,
  },
  openingHours: {
    weekdays: {
      open: {
        type: String,
        required: true,
      },
      close: {
        type: String,
        required: true,
      },
    },
    weekends: {
      open: {
        type: String,
        required: true,
      },
      close: {
        type: String,
        required: true,
      },
    },
  },
  adminPassword: {
    type: String,
    required: true,
  },
  adminList: {
    type: [{ type: mongoose.Schema.Types.ObjectId, ref: 'User' }],
    default: [],
  },
  peoplePresent: {
    type: [{ type: mongoose.Schema.Types.ObjectId, ref: 'User' }],
    default: [],
  },
  sos: [
    {
      user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
      },
      message: {
        type: String,
        default: '',
      },
    },
  ],
  headCount: {
    type: Number,
    default: 0,
  },
});

outletSchema.pre('save', function (next) {
  const currentHeadCount = this.peoplePresent.length;
  if (this.isNew || this.isModified('peoplePresent')) {
    // If the document is new or the peoplePresent field has been modified,
    // update the headCount field with the current number of people present
    this.headCount = currentHeadCount;
    next();
  } else {
    // Otherwise, skip updating the headCount field
    next();
  }
});

outletSchema.index({ location: '2dsphere' });

// CREATING AN OBJECT USER BASED ON THE OUTLET SCHEMA
const Outlet = mongoose.model('Outlet', outletSchema);

// EXPORTING THE OUTLET OBJECT
module.exports = Outlet;
