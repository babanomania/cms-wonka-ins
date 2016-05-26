[#assign searchHeader=content.searchHeader!"Search Policy"]

		<br/>
  			<h1>&nbsp; ${searchHeader}</h1>
  			
  		<br/><br/>

		<div ng-controller="GetPolicyData" class="container">
	
			<div class="well">
			
				<input type="hidden" id="urlPrefix" ng-model="urlPrefix" value="${ctx.contextPath}" />
			
				<label for="policyNum" >Policy Number</label>
				<input id="policyNum" type="text" class="form-control" style="width:30%;" ng-model="policyNum"> &nbsp; <br/>
				
				<button type="button" class="btn btn-default" ng-click="getData()" aria-label="Left Align">
		  			<span class="glyphicon glyphicon-option-vertical glyphicon-align-left" aria-hidden="true"> Search &nbsp; </span>
				</button>
				
				&nbsp;
				
				<button type="button" class="btn btn-default" ng-click="reset()" aria-label="Left Align">
		  			<span class="glyphicon glyphicon-remove-circle glyphicon-align-left" aria-hidden="true"> Clear &nbsp; </span>
				</button>
			
			</div>
	
			<br/>
			
			<div class="alert alert-danger" style="width:90%;" ng-show="showError">
				{{errorMessage}}
			</div>
			
			<table class="table table-striped"  ng-show="showData">
				
				<tr>
					<td>Policy Number</td>
					<td>{{policydata.policyNumber}}</td>
				</tr>
			
				<tr>
					<td>Role</td>
					<td>{{policydata.role}}</td>
				</tr>
				
				<tr>
					<td>Last Premium Paid</td>
					<td>{{policydata.lastPremiumPaid}}</td>
				</tr>
				
				<tr>
					<td>Status</td>
					<td>{{policydata.status}}</td>
				</tr>
				
				<tr>
					<td>Source</td>
					<td>{{policydata.source}}</td>
				</tr>
	
			</table>

		</div>