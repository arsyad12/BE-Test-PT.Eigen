const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const bcrypt = require("bcrypt");

const memberModel = {
  checkEmail: async (payload) => {
    try {
      const { email } = payload;
      const request = await prisma.member.findMany({
        where: {
          email: email,
        },
      });
      return request;
    } catch (error) {
      console.log(error);
    }
  },

  addData: async (payload) => {
    try {
      const { code, name, email, password, userUuid } = payload;

      const saltRounds = 10;
      const salt = bcrypt.genSaltSync(saltRounds);
      const hash = bcrypt.hashSync(password, salt); // password is from deconstruction parameter

      const request = await prisma.member.create({
        data: {
          code: code,
          name: name,
          email: email,
          password: hash,
          uuid_member: userUuid
        },
      });
      return request;
    } catch (error) {
      console.log(error);
    }
  },
};

module.exports = memberModel;
