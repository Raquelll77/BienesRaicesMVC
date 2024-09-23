document.addEventListener('DOMContentLoaded', function(){
    eventListeners();
    darkMode();
});

function darkMode(){
    //PREFERENCIA DEL USUARIO
    const prefiereDarkMode=window.matchMedia('(prefers-color-scheme: dark)');
    //console.log(prefiereDarkMode.matches);

    if(prefiereDarkMode.matches){
        document.body.classList.add('dark-mode');
    }
    else{
        document.body.classList.remove('dark-mode');
    }
    prefiereDarkMode.addEventListener('change',function(){
        if(prefiereDarkMode.matches){
            document.body.classList.add('dark-mode');
        }
        else{
            document.body.classList.remove('dark-mode');
        }
    });


    const botonDarkMode=document.querySelector('.dark-mode-boton');
    botonDarkMode.addEventListener('click', function(){
        document.body.classList.toggle('dark-mode');
    })
}

function eventListeners(){
    const mobileMenu=document.querySelector('.mobile-menu');
    mobileMenu.addEventListener('click', navegacionResponsive)

    //muestra campos condicionales
    const formaContacto = document.querySelectorAll('input[name="contacto[contacto]"]')
    formaContacto.forEach(input=>input.addEventListener('click', mostrarFormaContacto));
    
    console.log(formaContacto);    
}
function navegacionResponsive(){
    const navegacion =document.querySelector('.navegacion');
    if(navegacion.classList.contains('mostrar')){
        navegacion.classList.remove('mostrar');

    }
    else{
        navegacion.classList.add('mostrar');
    }

}

function mostrarFormaContacto(e){
    const contactoDiv = document.querySelector('#contacto');
    contactoDiv.textContent = 'Diste CLick';
 
    if(e.target.value=== 'telefono'){
        contactoDiv.innerHTML = `
            <label for="telefono">Número Teléfono:</label>
            <input id="telefono" type="tel" placeholder="Tu teléfono" name="contacto[telefono]">

            <p>Elija la fecha y la hora</p>
            <label for="fecha">Fecha:</label>
            <input id="fecha" type="date" name="contacto[fecha]">

            <label for="hora">Hora:</label>
            <input id="hora" type="time" min="08:00" max="17:00" name="contacto[hora]">
        `;
    }else{
        contactoDiv.innerHTML = `
            <label for="email">E-mail:</label>
            <input id="email" type="email" placeholder="Tu email" name="contacto[email]" required>
        `;
    }
}
