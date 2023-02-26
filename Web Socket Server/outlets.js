
//shortlisted landmarks list according to curr location data

//getLocationOfOutlets
const { Outlet } = require('../../../REST Server/models/outletModel');
const { User } = require('../../../REST Server/models/userModel');
const { getLocationsOfOutlets } = require('../../../REST Server/controllers/userController');

async function getShortlistedLandmarks(currentLocation) {
    const shortlistedLandmarks = await getLocationsOfOutlets(currentLocation);
    return shortlistedLandmarks;
    }


    

 












