const mongoose = require('mongoose');
const dotenv = require('dotenv');
const app = require('./app');

// IN CASE OF UNCAUGHT_EXCEPTION
process.on('uncaughtException', (err) => {
  console.log('UNCAUGHT EXCEPTION! 💥 Shutting down...');
  console.log(err.name, err.message);
  process.exit(1);
});

// INITIALIZING PATH TO .CONFIG FILE
dotenv.config({ path: './config.env' });

// GETTING DATABASE AND PASSWORD FROM .CONFIG FILE
const DB = process.env.DATABASE.replace(
  '<PASSWORD>',
  process.env.DATABASE_PASSWORD
);

// MAKING CONNECTION WITH THE DATABASE
mongoose
  .connect(DB, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => console.log('DB connection successful!'));

//   STARTING SERVER
const port = process.env.PORT || 8000;
const server = app.listen(port, () => {
  console.log(`App running on port ${port}...`);
});

// IN CASE OF UNHANDLED REJECTION (PROBLEM WITH DATABASE CONNECTION)
process.on('unhandledRejection', (err) => {
  console.log('UNHANDLED REJECTION! 💥 Shutting down...');
  console.log(err.name, err.message);
  server.close(() => {
    process.exit(1);
  });
});
