$(function(){
	$.ajax({
	  url: 'https://api.themoviedb.org/3/search/movie?api_key=034661908a1116516775711b1e145da1',
	  data: {"query": "superman"}
	})
	.done(function(data){
	  console.log(data);
	});
})