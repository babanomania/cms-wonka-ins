[#assign current_user = ctx.user.name!"anonymous"]
[#assign public_user = "anonymous" ]

[#assign menu_current = content.menu_current!"home"]

[#assign path_home = "${ctx.contextPath}/public.html"]
[#assign path_customer = "${ctx.contextPath}/public/customer.html"]
[#assign path_living = "${ctx.contextPath}/public/living.html"]
[#assign path_retirement = "${ctx.contextPath}/public/retirement.html"]

[#assign path_userdetails = "${ctx.contextPath}/secure/user.html"]
[#assign path_policies = "${ctx.contextPath}/secure.html"]
[#assign path_current = cmsfn.link(cmsfn.page(content))! ]

[#assign official_email = "info@wonkainsurances.co.uk"]

	<nav class="navbar navbar-default">
	  <div class="container">
	  
		  <!-- Brand and toggle get grouped for better mobile display -->
		  <div class="navbar-header">
		  	<a class="navbar-brand" href="${path_home}">Wonka Insurances</a>
		  </div>
	    
	      <ul class="nav navbar-nav">
	        <li [#if menu_current == 'customer']class="active"[/#if]><a href="${path_customer}">Customer Center</a></li>
	        <li [#if menu_current == 'living']class="active"[/#if]><a href="${path_living}">Healthy Living</a></li>
	        <li [#if menu_current == 'retirement']class="active"[/#if]><a href="${path_retirement}">Retirement</a></li>
	      </ul>
	      
	      <ul class="nav navbar-nav navbar-right">
	        
	        [#if current_user == public_user]
	        <li><a class="small" href="${path_policies}">Policies</a></li>
	        
	        [#else]
	        <li [#if menu_current == 'userdetails']class="active"[/#if]><a class="small" href="${path_userdetails}">${current_user}</a></li>
	        <li [#if menu_current == 'policies']class="active"[/#if]><a class="small" href="${path_policies}">Policies</a></li>
	        <li><a class="small" href="${path_current}?mgnlLogout">Logout</a></li>
	        
	        [/#if]
	        
	        <li><a class="small" href="mailto:${official_email}">Email</a></li>
	      </ul>
	      
	  </div><!-- /.container -->
	</nav>