[#assign title = content.title!"Wonka Insurance Solutions"]

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
	
	<div class="bodycontent">
		${cmsfn.decode(content).bodycontent!""}
	</div>

	[#include "includes/page-footer.ftl" /]
    
</body>
</html>