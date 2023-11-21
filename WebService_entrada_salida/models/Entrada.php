<?php
    class Entrada extends Conectar{
        public function get_entrada(){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT * FROM entrada";
            $sql=$conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }
    
        public function insert_entrada($ID_Producto, $Fecha_Entrada, $Cantidad_Entrada) {
            $conectar = parent::conexion();
            parent::set_names();
            $sql = "INSERT INTO entrada(ID_Entrada, ID_Producto, Fecha_Entrada, Cantidad_Entrada) VALUES (NULL, ?, ?, ?)";
            $sql = $conectar->prepare($sql);
            $sql->bindParam(1, $ID_Producto);
            $sql->bindParam(2, $Fecha_Entrada);
            $sql->bindParam(3, $Cantidad_Entrada);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }
        
        
        public function update_entrada($ID_Entrada,$ID_Producto, $Fecha_Entrada, $Cantidad_Entrada){
            $conectar=parent::conexion();
            parent::set_names();
            $sql="UPDATE entrada SET ID_Producto = ?, Fecha_Entrada = ?, Cantidad_Entrada = ? WHERE ID_Entrada = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindParam(1, $ID_Producto);
            $sql->bindParam(2, $Fecha_Entrada);
            $sql->bindParam(3, $Cantidad_Entrada);
            $sql->bindParam(4, $ID_Entrada);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }
        
        public function delete_entrada($ID_Entrada){
            $conectar=parent::conexion();
            parent::set_names();
            $sql="DELETE FROM entrada WHERE entrada.ID_Entrada = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $ID_Entrada);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

    }
        
    
?>