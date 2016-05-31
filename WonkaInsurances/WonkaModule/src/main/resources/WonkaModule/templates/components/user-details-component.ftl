[#assign pageHeader=content.pageHeader!"Your Details"]
[#assign goGreenMessage=content.goGreenMessage!"go for paperless statements"]
[#assign goGreenBtnTxt=content.goGreenBtnTxt!"Yes"]

	<div ng-controller="GetCustomerData" class="container">

		<br/>
  			<h1>&nbsp; ${pageHeader}</h1>
  			
  		<br/><br/>
		
		<input type="hidden" id="urlPrefix" ng-model="urlPrefix" value="${ctx.contextPath}" />
		
		<div class="alert alert-danger" style="width:90%;" ng-show="showError">
			{{errorMessage}}
		</div>		
		
		<table class="table" ng-show="showData">
			
			<tr>	<td>First Name</td>					<td>{{customerdata.firstName}}</td>			</tr>
			<tr>	<td>Last Name</td>					<td>{{customerdata.lastName}}</td>			</tr>
			<tr>	<td>Date Of Birth</td>				<td>{{customerdata.dateOfBirth}}</td>		</tr>
			<tr>	<td>Email</td>						<td>{{customerdata.email}}</td>				</tr>
			<tr>	<td>Paperless Statements</td>		<td>{{customerdata.statementInEmail}}</td>	</tr>
		
		</table>
		
		<br/>
		<div class="alert alert-success" style="width:90%;padding-bottom:26px;" ng-show="showGoGreen">
		
			${goGreenMessage}
			
			&nbsp;
			<button type="button" class="btn btn-success pull-right" ng-click="goPaperless()">
			  <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp; ${goGreenBtnTxt}
			</button><br/>
			
		</div>	

	</div>