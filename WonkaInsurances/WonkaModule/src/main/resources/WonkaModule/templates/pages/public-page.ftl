[#assign title = content.title!"Wonka Insurance Solutions"]

<!DOCTYPE html>

<html>
<head>
    <title>${title}</title>

	[#include "includes/client-lib-imports.ftl" /]
	[@cms.page /]
	
</head>
<body ng-app="wayne-ent-ui">

	[#include "includes/page-header.ftl" /]
	
	[@cms.area name="body_content"/]

	[#include "includes/page-footer.ftl" /]
    
</body>
</html>