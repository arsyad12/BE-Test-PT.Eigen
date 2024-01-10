const express = require('express')
const router = express.Router()

const memberController = require('../controller/index')


router.post('/user',memberController._addMember)
router.post('/user/login',memberController._loginMember)



module.exports = router