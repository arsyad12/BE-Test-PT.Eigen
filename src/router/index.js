const express = require('express')
const router = express.Router()

const memberController = require('../controller/memberControllers')
const bookController = require('../controller/bookControllers')
const borrowedController = require('../controller/borrowedControllers')

//endpoint member
router.post('/member',memberController._addMember)
router.post('/member/login',memberController._loginMember)
router.get('/member',memberController._getDataMember)

//endpoint book
router.post('/book',bookController._addBook)

//endpoint borrowed
router.post('/borrowed',borrowedController._addBorrowed)
router.delete('/borrowed',borrowedController._deleteBorrowed)


module.exports = router