<?php
namespace Controllers;

use Intervention\Image\Gd\Commands\RotateCommand;
use MVC\Router;
use Model\Propiedad;
use PHPMailer\PHPMailer\PHPMailer;

class PaginasController{

    public static function index(Router $router){

        $propiedades = Propiedad::get(3);
        $inicio= true;

        $router->render('/paginas/index',[
            'propiedades'=>$propiedades,
            'inicio'=>$inicio
        ]);
    }
    public static function nosotros(Router $router){
        $router->render('/paginas/nosotros');
    }
    public static function propiedades(Router $router){
        $propiedades = Propiedad::all();
        $router->render('/paginas/propiedades',[
            'propiedades'=>$propiedades

        ]);
    }
    public static function propiedad(Router $router){
        $id = validarRedireccionar('/propiedades');
        $propiedad = Propiedad::find($id);
        $router->render('/paginas/propiedad',[
            'propiedad'=>$propiedad

        ]);
    }
    public static function blog(Router $router){
        $router->render('paginas/blog');
    }
    public static function entrada(Router $router){
        $router->render('/paginas/entrada');
    }
    public static function contacto(Router $router){

        $mensaje = null;

        if($_SERVER['REQUEST_METHOD'] === 'POST'){

           $respuestas =$_POST['contacto'];

           //crear una instancia de php mailer
           $mail = new PHPMailer();

           //CONFIGURAR SMTP
           $mail->isSMTP();
           $mail->Host ='smtp.mailtrap.io';
           $mail->SMTPAuth = true;
           $mail->Username = 'a058ff5232c6a0';
           $mail->Password = '142223b0f2f546';
           $mail->SMTPSecure = 'tls';
           $mail->Port = 2525;


            //CONFIGURAR ENVIO DEL EMAIL
            $mail->setFrom('raquelalvarado1717@gmail.com');
            $mail->addAddress('raquelalvarado1717@gmail.com', 'BienesRaices.com');
            $mail->Subject = 'Tienes un nuevo mensaje';

            //HABILITAR HTML

            $mail->isHTML(true);
            $mail->CharSet = 'UTF-8';
            
            //Definir el contenido
            $contenido = '<html>';
            $contenido .= '<p>Tienes un nuevo mensaje</p>';
            $contenido .= '<p>Nombre: '.$respuestas['nombre'].'</p>';
            
            if($respuestas['contacto'] === 'telefono'){
                $contenido.= '<p>Eligio ser contactado por teléfono: </p>';
                $contenido .= '<p>Teléfono: '.$respuestas['telefono'].'</p>';
                $contenido .= '<p>Fecha: '.$respuestas['fecha'].'</p>';
                $contenido .= '<p>Hora: '.$respuestas['hora'].'</p>';

            }else{
                $contenido.= '<p>Eligio ser contactado por email: </p>';
                $contenido .= '<p>Email: '.$respuestas['email'].'</p>';
            }

            $contenido .= '<p>Mensaje: '.$respuestas['mensaje'].'</p>';
            $contenido .= '<p>Vende o Compra: '.$respuestas['tipo'].'</p>';
            $contenido .= '<p>Precio o Presupuesto: L'.$respuestas['precio'].'</p>';
            $contenido .= '<p>Prefiere ser contactado por: '.$respuestas['contacto'].'</p>';

            $contenido .='</html>';


            $mail->Body = $contenido;
            $mail->AltBody = 'tEXTO ALTERNATIVO';



            /* debuguear($mail); */

            //enviar el email
            if($mail->send()){
                $mensaje= "Mensaje enviado Correctamente";
            }else{
                $mensaje= "El mensaje no se pudo enviar";
            }





        }
        $router->render('paginas/contacto',[
            'mensaje'=>$mensaje
        ]);

    }

}