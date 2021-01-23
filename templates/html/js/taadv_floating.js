var bannerleftwidth=130;var bannerrightwidth=130;var contentwidth=1000;var contentspace=1002;var screenlimit=contentwidth+bannerleftwidth+bannerrightwidth;var contentspaceavail=contentspace+bannerleftwidth+bannerrightwidth;function FloatTopDivLeft()
{startX2=0,startY2=0;if(document.body.clientWidth<screenlimit)startX2=-bannerleftwidth;var ns2=(navigator.appName.indexOf("Netscape")!=-1);var d2=document;function ml2(id)
{var el2=d2.getElementById?d2.getElementById(id):d2.all?d2.all[id]:d2.layers[id];if(d2.layers)el2.style=el2;el2.sP=function(x,y){this.style.left=x+'px';this.style.top=y+'px';};el2.x=startX2;el2.y=startY2;return el2;}
window.stayTopLeft=function()
{if(document.body.clientWidth<screenlimit)
{ftlObj2.x=-bannerleftwidth;ftlObj2.y=0;ftlObj2.sP(ftlObj2.x,ftlObj2.y);}
else
{if(document.documentElement&&document.documentElement.scrollTop)
var pY2=ns2?pageYOffset:document.documentElement.scrollTop;else if(document.body)
var pY2=ns2?pageYOffset:document.body.scrollTop;if(document.body.scrollTop>71){startY2=3}else{startY2=0};if(document.body.clientWidth>=contentspaceavail)
ftlObj2.x=(document.body.clientWidth-contentspace-bannerleftwidth-bannerrightwidth)/2;else
ftlObj2.x=(document.body.clientWidth-contentwidth-bannerleftwidth-bannerrightwidth)/2;ftlObj2.y+=(pY2+startY2-ftlObj2.y)/32;ftlObj2.sP(ftlObj2.x,ftlObj2.y);}
setTimeout("stayTopLeft()",1);}
ftlObj2=ml2("divAdLeft");stayTopLeft();}
function FloatTopDivRight()
{startX=document.body.clientWidth-bannerrightwidth,startY=0;var ns=(navigator.appName.indexOf("Netscape")!=-1);var d=document;if(document.body.clientWidth<screenlimit)startX=-bannerrightwidth;function ml(id)
{var el=d.getElementById?d.getElementById(id):d.all?d.all[id]:d.layers[id];if(d.layers)el.style=el;el.sP=function(x,y){this.style.left=x+'px';this.style.top=y+'px';};el.x=startX;el.y=startY;return el;}
window.stayTopRight=function()
{if(document.body.clientWidth<screenlimit)
{ftlObj.x=-bannerrightwidth;ftlObj.y=0;ftlObj.sP(ftlObj.x,ftlObj.y);}
else
{if(document.documentElement&&document.documentElement.scrollTop)
var pY=ns?pageYOffset:document.documentElement.scrollTop;else if(document.body)
var pY=ns?pageYOffset:document.body.scrollTop;if(document.body.scrollTop>71){startY=3}else{startY=0};if(document.body.clientWidth>=contentspaceavail)
ftlObj.x=(document.body.clientWidth+contentspace)/2;else
ftlObj.x=(document.body.clientWidth+contentwidth)/2;ftlObj.y+=(pY+startY-ftlObj.y)/32;ftlObj.sP(ftlObj.x,ftlObj.y);}
setTimeout("stayTopRight()",1);}
ftlObj=ml("divAdRight");stayTopRight();}
function ShowAdDiv()
{var objAdDivLeft=document.getElementById("divAdLeft");var objAdDivRight=document.getElementById("divAdRight");if(document.body.clientWidth<screenlimit)
{objAdDivLeft.style.left=0;objAdDivRight.style.left=-bannerrightwidth;}
else
{objAdDivLeft.style.left=0;objAdDivRight.style.left=document.body.clientWidth-bannerrightwidth;}
FloatTopDivLeft();FloatTopDivRight();}
ShowAdDiv();