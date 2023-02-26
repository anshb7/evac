
//shortlisted landmarks list according to curr location data

//getLocationOfOutlets
const { Outlet } = require('../../../REST-server/models/outletModel');
const { User } = require('../../../REST-server/models/userModel');
const { getLocationsOfOutlets } = require('../../../REST-server/controllers/userController');

async function getShortlistedLandmarks(currentLocation) {
    const shortlistedLandmarks = await getLocationsOfOutlets(currentLocation);
    return shortlistedLandmarks;
    }


    

 












