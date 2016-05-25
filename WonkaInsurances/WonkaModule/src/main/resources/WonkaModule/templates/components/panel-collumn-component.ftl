[#assign panelHeading=content.panelHeading!"<No Header>"]
[#assign panelContent=content.panelContent!"<No Content>"]

<div class="col-sm-3 col-md-2 sidebar">
	<div class="panel panel-default">
	  <div class="panel-heading">
	    <h3 class="panel-title">${panelHeading}</h3>
	  </div>
	  <div class="panel-body">
	    ${panelContent}
	  </div>
	</div>
</div>