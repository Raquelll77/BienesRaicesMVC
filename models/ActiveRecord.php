<?php

namespace Model;

class ActiveRecord{ 
    //BASE DE DATOS
    protected static $db;
    protected static $columnasDB = ['id', 'titulo', 'precio', 'imagen', 'descripcion', 'habitaciones', 'wc', 'estacionamiento', 'creado', 'vendedores_id'];
    protected static $tabla = '';

    //ERRORES
    protected static $errores = [];

    
    public function guardar(){
        if(!is_null($this->id)){
            //actualizar
            $this->actualizar();
        }
        else{
            //crear nuevo registro
            $this->crear();
        }
    }

    public function crear(){

        //SANITIZAR DATOS
        $atributos = $this->sanitizarAtributos();

        //insertar en la base de datos
        $query = " INSERT INTO " . static::$tabla . " ( ";
        $query .= join(', ', array_keys($atributos));
        $query .= " ) VALUES (' ";  
        $query .= join("', '", array_values($atributos));
        $query .= " ') ";
        

        $resultado = self::$db->query($query);
        
        if($resultado){
            //echo "Resultado ingresado correctamente";
            header('Location: /admin?resultado=1');        

        }
    }

    public function actualizar(){

        //SANITIZAR DATOS
        $atributos = $this->sanitizarAtributos();

        $valores=[];
        foreach($atributos as $key => $value){
            $valores[] = "{$key}='{$value}'";
        }
        $query=" UPDATE " . static::$tabla . " SET ";
        $query .= join(', ', $valores);
        $query .= " WHERE id = '" . self::$db->escape_string($this->id) . "' ";
        $query .= " LIMIT 1 ";

        $resultado = self::$db->query($query);

        if($resultado){
            //echo "Resultado ingresado correctamente";
            header('Location: /admin?resultado=2');

        }
    }

    //eliminar un registro
    public function eliminar(){
    
        $query = "DELETE FROM " . static::$tabla . " WHERE id = " . self::$db->escape_string($this->id) . " LIMIT 1";
        $resultado = self::$db->query($query);

        if($resultado){
            $this->borrarImagen();
            header('Location: /admin?resultado=3');

        }

    }

    //definir conexion a la BD
    public static function setDB($database){
        self::$db = $database;
    }

    //iterar sobre arreglo db
    //identificar y unir los atributos de la BD

    public function atributos(){
       $atributos =[];
       foreach(static::$columnasDB as $columna){
          if($columna === 'id') continue;
          $atributos[$columna] = $this->$columna;
       }
       return $atributos;
    }

    //sanitizar datos
    public function sanitizarAtributos(){
        $atributos = $this->atributos();
        $sanitizado = [];

        foreach($atributos as $key => $value){
            $sanitizado[$key] = self::$db->escape_string($value);
        }
        
        return $sanitizado;
    }

    //Subida de archivos
    public function setImagen($imagen){
        //elimina imagen previa

        if( !is_null($this->id) ){
            $this->borrarImagen();
            
        }

        //asignar al atributo imagen el nombre de la imagen
        if($imagen){
            $this->imagen = $imagen;
        }
    }

    //elimina el archivo
    public function borrarImagen(){
        //comprobar si existe el archivo
        $existeArchivo = file_exists(CARPETA_IMAGENES . $this->imagen);
        if($existeArchivo){
            unlink(CARPETA_IMAGENES . $this->imagen);
        }        
    }

    //validacion
    public static function getErrores(){
        return static::$errores;
    }

    public function validar(){
        static::$errores=[];
        return static::$errores;
    }
    
    

    //LISTAS todas los registros
    public static function all(){
        $query = "SELECT *FROM " . static::$tabla;
        $resultado= self::consultarSQL($query);
        return $resultado;

    }

    // Obtiene determinado numero de registros
    public static function get($cantidad){
        $query = "SELECT * FROM ". static::$tabla ." LIMIT " . $cantidad;
 
        $resultado = self::consultarSQL($query);
        return $resultado;
    }

    //Busca un registro por su id
    public static function find($id){
        $query="SELECT *FROM " . static::$tabla . " WHERE id=${id}";
        $resultado = self::consultarSQL($query);
        return array_shift($resultado);
        
        
    }

    public static function consultarSQL($query){
        //consultar base de datos
        $resultado = self::$db->query($query);

        //iterar los resultados
        $array = [];
        while($registro =$resultado->fetch_assoc()){
            $array[] = static::crearObjeto($registro);
        }
        
        //liberar memoria
        $resultado->free();
        //retornar los resultados
        return $array;

    }
    protected static function crearObjeto($registro){
        $objeto = new static();

        foreach($registro as $key => $value){
            if(property_exists($objeto, $key)){
                $objeto->$key = $value;

            }
        }
        return $objeto;
    }

    //sincroniza el objeto en memoria con los cambios realizados por el usuario
    public function sincronizar($args = [] ){
        foreach($args as $key => $value){

            if(property_exists($this, $key) && !is_null($value)){
                $this->$key = $value;
            }
        }
    }
    
}
