<?php 

namespace Controllers;

use App\Propiedad as AppPropiedad;
use MVC\Router;
use Model\Propiedad;
use Model\Vendedor;
use Intervention\Image\ImageManagerStatic as Image;


class PropiedadController{
    public static function index(Router $router){

        $propiedades = Propiedad::all();
        $vendedores = Vendedor::all();
        //muestra mensaje condicional
        $resultado = $_GET['resultado']??null;
        
        $router->render('propiedades/admin',[
            'propiedades'=>$propiedades,
            'resultado' =>$resultado,
            'vendedores'=>$vendedores
        ]);

    }
    public static function crear(Router $router){
        
        $propiedad = new Propiedad();
        $vendedores = Vendedor::all();
        $errores = Propiedad::getErrores();
        
        if($_SERVER['REQUEST_METHOD']=='POST'){
            $propiedad = new Propiedad($_POST['propiedad']);

            /* SUBIDA DE ARCHIVOS */
        
            //Generar un nombre unico
            $nombreImagen =md5( uniqid(rand(),true) ).".jpg";

            //setear la imagen
            //Realiza un recize a la imagen con intervencion
            if($_FILES['propiedad']['tmp_name']['imagen']){
                $image = Image::make($_FILES['propiedad']['tmp_name']['imagen'])->fit(800,600);
                $propiedad->setImagen($nombreImagen);
            }
            
            //validar
            $errores = $propiedad->validar();

        //Revisar que el array de errores este vacio
            if(empty($errores)){

                //crear carpeta
                if(!is_dir(CARPETA_IMAGENES)){
                    mkdir(CARPETA_IMAGENES);
                }

                //guarda la imagen
                $image->save(CARPETA_IMAGENES . $nombreImagen);

                //Guarda en la base de datos
                $propiedad->guardar();

                
            
        }

        }

        $router->render('propiedades/crear', [
            'propiedad' => $propiedad,
            'vendedores' => $vendedores,
            'errores' => $errores
            

        ]);
        

    }
    public static function actualizar(Router $router){

        $id= validarRedireccionar('/admin');
        //Obtener datos de la propiedad

        $propiedad = Propiedad::find($id);

        //consulta para obtener todos los vendedores
        $vendedores = Vendedor::all();

        $errores=Propiedad::getErrores();

        //Ejecutar el codigo despues que el usuario mande el formulario
        if($_SERVER['REQUEST_METHOD'] ==='POST'){

            //asignar los atributos
            $args =$_POST['propiedad'];

            $propiedad->sincronizar($args);

            //validacion
            $errores = $propiedad->validar();

            //subida de archivos 
            //Generar un nombre unico
            $nombreImagen =md5( uniqid(rand(),true) ).".jpg";

            if($_FILES['propiedad']['tmp_name']['imagen']){
                $image = Image::make($_FILES['propiedad']['tmp_name']['imagen'])->fit(800,600);
                $propiedad->setImagen($nombreImagen);
            }

        //Revisar que el array de errores este vacio
            if(empty($errores)){
                if($_FILES['propiedad']['tmp_name']['imagen']){
                    
                    //almacenar la imagen
                    $image->save(CARPETA_IMAGENES . $nombreImagen);
                }

                $propiedad->guardar();              
            }

        }
        $router->render('propiedades/actualizar', [
            'propiedad' => $propiedad,
            'vendedores' => $vendedores,
            'errores' => $errores            
        ]);

    }

    public static function eliminar(Router $router) {
        if($_SERVER['REQUEST_METHOD'] === 'POST'){
             //Validar id
            $id=$_POST['id'];
            $id=filter_var($id,FILTER_VALIDATE_INT);

            if($id){
                $tipo = $_POST['tipo'];
                
                if(validadTipoContenido($tipo)){
                    //compara lo que vamos a eliminar
                    $propiedad = Propiedad::find($id);
                    $propiedad->eliminar();
                }    
            }
        }
        
    }

}