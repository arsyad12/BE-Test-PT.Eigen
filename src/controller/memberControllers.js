const memberModel = require("../model/memberModels");
const { v4: uuidv4 } = require("uuid");
// import jwt for make token
const jwt = require("jsonwebtoken");
// import bcrypt for compare password from user with database
const bcrypt = require("bcrypt");

const Joi = require("joi");


const memberControllers={

_addMember: async (req, res) => {
    try {
      const { code,name,email,password } = req.body;


      const schema = Joi.object({
        code : Joi.string().min(1).max(50).required(),
        name : Joi.string().min(1).max(50).required(),
        email: Joi.string().email().required(),
        password: Joi.string().required(),
      });

      await schema.validateAsync({ code, name, email, password });


      const userUuid = uuidv4();

      const checkEmail = await memberModel.checkEmail({ email });

      if (checkEmail.length > 0) {
        res.status(409).json({
          status: false,
          message: "Email Has Registered",
        });
        return
      } else {

        //ini untuk nyimpan data ke database
        const request = await memberModel.addData({
          code,
          name,
          email,
          password,
          userUuid,
        });

        res.status(200).json({
          message: "insert data succes",
          data: request,
        });
        
      }
    } catch (error) {
      res.status(500).json({
        message : error.message
      })
    }
  },

  _loginMember: async (req, res) => {
    try {
      const { email, password } = req.body;

      const checkEmail = await memberModel.checkEmail({ email });

      if (checkEmail.length === 0) {
        res.status(404).json({
          status: false,
          message: "Email Has not Registered",
        });
        return;
      }

      const checkPassword = bcrypt.compareSync(
        password,
        checkEmail[0].password
      );

      if (checkPassword) {
        const token = jwt.sign(checkEmail[0], process.env.APP_SECRET_TOKEN);
        res.status(200).json({
          status: true,
          message: "Login Success",
          keyToken: token,
        });
      } else {
        res.status(400).json({
          status: false,
          message: "Wrong Password",
        });
      }
    } catch (error) {
      console.log(error);
    }
  },

  _getDataMember: async (req,res) => {
    try {

      const request = await memberModel.getData()
      res.status(200).json({
        status: true,
        message: "get data Success",
        data : request
      });
      
    } catch (error) {
      console.log(error)
    }

  }
}

module.exports = memberControllers