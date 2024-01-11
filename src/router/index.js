const express = require('express')
const router = express.Router()

const memberController = require('../controller/memberControllers')
const bookController = require('../controller/bookControllers')

//endpoint member
router.post('/member',memberController._addMember)
router.post('/member/login',memberController._loginMember)
router.get('/member',memberController._getDataMember)

//endpoint book
router.post('/book',bookController._addBook)


module.exports = router