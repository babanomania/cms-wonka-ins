[#assign caption=content.jtCaption!""]
[#assign tagline=content.jtTagLine!""]
[#assign more_link=content.more_link!""]
[#assign more_btn_text=content.more_btn_text!"Learn More"]

	<div class="jumbotron">
	  <h1>${caption}</h1>
	  <p>${tagline}</p>
	  
	  [#if content.more_link?has_content]
	  <p><a class="btn btn-primary btn-lg" href="${more_link}" role="button">${more_btn_text}</a></p>
	  [/#if]
	  
	</div>