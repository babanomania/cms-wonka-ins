[#assign title = content.title!"Wonka Insurance Solutions"]
[#assign current_user = ctx.user.name!"anonymous" ]
[#assign public_user = "anonymous" ]

<!DOCTYPE html>

<html>
<head>
    <title>${title}</title>

	[#include "includes/client-lib-imports.ftl" /]
	[@cms.page /]
	
</head>
<body ng-app="wayne-ent-ui">

	[#include "includes/page-header.ftl" /]
	
	[#if current_user == public_user]
	
		[#include "includes/login-form.ftl" /]
	
	[#else]
	
		<div class="container-fluid">
	      <div class="row">
		
			<div class="col-sm-3 col-md-2 sidebar">
	          [@cms.area name="sidebar"/]
	          
	        </div>
		
			<div class="col-sm-9 col-md-10 main">
				[@cms.area name="body_content"/]
				
			</div>
			
		  </div>
		</div>
	
	[/#if]

	[#include "includes/page-footer.ftl" /]
    
</body>
</html>