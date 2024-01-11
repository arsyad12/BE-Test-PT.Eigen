const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const borrowedModel = {
  checkLimit: async (payload) => {
    try {
      const { uuid_member } = payload;
      const request = await prisma.borrowed.findMany({
        where: {
          uuid_member: uuid_member,
        },
      });
      return request;
    } catch (error) {
      console.log(error);
    }
  },


  checStock: async (payload) => {
    try {
      const { uuid_book } = payload;
      const checStock = prisma.book.findMany({
        where: {
          uuid_book: uuid_book,
        },
        select:{
          stock : true
        }
      });
      return checStock;
    } catch (error) {
      console.log(error);
    }
  },



  addData: async (payload) => {
    try {
      const { uuid_member, uuid_book } = payload;

      const request = await prisma.borrowed.create({
        data: {
          uuid_member: uuid_member,
          uuid_book: uuid_book,
        },
      });



      if (request) {
        const updateStock = await prisma.book.update({
          where: {
            uuid_book: uuid_book,
          },
          data: {
            stock: { decrement: 1 },
          },
        });

        return updateStock;
      }

      return request;
    } catch (error) {
      console.log(error);
    }
  },
};

module.exports = borrowedModel;
