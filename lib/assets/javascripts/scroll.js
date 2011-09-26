$(document).ready(function() {
  var page = 1,
      loading = false;
	$('.pagination').hide();
  function nearBottomOfPage() {
    return $(window).scrollTop() > $(document).height() - $(window).height() - 200;
  }

  $(window).scroll(function(){
    if (loading) {
      return;
    }

    if(nearBottomOfPage()) {
      loading=true;
      page++;
      $.ajax({
        url: '/looks?page=' + page,
        type: 'get',
        dataType: 'script',
        success: function() {
          $(window).sausage('draw');
          loading=false;
        }
      });
    }
  });

  $(window).sausage();
}());
