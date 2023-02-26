const Outlet = require('../models/outletModel');

// FUNCTION TO FIND DISTANCE BETWEEN TWO POINTS
function getDistanceFromLatLonInMeters(lat1, lon1, lat2, lon2) {
  const R = 6371e3; // Earth's radius in meters
  const dLat = deg2rad(lat2 - lat1);
  const dLon = deg2rad(lon2 - lon1);
  const a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(deg2rad(lat1)) *
      Math.cos(deg2rad(lat2)) *
      Math.sin(dLon / 2) *
      Math.sin(dLon / 2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  const d = R * c; // Distance in meters
  return d;
}

//   FUNCTION TO CONVERT DEGREE TO RADIAN
function deg2rad(deg) {
  return deg * (Math.PI / 180);
}

// ROUTE TO PUT USER ID IN URL PARAMETERS
exports.getMe = (req, res, next) => {
  req.params.id = req.user.id;
  next();
};

exports.setAdmin = async (req, res, next) => {
  try {
    const { name, adminPassword } = req.body;

    // 1) CHECK IF NAME AND PASSWORD IS SENT
    if (!name || !adminPassword) {
      res.status(400).json({
        status: 'failed',
        message: 'Please provide name and password!',
      });
      return;
    }

    // 2) FIND OUTLET BY NAME
    const outlet = await Outlet.findOne({ name });

    if (!outlet || outlet.adminPassword !== adminPassword) {
      res.status(401).json({
        status: 'failed',
        message: 'Incorrect name or password',
      });
      return;
    }

    // 3) IF ALL IS GOOD ADD USER TO ADMIN LIST OF OUTLET
    outlet.adminList.push(req.params.id);

    // 4) SAVE CHANGE TO OUTLET
    await outlet.save();

    res.status(200).json({
      status: 'success',
      message: `User added to admin list of outlet ${name}`,
    });
  } catch (err) {
    res.status(404).json({
      status: 'failed',
      error: err.message,
    });
  }
};

exports.addUserToOutlet = async (req, res, next) => {
  const { outletName, currentLocation } = req.body;

  // 1) CHECK IF NAME AND PASSWORD IS SENT
  if (!outletName || !currentLocation) {
    res.status(400).json({
      status: 'failed',
      message: 'Please outlet name and your current location!',
    });
    return;
  }

  // 2) FIND OUTLET BY NAME
  const outlet = await Outlet.findOne({ outletName });

  if (!outlet) {
    res.status(401).json({
      status: 'failed',
      message: 'No outlet with this name was found',
    });
    return;
  }

  //   CHECK IF USER IS IN PROXIMITY OF THE OUTLET
  if (
    getDistanceFromLatLonInMeters(
      outlet.location.coordinates[0],
      outlet.location.coordinates[1],
      currentLocation[0],
      currentLocation[1]
    ) <= outlet.radius
  ) {
    // ADD USER TO LIST OF PEOPLE PRESENT IN THE OUTLET
    outlet.peoplePresent.push(req.params.id);
    // SAVE CHANGES TO OUTLET
    await outlet.save();

    res.status(200).json({
      status: 'success',
      message: `User added to list of people present in outlet outlet ${outlet.name}`,
    });
  } else {
    // USER NOT IN PROXIMITY OF OUTLET
    res.status(404).json({
      status: 'success',
      message: `User not close enough to ${outlet.name}`,
    });
  }
};

exports.getLocationOfOutlets = async (req, res, next) => {
  try {
    const { currentLocation } = req.body;

    const point = {
      type: 'Point',
      coordinates: [currentLocation.longitude, currentLocation.latitude],
    };

    // PIPELINE TO GET TOP 5 LOCATIONS IN PROXIMITY TO USERS LOCATION
    const pipeline = [
      {
        $geoNear: {
          near: point,
          distanceField: 'distance',
          spherical: true,
        },
      },
      {
        $limit: 5,
      },
    ];

    Outlet.aggregate(pipeline, (err, results) => {
      if (err) {
        res.status(401).json({
          status: 'failed',
          message: err.message,
        });
      } else {
        res.status(200).json({
          status: 'success',
          data: results,
        });
      }
    });
  } catch (err) {
    res.status(404).json({
      status: 'failed',
      message: err.message,
    });
  }
};

exports.sendSOS = async (req, res, next) => {
  try {
    const { outletName, message } = req.body;
    await Outlet.findOneAndUpdate(
      { name: outletName },
      {
        sos: sos.push({ user: req.params.id, message }),
      },
      {
        new: true,
        runValidators: true,
      }
    );

    res.status(200).json({
      status: 'success',
      message: 'SOS successfully sent',
    });
  } catch (err) {
    res.status(404).json({
      status: 'failed',
      message: err.message,
    });
  }
};

exports.getAllOutlets = async (req, res, next) => {
  try {
    const outlets = await Outlet.find();

    res.status(200).json({
      status: 'success',
      data: outlets,
    });
  } catch (err) {
    res.status(404).json({
      status: 'failed',
      message: err.message,
    });
  }
}
