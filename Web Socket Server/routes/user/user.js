const { Router } = require("express");
const { User } = require('../../../REST Server/models/userModel');
const userRouter = Router();


userRouter.get("/", async (req, res, next) => {
  const users = await User.findAll();

  res.status(200).send({
    success: true,
    message: "users successfully retrieved",
    users,
  });
});

module.exports = { route: userRouter, name: "user" };
