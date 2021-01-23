/*  ModalPopup.Javascript
    Developer: Lam Vi Banh(Brian Lam)
    Email: banhthidiem@yahoo.com
    --------------------------------------------------------
    Ex: var NameObject = new ModalPopup("idDisplay", "NameObject");
    NameObject.display(); // Call Modal Popup
    NameObject.hide(); // Hide Modal Popup
*/
function ModalPopup(idData, title, isAllowMove)
{
	this.disNone = "none";
	this.elTitle = null;
	this.elContent = null;
	this.elContainer = null;
	this.elData = null;
	this.title = title;
	this.isShow = false;
	this.startMove = false;
	this.detalCoord = { X: 0, Y: 0 };
	this.positionMoved = { X: -1, Y: -1 };
	this.positionDetal = { X: -1, Y: -1 };

	// Properties
	this.isShowTitle = title != null && title != "";
	this.isAllowMove = isAllowMove != null ? isAllowMove : true;
	this.zIndex = 1002;

	this.createMain(idData);
};

ModalPopup.prototype.createMain = function(idData) {

	this.elData = this.getElData(idData);
	var self = this;

	utilObj.addEvent(utilObj.wd, "resize", function(e) { self.changePostionResize(e); });
	utilObj.addEvent(null, "scroll", function(e) { self.changePostionResize(e); });
	utilObj.addEvent(document, "keydown", function(e) { if (e.keyCode == "27") { self.hide(e); } });
	
	this.createContainer();	
	this.createContent();
	
	if (this.isAllowMove) {
		this.move();
	}	
};

ModalPopup.prototype.createStyle = function()
{
	var cssStr = ".ModalPopupContainer { background-color:#FFFFFF; filter:alpha(opacity=50); -moz-opacity:.50; opacity:.50; }";
	cssStr += ".ModalPopupChild { background-color:#FFFFFF; border-style:solid; border-width:1px; white-space:nowrap; }";
	cssStr += ".ModalPopupChild .popuptitle { font-family:Tahoma; font-size:9pt; background-color:#6E89DD; color:#FFFFFF; font-weight:bold; text-align:left; position:relative; padding:5px; cursor:move }";
	cssStr += ".ModalPopupChild .popuptitle .btnClose { font-size:8pt; border:solid 1px #FFF; color:#FFFFFF; right:3px; top:3px; padding:1px; position:absolute; display:block; cursor:pointer; -moz-border-radius: 2px; -webkit-border-radius: 2px; }";
	cssStr += ".ModalPopupChild .popuptitle .btnClose:hover { border:solid 1px #C0C0C0; color:#6E89DD; background-color:#FFFFFF; }";

	var eStyle = utilObj.getElById("idStyleModalPopup");
	if (eStyle == null) {
		/*
		eStyle = utilObj.createEl("STYLE");
		eStyle.id = "idStyleModalPopup";
		eStyle.setAttribute("type", "text/css");
		
		utilObj.d.getElementsByTagName('head')[0].appendChild(eStyle);
		
		if (eStyle.styleSheet) {
			eStyle.styleSheet.cssText = cssStr;
		}
		else {
			// w3c
			var cssText = utilObj.createElText(cssStr);
			eStyle.appendChild(cssText);
		}
		*/
	}
};

ModalPopup.prototype.getElData = function(idData) {
	var el = idData;
	if (typeof idData == "string") {
		el = utilObj.getElById(idData);
	}
	//alert(el) ;
	if (el)
		el.style.padding = "5px";
	return el;
};
/*======================================================================
=============================Move Popup=================================
======================================================================*/
ModalPopup.prototype.getElTitleMove = function(e) {
	var elTarget = utilObj.getTargetElement();
	if (elTarget == this.elTitle) {
		return elTarget;
	}
	return null;
};
ModalPopup.prototype.onMovePopupMouseDown = function(e) {
	if (!this.isAllowMove) return;
	e = utilObj.getWindowEvent();
	if (utilObj.isRightClick(e)) return;
	var elTitle = this.getElTitleMove();
	if (elTitle == null) return;
	this.startMove = true;
	var mouseCoords = utilObj.mouseCoords(e);
	var elContentPos = utilObj.getElementPosition(this.elContent);
	this.detalCoord = {
		X: mouseCoords.X - elContentPos.X,
		Y: mouseCoords.Y - elContentPos.Y
	};
	utilObj.disableSelection(document.body);
	utilObj.stopEvent();
};
ModalPopup.prototype.onMovePopupMouseMove = function(e) {
	if (!this.isAllowMove || !this.startMove) return;
	e = utilObj.getWindowEvent();
	var mouseCoords = utilObj.mouseCoords(e);

	this.positionMoved = {
		X: mouseCoords.X - this.detalCoord.X,
		Y: mouseCoords.Y - this.detalCoord.Y
	};

	this.elContent.style.left = this.positionMoved.X + "px";
	this.elContent.style.top = this.positionMoved.Y + "px";

	var docScroll = utilObj.getDocumentScroll();
	this.positionDetal = {
		X: this.positionMoved.X - docScroll.scrollLeft,
		Y: this.positionMoved.Y - docScroll.scrollTop
	};

};

ModalPopup.prototype.onMovePopupMouseUp = function(e) {
	if (!this.isAllowMove || !this.startMove) return;
	this.startMove = false;
	utilObj.enableSelection(document.body);
};

ModalPopup.prototype.move = function() {
	var self = this;
	utilObj.addEvent(document, "mousedown", function(e) {
		self.onMovePopupMouseDown(e);
	});
	utilObj.addEvent(document, "mousemove", function(e) {
		self.onMovePopupMouseMove(e);
	});
	utilObj.addEvent(document, "mouseup", function(e) {
		self.onMovePopupMouseUp(e);
	});
};

/*======================================================================
=============================Create Popup===============================
======================================================================*/

ModalPopup.prototype.createTitle = function() {
	var self = this;
	var elTitle = utilObj.createEl("DIV");
	elTitle.className = "popuptitle";
	elTitle.innerHTML = this.title;
	this.elContent.appendChild(elTitle);
	this.elTitle = elTitle;

	var elBtnClose = utilObj.createEl("DIV");
	elBtnClose.className = "btnClose";
	elBtnClose.innerHTML = "X";
	utilObj.addEvent(elBtnClose, "click", function(e) {
		self.hide(e);
	});
	elTitle.appendChild(elBtnClose);
};

ModalPopup.prototype.createContent = function() {
	var elContent = utilObj.createEl("DIV");
	elContent.className = "ModalPopupChild";
	elContent.style.zIndex = this.zIndex + 1;
	this.elContent = elContent;
	utilObj.addChildToBody(elContent);
	if (this.isShowTitle) {
		this.createTitle();
	}
	elContent.appendChild(this.elData);
	elContent.style.display = this.disNone;
};

ModalPopup.prototype.createContainer = function() {
	if (!this.elContainer) {
	
		this.createStyle();
		
		var elContainer = utilObj.createEl("DIV");
		elContainer.className = "ModalPopupContainer";
		elContainer.style.zIndex = this.zIndex;
		utilObj.addChildToBody(elContainer);
		this.elContainer = elContainer;
		this.hide();
	}
};
ModalPopup.prototype.setZIndex = function(zIndex) {
	this.zIndex = zIndex;
	this.elContainer.style.zIndex = zIndex;
	this.elContent.style.zIndex = zIndex + 1;
};


ModalPopup.prototype.clear = function() {
	if (this.elContainer != null && this.elContent != null) {
		document.body.removeChild(this.elContent);
		document.body.removeChild(this.elContainer);
		this.elContainer = this.elContent = null;
	}
};

// changePostionScroll
ModalPopup.prototype.changePostionResize = function(e) {
	if (this.isShow && this.elContainer && this.elContent) {

		if (utilObj.isIE && utilObj.appVersion < 7) {
			this.elContainer.style.position =
			this.elContent.style.position = "absolute";
			var docScroll = utilObj.getDocumentScroll();
			this.elContainer.style.top = docScroll.scrollTop + "px";
			this.elContainer.style.left = docScroll.scrollLeft + "px";
			if (this.positionDetal.X == -1) {
				document.getElementById("display").value += this.positionDetal.X + '-';
				var pos = utilObj.getElPosCenterWebPage(this.elContent);
				this.positionDetal = {
					X: pos.X - docScroll.scrollLeft,
					Y: pos.Y - docScroll.scrollTop
				};
			}
			this.positionMoved = {
				X: docScroll.scrollLeft + this.positionDetal.X,
				Y: docScroll.scrollTop + this.positionDetal.Y
			};
			this.elContent.style.top = this.positionMoved.Y + "px";
			this.elContent.style.left = this.positionMoved.X + "px";
		}
	}
};

ModalPopup.prototype.setCenter = function(e) {

	if (this.isShow && this.elContainer && this.elContent) {
		this.elData.style.display =
		this.elContainer.style.display =
		this.elContent.style.display = "";
		var de = utilObj.getDocument();
		this.elContainer.style.height = de.clientHeight + "px";
		this.elContainer.style.width = de.clientWidth + "px";

		if (utilObj.isIE && utilObj.appVersion < 7) {
			this.changePostionResize(e);
		}
		else {
			this.elContainer.style.position = 
			this.elContent.style.position = "fixed";
			this.elContainer.style.top =
			this.elContainer.style.left = "0px";

			var elSize = utilObj.getElementSize(this.elContent);
			if (this.positionMoved.X != -1) {
				this.elContent.style.top = this.positionMoved.Y + "px";
				this.elContent.style.left = this.positionMoved.X + "px";
			}
			else {
				this.elContent.style.top = ((de.clientHeight - elSize.height) / 2) + "px";
				this.elContent.style.left = ((de.clientWidth - elSize.width) / 2) + "px";
			}
		}

	}
};

ModalPopup.prototype.display = function()
{
	//alert('x') ;
	this.isShow = true;
	//alert('y') ;
	this.setCenter();
};

ModalPopup.prototype.hide = function() {
	this.isShow = false;
	try {
		if (this.elContainer == null) return;
		this.elContainer.style.display = 
		this.elContent.style.display = this.disNone;
		this.elContainer.style.top =
		this.elContainer.style.left =
		this.elContent.style.top =
		this.elContent.style.left = "-1000px";
	}
	catch (e)
	{ }
};