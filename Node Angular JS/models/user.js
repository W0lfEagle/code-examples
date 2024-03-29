/**
 * Name: Wilford Engel
 * SRN: 130190747
 * Date: 19th April 2016
 * Description: Mongo model for the user database and registration
 */

var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var userService = require('../services/user-service');

var userSchema = new Schema({
    firstName: {type:String, required: 'Please enter your first name'},
    email: {type:String, required: 'Please enter your email'},
    password: {type:String, required: 'Please enter your password'},
    timezone: {type:String},
    skype: {type:String},
    credits: {type:Number, default: 0},
    created: {type: Date, default: Date.now}
});

userSchema.path('email').validate(function(value, next) {
    userService.findUser(value, function(err, user) {
        if (err) {
            console.log(err);
            return next(false);
        }
        next(!user);
    });
}, 'That email is already in use.');


var User = mongoose.model('User', userSchema);

module.exports = {
    User: User
};
