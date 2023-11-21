<?php
    class Salida extends Conectar{
        public function get_salida(){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT * FROM salida ";
            $sql=$conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }
    
        public function insert_salida($ID_Producto, $Fecha_Salida, $Cantidad_Salida) {
            $conectar = parent::conexion();
            parent::set_names();
            $sql = "INSERT INTO salida(ID_Salida, ID_Producto, Fecha_Salida, Cantidad_Salida) VALUES (NULL, ?, ?, ?)";
            $sql = $conectar->prepare($sql);
            $sql->bindParam(1, $ID_Producto);
            $sql->bindParam(2, $Fecha_Salida);
            $sql->bindParam(3, $Cantidad_Salida);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }
        
        
        public function update_salida($ID_Salida,$ID_Producto, $Fecha_Salida, $Cantidad_Salida){
            $conectar=parent::conexion();
            parent::set_names();
            $sql="UPDATE salida SET ID_Producto = ?, Fecha_Salida = ?, Cantidad_Salida = ? WHERE ID_Salida = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindParam(1, $ID_Producto);
            $sql->bindParam(2, $Fecha_Salida);
            $sql->bindParam(3, $Cantidad_Salida);
            $sql->bindParam(4, $ID_Salida);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }
        
        public function delete_salida($ID_Salida){
            $conectar=parent::conexion();
            parent::set_names();
            $sql="DELETE FROM salida WHERE salida.ID_Salida = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $ID_Salida);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

    }
        
    
?>