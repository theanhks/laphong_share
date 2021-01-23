$(document).ready(function() {

	$('.pagination').jqPagination({
		link_string	: '/?page={page_number}',
		max_page	: 40,
		paged		: function(page) {
		var abc = '<h4>{$proItem->getName('vn')}</h4>';
			$('.log').prepend(abc);
		}
	});

});