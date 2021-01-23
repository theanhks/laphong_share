 $(document).ready( function(){	
		var buttons = { previous:$('#lofslidecontent45 .lof-previous') ,
						next:$('#lofslidecontent45 .lof-next') };
						
		$obj = $('#lofslidecontent45').lofJSidernews( { interval : 4000,
												direction		: 'opacity',	
											 	//easing		: 'easeOutBounce',
												duration		: 1200,
												auto		 	: true,
												maxItemDisplay  : 3,
												mainWidth:647,
												navPosition     : 'horizontal',
												navigatorHeight : 105,
												navigatorWidth  : 100,
												buttons			: buttons} );	
	});