[#assign panelHeading=content.panelHeading!""]
[#assign panelContent=content.panelContent!""]
[#assign panelButtonText=content.panelButtonText!""]

	<!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">

      <div class="carousel-inner" role="listbox">

        <div class="item active">
          <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNacAMAAiEBe3XhaNAAAAAASUVORK5CYII=" />
          <div class="container">
            <div class="carousel-caption">
              <h1>${panelHeading}</h1>
              <p>${panelContent}</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">${panelButtonText}</a></p>
            </div>
          </div>
        </div>

        [@cms.area name="slide"/]

      </div>

      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>

    </div><!-- /.carousel -->