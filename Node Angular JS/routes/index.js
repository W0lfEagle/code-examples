/**
 * Name: Wilford Engel
 * SRN: 130190747
 * Date: 19th April 2016
 * Description: Node routing file sets up url routes and renders html pages
 * restricts access to the classroom and requires a login
 * url: https://uol-final-project.herokuapp.com/(teacherroom/studentroom)
 * test account email: test@gmail.com password: easypassword
 */

var express = require('express');
var router = express.Router();
var restrict = require('../auth/classroomRestrict');
var passport = require('passport');
var config = require('../config');


/* GET home page. */
router.get('/', function(req, res, next) {
    if (req.user) {
        return res.redirect('/users/profile');
    }
    var vm = {
        title: 'Lingua Franca World',
        page: 'home' 
    }
    res.render('linguafranca', vm);
});

router.get('/classroomlogin', function(req, res, next) {
    if (req.user) {
        return res.redirect('/studentroom'); // TODO redirect teachers to the teacherRoom
    }
    var vm = {
        title: 'Login',
        error: req.flash('error'),
        page: 'login' 
    }
    res.render('users/login', vm);
});

router.post('/classroomlogin', function(req, res, next) {
    if (req.body.rememberMe) {
      req.session.cookie.maxAge = config.cookieMaxAge;
    }
    next();
  },
  passport.authenticate('local', {
    failureRedirect: '/', 
    successRedirect: '/studentroom',
    failureFlash: 'Invalid credentials'
}));

/*Teacher Room*/
router.get('/teacherroom', function(req, res, next) {
    var vm = {
        title: 'Teacher Room',
        page: 'teacherroom' 
    }
    res.render('classroom', vm); // Both the student and the teacher rooms are served with the same 'classroom.ejs' file
});
/*Student Room*/
router.get('/studentroom', function(req, res, next) {
    var vm = {
        title: 'Student Room',
        page: 'studentroom' 
    }
    res.render('classroom', vm);
});

router.post('/', function(req, res, next) {
    var vm = {
        title: 'Create an account',
        page: 'signup',
        email: req.body.email
    };
    res.render('./users/create', vm);
});

module.exports = router;
