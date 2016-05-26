var app = angular.module("wayne-ent-ui", ['ngResource']);
app.controller("GetPolicyData", function($scope, $http, $resource) {

    $scope.showData = false;
    $scope.showError = false;
    $scope.errorMessage = false;
    
    $scope.getData = function() {
    	
    	var urlPrefix = document.getElementById('urlPrefix').value;
        var PolicyEntity = $resource( urlPrefix + '/.api/policy/:policynum' );
    	
    	$scope.showData = false;
    	
        $scope.policydata = PolicyEntity.get({
            policynum: $scope.policyNum
          
        }, function() {
        	$scope.showData = true;
        	$scope.showError = false;
        	
        },function(response) {
        	$scope.showData = false;
        	$scope.showError = true;
        	console.log( response );
        	
        	if(response.status === 404) {
        		$scope.errorMessage = "Policy Not Found"
            }else{
            	
            	if( response.message == null ){
            		$scope.errorMessage = "Server Error";
            		
            	}else{
            		$scope.errorMessage = response.message;
            	}
            }
        	
        });
        
    };

    $scope.reset = function() {

        $scope.policyNum = "";
        $scope.showData = false;
        $scope.showError = false;
    };
}

);