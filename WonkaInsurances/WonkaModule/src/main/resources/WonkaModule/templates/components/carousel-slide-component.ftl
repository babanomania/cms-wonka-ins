[#assign panelHeading=content.panelHeading!""]
[#assign panelContent=content.panelContent!""]
[#assign panelButtonText=content.panelButtonText!""]


    <div class="item">
      <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNacAMAAiEBe3XhaNAAAAAASUVORK5CYII=" />
      <div class="container">
        <div class="carousel-caption">
          <h1>${panelHeading}</h1>
          <p>${panelContent}</p>
          <p><a class="btn btn-lg btn-primary" href="#" role="button">${panelButtonText}</a></p>
        </div>
      </div>
    </div>
