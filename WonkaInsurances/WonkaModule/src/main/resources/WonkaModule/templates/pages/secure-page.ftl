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
<body>

	[#include "includes/page-header.ftl" /]
	
	<div class="filler">&nbsp;</div>
	
	[#if current_user == public_user]
	
		[#include "includes/login-form.ftl" /]
	
	[#else]
	
		[@cms.area name="main"/]
	
	[/#if]

	[#include "includes/page-footer.ftl" /]
    
</body>
</html>