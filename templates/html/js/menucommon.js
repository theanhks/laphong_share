function addLoadEvent(func) {
  var oldonload = window.onload;
  //alert(oldonload) ;
  if (typeof window.onload != 'function') 
  {   
    window.onload = func;
  }
  else
  {
	  //alert('xxx') ;
    window.onload = function() {
      oldonload();
      func();
    }
  }
}