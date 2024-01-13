const jwt = require("jsonwebtoken");

const checkAuth = async (req, res, next) => {
  try {
    const token = req.headers.authorization;

    if (typeof token == "undefined") {
      res.status(401).json({
        status: "ERROR",
        messages: "Api key cannot be empty",
        data: null,
      });
    } else {
      const decode = jwt.verify(
        token.slice(7),
        process.env.APP_SECRET_TOKEN,
        function (err) {
          if (err) {
            res.status(401).json({
              status: "ERROR",
              messages: "Api key invalid",
              data: null,
            });
          } else {
            next();
          }
        }
      );
    }
  } catch (err) {
    res.status(500).json({
      status: "ERROR",
      messages: "Something bad at server",
      data: null,
    });
  }
};

module.exports = checkAuth;
