/**
 * Name: Wilford Engel
 * SRN: 130190747
 * Date: 19th April 2016
 * Description: angular directive for the video block
 * calls the setupVideo() function to start the youtube iframe api service
 */

'use strict';

var videoBlockApp = angular.module('videoBlockApp', ['ngRoute']);

videoBlockApp.directive('loadvideo', function() {
  
    return {
        link: function(scope, element, attrs) {
            setupVideo(scope.$parent.content[scope.contentId.id - 1].data.videoId);
        }
    }
});