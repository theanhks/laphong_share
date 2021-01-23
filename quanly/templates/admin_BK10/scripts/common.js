function initShowHide(){ // click so ra, click dong vao
	var linkType = $('linkType');
	var linkType2 = $('linkType2');
	var form1 = $('frmOpinion');
	var form2 = $('frmEmail');
	if(linkType){
		linkType.removeEvents('click').addEvent('click', function(e){
			e.stop();
			form2.addClass('hidden');
			linkType2.removeClass('current');
			linkType.toggleClass('current');
			form1.toggleClass('hidden');
			
		});
	}
	if(linkType2){
		linkType2.removeEvents('click').addEvent('click', function(e){
			e.stop();
			form1.addClass('hidden');
			linkType.removeClass('current');
			linkType2.toggleClass('current');
			form2.toggleClass('hidden');
		});
	}
}

function initShowHide2(){ // click so ra, click dong vao
	var formUpload = $('formUpload');
	if(formUpload){		
		formUpload.toggleClass('hidden');
	}
}

function initMenu(){
	var menu = $('menu');
	if(!menu) return;
	var level1s = menu.getElements('.level1');
	var level2s = menu.getElements('.level2');	
	var currentLevel1 = null;
	var currentLevel2 = null;
	var level1Waiting = false;
	var level2Waiting = false;
	var timer;
	level2s.each(function(level2){
		if(level2.hasClass('open')){
			currentLevel2 = level2;
		}
		level2.ul = level2.getChildren('ul');
		if(level2.ul.length){
			level2.fx = new Fx.Slide(level2.ul[0], {
				link: 'ignore',
				duration: 200
			});
			level2.fx.hide();
			level2.addEvent('click', function(e){
				if(e) e.stop();				
				if(level2Waiting) return;	
				level2Waiting = true;
				timer = setInterval(function(){
					if(currentLevel1) {
						currentLevel1.fx.show();
					}
				}, 10);					
				if(currentLevel2) {
					if(currentLevel2.fx.open){
						currentLevel2.getFirst().removeClass('current2');
						currentLevel2.fx.slideOut();					
					}											
				}
				
				if(level2.fx.open){
					level2.getFirst().removeClass('current2');
					level2.fx.slideOut();
				}
				else{
					level2.getFirst().addClass('current2');
					level2.fx.slideIn();
				}									
				if(currentLevel2 == null || currentLevel2 != level2)
					currentLevel2 = level2;				
				setTimeout(function(){
					$clear(timer);
					level2Waiting = false;
				}, 800);
			});
		}
	});
	level1s.each(function(level1){
		if(level1.hasClass('open')){
			currentLevel1 = level1;
		}
		level1.ul = level1.getChildren('ul');
		if(level1.ul.length){
			level1.fx = new Fx.Slide(level1.ul[0], {
				link: 'ignore',
				duration: 400,
				onComplete: function(){
					level1Waiting = false;
				}
			});
			level1.fx.hide();
			level1.addEvent('click', function(e){
				if(e) e.stop();	
				if(level1Waiting) return;
				level1Waiting = true;
				if(currentLevel1) {
					if(currentLevel1.fx.open)
						currentLevel1.fx.slideOut();
					else
						currentLevel1.fx.slideIn();
				}
				if(level1.fx.open){
					level1.fx.slideOut();
					currentLevel1 = null;						
				}
				else{
					level1.fx.slideIn();
					currentLevel1 = level1;
				}																		
			});
		}
	});
	if(currentLevel2){	
		currentLevel2.fireEvent('click');
	}
	if(currentLevel1){
		currentLevel1.fireEvent('click');
	}
	
	$$('#menu a').each(function(aLink){
		if(!aLink.href.test('javascript:')){
			aLink.addEvent('click', function(e){
				window.location = aLink.href;
			});
		}
	});
	
}

function initSlider(){
	var levBtn = $$('.levBtn');
	if(levBtn.length){	
		var content = $('content');
		var lev = $('lev');
		lev.fx = new Fx.Tween(lev, {
			property: 'marginLeft'				
		});
		content.fx1 = new Fx.Tween(content, {
			property: 'marginLeft'			
		});
		levBtn[0].addEvent('click', function(e){
			if(e) e.stop();				
			if(!this.getParent().hasClass('open')){
				this.getParent().removeClass('close').addClass('open');
				lev.fx.start(-220);
				content.fx1.start(40);
				this.getElement('img').set('src', this.getElement('img').get('src').replace('arrow_01', 'arrow_02'));
			}
			else{
				this.getParent().removeClass('open').addClass('close');
				lev.fx.start(0);
				content.fx1.start(250);				
				this.getElement('img').set('src', this.getElement('img').get('src').replace('arrow_02', 'arrow_01'));				
			}
		});	
		levBtn[0].fireEvent('click');
		var contextual = $('contextual');
		contextual.fx = new Fx.Tween(contextual, {
			property: 'marginRight'
		});
		content.fx2 = new Fx.Tween(content, {
			property: 'marginRight'			
		});
		levBtn[1].addEvent('click', function(e){
			if(e) e.stop();
			if(!this.getParent().hasClass('open')){
				this.getParent().removeClass('close').addClass('open');
				contextual.fx.start(-220);
				content.fx2.start(20);
				this.getElement('img').set('src', this.getElement('img').get('src').replace('arrow_02', 'arrow_01'));
			}
			else{
				this.getParent().removeClass('open').addClass('close');
				contextual.fx.start(0);
				content.fx2.start(250);								
				this.getElement('img').set('src', this.getElement('img').get('src').replace('arrow_01', 'arrow_02'));
			}
		});
		levBtn[1].fireEvent('click');
	}
}

window.addEvent('domready', function(){
	initMenu();
	initSlider();
	initShowHide();
	initShowHide2();
});
function openWin(pageUrl, namewindow, w, h) {
	var width = w;    
	var height = h;  
	var detailwindow = '';
	
	top_val = (screen.height - height)/2 - 30;  
	if (top_val < 0) { top_val = 0; }    
	left_val = (screen.width - width)/2;    
	detailwindow = "toolbar=0, location=0, status=1, menubar=0, resize=No, scrollbars=1, resizable=0, width=" + width + ", height=" + height + ", top=" + top_val + ", left=" + left_val;
	
	window.open(pageUrl, '', detailwindow);
}