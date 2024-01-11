const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const bookModel = {
  checkBook: async (payload) => {
    try {
      const { title } = payload;
      const request = await prisma.book.findMany({
        where: {
          title: title,
        },
      });
      return request;
    } catch (error) {
      console.log(error);
    }
  },

  addData: async (payload) => {
    try {
      const { code, title, author, stock, bookUuid } = payload;

      const request = await prisma.book.create({
        data: {
          code: code,
          title: title,
          author: author,
          stock: stock,
          uuid_book: bookUuid,
        },
      });
      return request;
    } catch (error) {
      console.log(error);
    }
  },
};

module.exports = bookModel;
