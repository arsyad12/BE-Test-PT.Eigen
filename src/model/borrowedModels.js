const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const borrowedModel = {

  getData: async () => {
    try {
      const request = await prisma.borrowed.findMany();
      return request;
    } catch (error) {
      console.log(error);
    }
  },


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

  checkPenalty: async (payload) => {
    try {
      const { date_return } = payload;
      const checkPenalty = prisma.borrowed.findMany({
        where: {
          date_return : date_return
        },
        select:{
          date_return : true
        }
      });
      return checkPenalty;
    } catch (error) {
      console.log(error);
    }
  },



  addData: async (payload) => {
    try {
      const { uuid_member, uuid_book } = payload;

      
      const borrowDate = new Date();
      const getDates = new Date();
      const returnDate = new Date(getDates.setDate(getDates.getDate() + 6));

      const request = await prisma.borrowed.create({
        data: {
          uuid_member: uuid_member,
          uuid_book: uuid_book,
          date_borrwoed : borrowDate,
          date_return : returnDate
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

  deleteData: async (payload) => { //for return  
    try {
      const { uuid_book } = payload;


      const request = await prisma.borrowed.delete({
        where: {
          uuid_book: uuid_book,
        },
      });


      if (request) {
        const updateStock = await prisma.book.update({
          where: {
            uuid_book: uuid_book,
          },
          data: {
            stock: { increment: 1 },
          },
        });

        return updateStock;
      }

      return request;
    } catch (error) {
      console.log(error);
    }
  },


  givePenalty: async (payload) => {

    const{uuid_member} = payload

    const request = await prisma.member.update({
        where:{
          uuid_member : uuid_member
        },
        data:{
          isMemberPenalize : true
        }
    })

    return request

  }


};

module.exports = borrowedModel;
