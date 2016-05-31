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

app.controller("GetCustomerData", function($scope, $http, $resource) {

    $scope.showData = false;
    $scope.showError = false;
    $scope.showGoGreen = false;
    
    $scope.getData = function() {
   
    	var urlPrefix = document.getElementById('urlPrefix').value;
        var CustomerEntity = $resource( urlPrefix + '/.api/customer' );
    	$scope.showData = false;
    	
        $scope.customerdata = CustomerEntity.get({}, function() {
        	$scope.showData = true;
        	$scope.showError = false;
        	
        	alert( "statementInEmail -> " + $scope.customerdata.statementInEmail );
        	alert( "check -> " + ($scope.customerdata.statementInEmail == "Yes") )
        	
        	if( $scope.customerdata.statementInEmail == "Yes" ){
        		$scope.showGoGreen = false;
        	}else{
        		$scope.showGoGreen = true;
        	}
        	
        },function(response) {
        	$scope.showData = false;
        	$scope.showError = true;
        	console.log( response );
        	
        	if(response.status === 404) {
        		$scope.errorMessage = "Customer Data Not Found"
            }else{
            	
            	if( response.message == null ){
            		$scope.errorMessage = "Server Error";
            		
            	}else{
            		$scope.errorMessage = response.message;
            	}
            }
        	
        });
        
    };
    
    $scope.getData();
    
    $scope.goPaperless = function() {
    	
    	$scope.customerdata.firstname.statementInEmail = "Yes"
    	var urlPrefix = document.getElementById('urlPrefix').value;
    	var postUrl =  urlPrefix + '/.api/customer';
        var CustomerEntity = $resource( $postUrl );
    	
        CustomerEntity.save( $scope.customerdata,
        		
			  function(resp, headers){
                console.log(resp);
                $scope.showGoGreen = false;
                alert( "showGoGreen " + $scope.showGoGreen );
                
              },function(err){
            	  
            	$scope.showGoGreen = false;
              	$scope.showData = false;
              	$scope.showError = true;
              	
              	$scope.errorMessage = "error occured while saving ";
                console.log(err);
              }
          );

      };
    
    $scope.reset = function() {
        $scope.showData = false;
        $scope.showError = false;
    };
}

);