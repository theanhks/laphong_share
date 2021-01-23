var numFields = 2;

// JavaScript Document
function checkSelect( ojSelect, text ) {
	var k ;
	for (k=ojSelect.options.length-1; k>=0; k--) {
		if (ojSelect.options(k).value == text) {
			ojSelect.options(k).selected = true;
			return true;			
		}
	}
	return false;
}


function checkValue( ojSelect, value ) {
	var k;
	for (k=ojSelect.options.length-1; k>=0; k--) {
		if (ojSelect.options(k).value == value) {
			ojSelect.options(k).selected = true;
			return true;			
		}
	}
	return false;
}

function checkRadio( ojSelect, value ) {
	var k;
	for (k=ojSelect.length-1; k>=0; k--) {
		if (ojSelect(k).value == value) {
			ojSelect(k).checked = true;
			return true;			
		}
	}
	return false;
}
function checkCheck( ojSelect, value ) {
	var k;
	if (ojSelect.value == value) {
		ojSelect.checked = true;
		return true;			
	}
	return false;
}
/* cach su dung 
<script language="javascript" >
	var oj = document['tenForm']['tenSelect'];
	checkSelect(oj,'{TinhTrang}');
</script>
*/

function toggleAllChecks(formName, prefix)
{
    n = "all";

    if (prefix)
    {
        n = prefix + n;
    }

    i = 0;
    e = document.getElementById(n);
    s = e.checked;
    f = document.getElementById(formName);

    while (e = f.elements[i])
    {
        if (e.type == "checkbox" && e.id != n)
        {
            if (!prefix || e.id.indexOf(prefix) != -1)
            {
                e.checked = s;
            }
        }

        i++;
    }
}

function actionSubmit(form,action)
{
	f = document.getElementById(form);
	f.plus.value=action;
}

function changePosition(form,id)
{
	f = document.getElementById(form);
	control = document.getElementById('position_'+id);
	f.plus.value='changePosition';
	f.oId.value=id;
	f.position.value=control.value;
	f.submit();
}

function activePlusSubmit(form,act)
{
	f = document.getElementById(form);
	f.plusAct.value=act;
	f.submit();
}

function addElementToForm (containerName, fieldType, fieldName, fieldValue,style)
{
var separator = document.getElementById('marker');
var container = document.getElementById(containerName);
if (navigator.userAgent.indexOf("MSIE") != -1){//isie
//var fileTag ="<input type='"+fieldType+"' value='' name='"+fieldName+"_"+numFields+"'>";
var fileTag ="<input type='"+fieldType+"' value='' style='"+style+"' name='"+fieldName+"[]"+"'>";
var fileObj = document.createElement(fileTag); 
var newLine = document.createElement('BR');
container.insertBefore(fileObj,separator);
container.insertBefore(newLine,separator);
numFields++;
}//endie
  else
	{//notie
	  if (document.getElementById) {
    var input = document.createElement('INPUT');
    var newLine = document.createElement('BR');
    var newFieldName = fieldName + '_' + numFields;
    if( debug) window.alert('adding field ' + newFieldName);
      if (document.all) { 
        input.type = fieldType;
        input.name = newFieldName;
        input.value = fieldValue;
      }
      else if (document.getElementById) { 
        input.setAttribute('type', fieldType);
        input.setAttribute('name', newFieldName);
        input.setAttribute('value', fieldValue);
      }
      
    container.insertBefore(input,separator);
    container.insertBefore(newLine,separator);
    numFields++;
  }
	}//endnotie
}

function showProgressBar( elementToHide )
{
   button = document.getElementById( elementToHide );
   button.style.display = "none";     
   bar = document.getElementById("status_bar");
   bar.style.display = "block";
}

/**
 * resets the user picture/avatar in the profile page
 */
function resetAvatarPicture()
{
    window.document.updateConfig.avatarId.value = 0;
    // and reload the image path
    window.document.updateConfig.avatarPicture.src = '/images/nophoto.gif';
}

function avatarPictureSelectWindow()
{
	width  = 500;
	height = 450;
	
	x = parseInt(screen.width / 2.0) - (width / 2.0);
	y = parseInt(screen.height / 2.0) - (height / 2.0);
	
	UserPicture = window.open( '?op=manage&act=compactListResource&objectId=Avatar', 'AvatarPictureSelect','top='+y+',left='+x+',scrollbars=yes,resizable=yes,toolbar=no,height='+height+',width='+width);
}
function returnAvatarResourceInformation(resId, url)
{
	// set the picture id
    parent.opener.document.updateConfig.avatarId.value = resId;
    // and reload the image path
    parent.opener.document.updateConfig.avatarPicture.src = url;
}

/**
 * resets the map picture in the profile page
 */
function resetMapPicture()
{
    window.document.updateMap.mapId.value = 0;
    // and reload the image path
    window.document.updateMap.mapPicture.src = '/images/nophoto.gif';
}

function mapPictureSelectWindow()
{
	width  = 500;
	height = 450;
	
	x = parseInt(screen.width / 2.0) - (width / 2.0);
	y = parseInt(screen.height / 2.0) - (height / 2.0);
	
	UserPicture = window.open( '?op=manage&act=compactListResource&objectId=Map', 'MapPictureSelect','top='+y+',left='+x+',scrollbars=yes,resizable=yes,toolbar=no,height='+height+',width='+width);
}
function returnMapResourceInformation(resId, url)
{
	// set the picture id
    parent.opener.document.updateMap.mapId.value = resId;
    // and reload the image path
    parent.opener.document.updateMap.mapPicture.src = url;
}
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
