const express = require('express')
const router = express.Router()


const memberController = require('../controller/memberControllers')
const bookController = require('../controller/bookControllers')
const borrowedController = require('../controller/borrowedControllers')
const checkAuth = require('../middleware/Auth')




//endpoint member
router.post('/member/register',memberController._addMember)
router.post('/member/login',memberController._loginMember)
router.get('/member',memberController._getDataMember)

//endpoint book
router.post('/book',bookController._addBook)
router.get('/book/getAllData',bookController._getBook)

//endpoint borrowed
router.post('/borrowed',checkAuth,borrowedController._addBorrowed)
router.get('/borrowed/getListBorrowed',borrowedController._getBorrowed)
router.get('/borrowed/getBorrowedByMember',checkAuth,borrowedController._getBorrowedbyMember)
router.delete('/borrowed/return',checkAuth,borrowedController._deleteBorrowed)


module.exports = router