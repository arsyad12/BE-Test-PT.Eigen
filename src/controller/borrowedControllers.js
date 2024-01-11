const borrowedModel = require("../model/borrowedModels");
const jwt = require("jsonwebtoken");
const Joi = require("joi");

const borrowedControllers = {
    _addBorrowed: async (req, res) => {
        try {
          const { uuid_member, uuid_book } = req.body;
    
          const schema = Joi.object({
            uuid_member: Joi.string().guid({
              version: ["uuidv4", "uuidv1", "uuidv5"],
            }),
            uuid_book: Joi.string().guid({
              version: ["uuidv4", "uuidv1", "uuidv5"],
            }),
          });
    
          await schema.validateAsync({ uuid_member,uuid_book });
    
          const checkLimit = await borrowedModel.checkLimit({ uuid_member });

          const checStock = await borrowedModel.checStock({ uuid_book });
          
          if (checkLimit.length >= 2) {
            
            throw { type: 'maxborrowed', message: 'You have reached the book borrowing limit, maximum 2' }
          
          } else if (checStock[0].stock < 1){
            
            throw { type: 'outofstock', message: 'The stock this book already run out the book has been borrowed' }

          }else{         

            const request = await borrowedModel.addData({
              uuid_member, uuid_book
            });
    
            res.status(200).json({
              message: "success to borrow a book",
              data: request,
            });
          }

        } catch (error) {

          if (error.type === 'maxborrowed') { //ini cara manggil nya 
            res.status(409).json({
              status: false,
              massage: 'You have reached the book borrowing limit, maximum 2'
            })
            return
          }else if (error.type === 'outofstock') {
            res.status(409).json({
              status: false,
              massage: 'The stock this book already run out the book has been borrowed'
            })
            return
          }

          res.status(400).json({
            message: error.message,
          });
        }
      },
};

module.exports = borrowedControllers;
