<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="{$baseUrl}/plugins/themes/bootstrap3/templates/images/latindex.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <p><a class="btn btn-lg btn-primary" href="{url page="user" op="register"}" role="button">{translate|escape key="uasd.carousel.sign-up"}</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="{$baseUrl}/plugins/themes/bootstrap3/templates/images/revistas_caribe.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <p><a class="btn btn-lg btn-primary" href="#" role="button">{translate|escape key="uasd.carousel.learn-more"}</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">{translate|escape key="uasd.carousel.previous"}</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">{translate|escape key="uasd.carousel.next"}</span>
      </a>
    </div>