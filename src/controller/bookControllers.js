const bookModel = require("../model/bookModels");
const { v4: uuidv4 } = require("uuid");
// import jwt for make token
const jwt = require("jsonwebtoken");
// import bcrypt for compare password from user with database
const bcrypt = require("bcrypt");

const Joi = require("joi");

const bookControllers = {


  _getBook: async(req,res)=>{
    try {
      const request = await bookModel.getData()
      if (request) {
        res.status(200).json({
          status : true,
          message : "get data success",
          data: request
        })
      }
    } catch (error) {
      res.status(404).json({
        status : false,
        message : "data not found",
      })
    }
  },

  _addBook: async (req, res) => {
    try {
      const { code, title, author, stock } = req.body;

      const schema = Joi.object({
        code: Joi.string().min(1).max(50).required(),
        title: Joi.string().min(1).max(50).required(),
        author: Joi.string().min(1).max(50).required(),
        stock: Joi.number().min(1).max(50).required(),
      });

      await schema.validateAsync({ code, title, author, stock });

      const bookUuid = uuidv4();

      const checkBook = await bookModel.checkBook({ title });

      if (checkBook.length > 0) {
        res.status(409).json({
          status: false,
          message: "the book is available, you can register another book",
        });
        return;
      } else {
        //ini untuk nyimpan data ke database
        const request = await bookModel.addData({
          code,
          title,
          author,
          stock,
          bookUuid,
        });

        res.status(200).json({
          message: "insert data succes",
          data: request,
        });
      }
    } catch (error) {
      res.status(400).json({
        message: error.message,
      });
    }
  },
};

module.exports = bookControllers;
