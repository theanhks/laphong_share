// define namespace: global scope

window.addEvent("load", function(){
	new Common();
});


/*
*	Common class
*/
var Common = new Class({
	Implements: [Options],
	options: {
		zIndex: 500
	},
	initialize: function(){		
		this.initHoverTableRow();		
	},
	
	
	initHoverTableRow: function(){
		var cont = $$('.tableContent');
		if(!cont) return;
		var table = cont.getElement('tbody');
		
		table.getElements('tr').each(function(tr, index){
			tr.addEvents({
				'mouseenter': function(e){
					this.getChildren().each(function(item, index1){
						item.setStyle('background-color', '#FFEFDD');
					});
				}, 
				'mouseleave': function(e){
					this.getChildren().each(function(item, index1){
						item.setStyle('background-color', '');
					});
				}
			})
		});
	}	
});
