function changedefaultvalue(element, defaultvalue) {
    if (element && element.value == defaultvalue) element.value = "";
}

function setdefaultvalue(element, defaultvalue) {
    if (element && element.value == "") element.value = defaultvalue;
}