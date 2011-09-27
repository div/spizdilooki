$(document).ready(function() {
	

var start_page,
did_scroll = false,
loading = false;
var url = $(location).attr('href').split("/page/");  // To see if there 'page' in the url
var base_url = url[0];

if ( url[1] ) {  // if there is page in the url => probably it's "back button"
	start_page = url[1];   // get the page where we are
	
	$('.back-to-start').show();  // show notice that there are more looks above
}
else{
	start_page = 1;
}
var page = start_page;
	

$('.pagination').hide();
		
$(window).scroll(function(){	
	did_scroll = true;    // check if scrolling
});

function nearBottomOfPage() {
  return $(window).scrollTop() > $(document).height() - $(window).height() - 200;
}

// Every 250ms, check if the page scrolled
setInterval(function(){
  if (did_scroll) {
	  //alert('updating');
      
      loadMoreLooks(); // Infinite scroll, etc.
		updatePagePath();   // update url, so we can return to this page
      did_scroll = false;
  }
}, 250);

function loadMoreLooks() {
	if (loading) {
      return;
    }
    if(nearBottomOfPage()) {
	  did_scroll = true;
      loading=true;
      page++;
	
      $.ajax({
        url: '/looks?page=' + page,
        type: 'get',
        dataType: 'script',
        success: function() {
          $(window).sausage('draw');
			$(".undefined").parent().hide();
          loading=false;
        }
      });
	did_scroll = false;
    }
}
// Update the URL
function updatePagePath() {
	
  var new_url;
  var in_viewport = $('.look:in-viewport').first();
  if (history.replaceState) {
      if (in_viewport.data("page") == 1) {
          new_url = base_url; // The original URL of the stream page
      } else {
			
          new_url = base_url + "/page/" + in_viewport.data("page");
      }
	//alert(new_url);
  history.replaceState('', '', new_url);
  }
  
}

$(function(){
                    
                    $(window)
                        .sausage({
                            content: function (i, $page) {
								var p = $page.find('.look').first().data("page")
								if ( p ){
									return '<span class="sausage-span">' + p + '</span>';
								} else {                                	
									return '<span class="sausage-span undefined">' + '</span>';
								}	
                            }
                        });
                    
});

$(".undefined").parent().hide();

}());