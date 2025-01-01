function popUp(str, strheader) {
    var popupmain = document.createElement('div');
    popupmain.className = 'modal fade in PopupBG';
    popupmain.id = 'popupModal';
    //popupmain.attributes['aria-hidden'] = 'false';
    popupmain.style.display = 'block';

    var popupc = document.createElement('div');
    popupc.className = 'modal-dialog';

    var popup = document.createElement('div');
    popup.className = 'modal-content';

    var header = document.createElement('div');
    header.className = 'modal-header';

    var h4 = document.createElement('h4');
    h4.className = 'modal-title';
    h4.innerHTML = strheader;

    var footer = document.createElement('div');
    footer.className = 'modal-footer';

    //cancel.innerHTML = 'close';
    var cancelbtn = document.createElement('button');
    cancelbtn.className = 'btn btn-primary';
    cancelbtn.innerHTML = "OK";
    cancelbtn.onclick = function (e) { popupmain.parentNode.removeChild(popupmain) };

    var message = document.createElement('div');
    message.className = "modal-body";
    message.innerHTML = str;

    popupmain.appendChild(popupc);
    popupc.appendChild(popup);

    popup.appendChild(header);
    header.appendChild(h4);
    popup.appendChild(message);
    popup.appendChild(footer);
    footer.appendChild(cancelbtn);
    document.body.appendChild(popupmain);
}