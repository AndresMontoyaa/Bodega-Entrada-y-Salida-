<?php

    header('Content-type: application/json');

    require_once("../config/conexion.php");
    require_once("../models/Entrada.php");
    $entrada = new Entrada();

    $body = json_decode(file_get_contents("php://input"), true);  

    switch($_GET["op"]){
        case "GetAll":
            $datos=$entrada->get_entrada();
            echo json_encode($datos);
        break;

        case "Insert":
            $datos=$entrada->insert_entrada($body["ID_Producto"],$body["Fecha_Entrada"],$body["Cantidad_Entrada"]);
            echo json_encode("Correcto");
        break;

        case "Update":
            $datos=$entrada->update_entrada($body["ID_Entrada"],$body["ID_Producto"],$body["Fecha_Entrada"],$body["Cantidad_Entrada"]);
            echo json_encode("Correcto");
        break;

        case "Delete":
            $datos=$entrada->delete_entrada($body["ID_Entrada"]);
            echo json_encode("Correcto");
        break;
    }
?>