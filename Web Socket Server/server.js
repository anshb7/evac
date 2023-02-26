const express = require("express");
const path = require("path");
const { createServer } = require("http");
const mongoose = require('mongoose');
const { Server } = require("socket.io");
const { initializeRoutes } = require("./routes/index");
const  Outlet  = require('../REST Server/models/outletModel');
const  User  = require('../REST Server/models/userModel');
const dotenv = require('dotenv');
dotenv.config({ path: './config.env' });
const { ObjectId } = require('mongodb');

mongoose.set('strictQuery', true);
let app = express();mongoose.set('strictQuery', true);
app = initializeRoutes(app);
app.get("/", (req, res) => {
  res.status(200).send({
    success: true,
    message: "welcome",
  });
});
const port = 3000;
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const httpServer = createServer(app);
const io = new Server(httpServer, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"],
  },
});



httpServer.listen(port, () => {
  console.log(`evac app listening on port ${port}`);
});
const id='63faf45eff56af53379127c4';//id for the outlet of logged in admin
let peoplePresent=[];
let headCount=0;
// Connect to MongoDB using Mongoose
// mongoose.connect(process.env.DATABASE, { useNewUrlParser: true, useUnifiedTopology: true });
mongoose.connect('mongodb+srv://adityaparmar:PVGtxnovwPjOqmaj@cluster-evac.xggkhjh.mongodb.net/?retryWrites=true&w=majority', { useNewUrlParser: true, useUnifiedTopology: true });

const db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));
db.once('open', () => {
  console.log('Connected to MongoDB using Mongoose');
  

  // Get the collection
  const collection = db.collection('outlets');
  const users=db.collection('users');

  // Find all documents
  collection.find({}).toArray(function(err, docs) {
    console.log("Found the following records:");
    for(let i=0;i<docs.length;i++){
      
      if(docs[i]._id==id){
        console.log('found');
        console.log(docs[i].headCount);headCount=docs[i].headCount;
        
        for(let j=0;j<docs[i].peoplePresent.length;j++){
          peoplePresent.push(docs[i].peoplePresent[j].toString());
        }
        console.log(peoplePresent);
        break;
      }
    }
  });
  users.find({}).toArray(function(err, docs) {
    console.log("Found the following records:");
    for(let i=0;i<peoplePresent.length;i++){

      for(let j=0;j<docs.length;j++){
        if(peoplePresent[i]==docs[j]._id.toString()){
          console.log(docs[j].name);
        }
      }
    }
  });
  // Set up Socket.io
  
io.on( "connection", socket => {
  console.log( "New client connected" );
  

  peoplePresent.push(socket.id);
   // get the count of currently connected users
  const connectedUsers = io.sockets.sockets.size;
  console.log(`Total checked in users: ${headCount+connectedUsers}`);
  console.log(peoplePresent);
  

  // handle disconnect event
  socket.on('disconnect', () => {
    console.log('User disconnected');
    // get the count of connected users
    const connectedUsers = io.sockets.sockets.size;
    console.log(`Total checked in users: ${headCount+connectedUsers}`);
    peoplePresent.pop(socket.id);
    console.log(peoplePresent);
      
  });
  });
  
// Set up the MongoDB change stream
const changeStream = User.watch({ $match: { 'operationType': 'update' } });

// Listen for changes on the User collection
changeStream.on('change', (change) => {
  console.log('Change detected:', change);

  // Get the count parameter from the updated document
  const count = change.fullDocument.count;

  // Send the count to all connected Socket.io clients
  io.emit('count', count);
});
});






