
function GetAllOdas() {
    var doctor = getCookie('medico');
    if (!localStorage.getItem(doctor)) {
        return [];
    }
    var odas = JSON.parse(localStorage.getItem(doctor));
    return odas;

}


function AgregarOda(newsOdas) {
    // Seleccionamos los datos de los inputs de formulario
    var doctor = getCookie('medico');
    if (!localStorage.getItem(doctor)) {
        localStorage.setItem(doctor, JSON.stringify([]));
    }
    var odas = JSON.parse(localStorage.getItem(doctor));

    //recorre el arreglo de las nuevas odas para tratar de insertar en el localstorage
    for (var i = 0; i < newsOdas.length; ++i) {
        // newsOdas.forEach(oda => {
        //busca la oda en el actual storage
        //var index = odas.findIndex(x => x.NumeroOrdenAtencion === oda.NumeroOrdenAtencion);
        var index = -1;
        for (var y = 0; y < odas.length; ++y) {
            if (odas[y].NumeroOrdenAtencion === newsOdas[i].NumeroOrdenAtencion) {
                index = y;
                break;
            }
        }

        if (index === -1) {
            //agrega la nueva oda al storage
           // var newOda = Object.assign({ validate: false, codeDiagnostico: '' }, newsOdas[i]);
            var newOda = $.extend({ validate: false, codeDiagnostico: '' }, newsOdas[i]);
            odas.push(newOda);
        }
        //  });
    }

    //eliminar las ODAS que no se encuentren en las ODAs leidas del server
    var finalOdas = []; //odas.filter(x => !x.validate);
    for (var i = 0; i < odas.length; ++i) {
        var index = -1;
        for (var y = 0; y < newsOdas.length; ++y) {
            if (newsOdas[y].NumeroOrdenAtencion === odas[i].NumeroOrdenAtencion) {
                index = y;
                break;
            }
        }
        if (index !== -1) {
            finalOdas.push(odas[i]);
        }


    }

    localStorage.setItem(doctor, JSON.stringify(finalOdas));
}

function ValidateOda(oda, diagnostico) {
    
    var doctor = getCookie('medico');
    if (!localStorage.getItem(doctor)) {
        return;
    }
    var odas =  JSON.parse(localStorage.getItem(doctor));

    //var index = odas.findIndex(x => x.NumeroOrdenAtencion === oda.NumeroOrdenAtencion);
    var index = -1;
    for (var y = 0; y < odas.length; ++y) {
        if (odas[y].NumeroOrdenAtencion === oda.NumeroOrdenAtencion) {
            index = y;
            break;
        }
    }

   
    if (index !== -1) {
        var actualOda = odas[index];//.find(x => x.NumeroOrdenAtencion === oda.NumeroOrdenAtencion);
        actualOda.validate = true;
        actualOda.codeDiagnostico = diagnostico;
    }

    localStorage.setItem(doctor, JSON.stringify(odas));
}

function QuitValidateOda() {

    var doctor = getCookie('medico');
    if (!localStorage.getItem(doctor)) {
        return;
    }
    var odas = JSON.parse(localStorage.getItem(doctor));

    var newOdas = []; //odas.filter(x => !x.validate);

    for (var i = 0; i < odas.length; ++i) {
        if (!odas[i].validate) {
            newOdas.push(odas[i]);
        }
    }

    localStorage.setItem(doctor, JSON.stringify(newOdas));
}



function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
