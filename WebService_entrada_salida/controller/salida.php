<?php

    header('Content-type: application/json');

    require_once("../config/conexion.php");
    require_once("../models/Salida.php");
    $salida = new Salida();

    $body = json_decode(file_get_contents("php://input"), true);  

    switch($_GET["op"]){
        case "GetAll":
            $datos=$salida->get_salida();
            echo json_encode($datos);
        break;

        case "Insert":
            $datos=$salida->insert_salida($body["ID_Producto"],$body["Fecha_Salida"],$body["Cantidad_Salida"]);
            echo json_encode("Correcto");
        break;

        case "Update":
            $datos=$salida->update_salida($body["ID_Salida"],$body["ID_Producto"],$body["Fecha_Salida"],$body["Cantidad_Salida"]);
            echo json_encode("Correcto");
        break;

        case "Delete":
            $datos=$salida->delete_salida($body["ID_Salida"]);
            echo json_encode("Correcto");
        break;
    }
?>