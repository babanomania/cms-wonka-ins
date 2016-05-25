var app = angular.module("wayne-ent-ui", ['ngResource']);
app.controller("GetPolicyData", function($scope, $http, $resource) {

    var PolicyEntity = $resource('/api/policy/:policynum');
    
    $scope.showData = false;

    $scope.getData = function() {

        $scope.policydata = PolicyEntity.get({
            policynum: $scope.policyNum
        });
        
        $scope.showData = true;
    };

    $scope.reset = function() {

        $scope.policyNum = "";
        $scope.showData = false;
    };
}

);