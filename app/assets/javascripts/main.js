$(function(){
	let form = $('#movie-search');

	form.submit(function(e){
	  e.preventDefault();

	  $.ajax({
	    url: 'https://api.themoviedb.org/3/search/movie?api_key=034661908a1116516775711b1e145da1',
	    data: form.serialize()
	  })
	  .done(function(data){
	    displayMovies(data);
	  });
	});

	function displayMovies(data) {
		let container = $("#movies");

		let htmlString = "";
		let imageUrl = getBaseImageUrl();

		container.empty();
		if (data["results"].length == 0) {
			htmlString = `<div class="alert alert-danger text-center" role="alert">No Data Found!</div>`;
		} else {
			data["results"].forEach(function(movie) {
				htmlString += `<div class="row mp-margin">
									<div class="col-xs-12 col-lg-6">
										<img src=${movie["poster_path"] == null ? "https://goo.gl/p8zDGq" : imageUrl + movie["poster_path"]} data-id="${movie['id']}" class="movie_poster" />
									</div>
									<div class="col-xs-12 col-lg-6">
										<h3><b>${movie["title"]}</b></h5>
										<p>${movie["overview"]}</p>
									</div>
								</div>`;
			});
		}

		container.append(htmlString);
	}

	function getBaseImageUrl(){
	  var url = "";
	  var settings = {
	    "async": false,
	    "crossDomain": true,
	    "url": "https://api.themoviedb.org/3/configuration?api_key=034661908a1116516775711b1e145da1",
	    "method": "GET",
	    "headers": {},
	    "data": "{}"
	  }

	  $.ajax(settings).done(function (response) {
	    url = response["images"]["secure_base_url"] + response["images"]["poster_sizes"][3];
	  });
	  return url;
	}

	$('#movies').on('click', 'img.movie_poster', function(e){
	  e.preventDefault();
	  
	  let id = $(e.target).data('id');

	  $.ajax({
	    url: 'https://api.themoviedb.org/3/movie/' + id + '?',
	    data: { "api_key": "034661908a1116516775711b1e145da1" }
	  })
	  .done(function(data){
	    displayMovie(data);
	  })
	});

	function displayMovie(data) {
		let htmlString = "";
		let container = $("#movies");
		let imageUrl = getBaseImageUrl();

		container.empty();

		htmlString += `<div class="row">
							<div class="col-xs-12 col-md-6">
								<img src=${data["poster_path"] == null ? "https://goo.gl/p8zDGq" : imageUrl + data["poster_path"]} />
							</div>
							<div class="col-xs-12 col-md-6">
								<h1><b>${data["title"]}</b></h1>
								<p><b>Summary</b>: ${data["overview"]}</p>
								<p><b>Duration:</b> ${data["runtime"]} minutes</p>
								<p><b>Status:</b> ${data["status"]}</p>
								<p><b>Released Date:</b> ${data["release_date"]}</p>
								<p><b>Popularity:</b> ${data["popularity"]}</p>
								<p><b>Budget:</b> $${data["budget"]}</p>
								<p><b>Average Vote:</b> ${data["vote_average"]}/10</p>
								<p><b>Total Votes:</b> ${data["vote_count"]}</p>
								<p><b>Website:</b> ${data["homepage"]}</p>
							</div>
						</div>`;

		container.append(htmlString);	
	}
});
