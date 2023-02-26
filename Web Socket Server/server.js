const express = require("express");
const { createServer } = require("http");
const mongoose = require('mongoose');
const { Server } = require("socket.io");
const { initializeRoutes } = require("./routes/index");
const  Outlet  = require('../REST Server/models/outletModel');
const  User  = require('../REST Server/models/userModel');
const dotenv = require('dotenv');
const getAllOutlets = require('../REST Server/controllers/userController');

for (let i=0;i<getAllOutlets.length;i++){
  console.log(getAllOutlets[i]);
}

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

// Connect to MongoDB using Mongoose
// mongoose.connect(process.env.DATABASE, { useNewUrlParser: true, useUnifiedTopology: true });
mongoose.connect('mongodb+srv://adityaparmar:PVGtxnovwPjOqmaj@cluster-evac.xggkhjh.mongodb.net/?retryWrites=true&w=majority', { useNewUrlParser: true, useUnifiedTopology: true });

const db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));
db.once('open', () => {
  console.log('Connected to MongoDB using Mongoose');
  
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




// const id=  Outlet.findOne({},'_id', function(err, result) {
//   if (err) throw err;
//   console.log(result._id);
//   return result._id;
// });
const id='63faf45eff56af53379127c4';

io.on( "connection", socket => {
  console.log( "New client connected" );

  
   // get the count of currently connected users
  const connectedUsers = io.sockets.sockets.size;
  console.log(`Total connected users: ${connectedUsers}`);
  
    Outlet.findById(id, (err, record) => {
      if (err) {
        console.error(err);
        return;
      }

      console.log(record.name);
      record.headCount = io.sockets.sockets.size;
      //add person from list of people present in outlet
      let addedUser= User.findById(io.sockets.sockets.id)
      record.peoplePresent.push(addedUser);
      io.emit(addedUser.location, "joined");
       
      record.save((err) => {
        if (err) {
          console.error(err);
          return;
        }
        console.log('headcount updated !');
       
      });
    });

  
  

  

  // handle disconnect event
  socket.on('disconnect', () => {
    console.log('User disconnected');
    // update the count of connected users
    const connectedUsers = io.sockets.sockets.size;
    console.log(`Total connected users: ${connectedUsers}`);
      
      Outlet.findById(id, (err, record) => {
        if (err) {
          console.error(err);
          return;
        }
        record.headCount = io.sockets.sockets.size;
        //remove person from list of people present in outlet
      let removedUser= User.findById(io.sockets.sockets.id)
      record.peoplePresent.pull(removedUser);
      io.emit(removedUser.location, "left");

         
        record.save((err) => {
          if (err) {
            console.error(err);
            return;
          }
          console.log('headcount updated !');
        });
      });
    

  });
  


  } );

