<?php
    class Productos extends Conectar{

        public function get_productos(){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT * FROM productos";
            $sql=$conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function insert_productos($Nombre,$Descripcion,$Stock_Actual){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="INSERT INTO productos(ID_Producto,Nombre,Descripcion,Stock_Actual) VALUES (NULL,?,?,?);";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $Nombre);
            $sql->bindValue(2, $Descripcion);
            $sql->bindValue(3, $Stock_Actual);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function update_productos($ID_Producto,$Nombre,$Descripcion,$Stock_Actual){
            $conectar=parent::conexion();
            parent::set_names();
            $sql="UPDATE productos SET Nombre = ?, Descripcion = ?, Stock_Actual = ? WHERE ID_Producto = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $Nombre);
            $sql->bindValue(2, $Descripcion);
            $sql->bindValue(3, $Stock_Actual);
            $sql->bindValue(4, $ID_Producto);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function delete_productos($ID_Producto){
            $conectar=parent::conexion();
            parent::set_names();
            $sql="DELETE FROM productos WHERE productos.ID_Producto = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $ID_Producto);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

    }

?>