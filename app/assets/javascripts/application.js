// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require angular
//= require bootstrap
//= require_tree .

var App = angular.module('VehiclesInWeb', []);

App.service('api', function($http){
    this.request = function(url, method){
        return $http({
            method: method,
            url: url
        });
    };
    this.getMakers = function(){
        return this.request('/makers', 'GET');
    };
    this.getVehicles = function(params){
        return this.request('/makers/'+ params.maker_id +'/vehicles', 'GET');
    };
});

App.controller('HomeController', function($scope, api){
    $scope.vehicles = [];

    api.getMakers().then(function(response){
        $scope.makers = response.data;
    });

    $scope.loadVehicles = function(){
        api.getVehicles({maker_id: $scope.selected.id}).then(function(response){
            $scope.vehicles = response.data;
        });
    };
});

