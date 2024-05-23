<?php

//Configuración del sistema
define("SITE_URL", "http://localhost/tienda_online");
define("KEY_TOKEN", "TU_TOKEN");
define("MONEDA", "$");

//Configuración para Paypal
define("CLIENT_ID", "ATUhT7WJaAJksf1gdKKwcmnvOrnMs1n69IAs4OGEfmvWm5fkARpiRy_nVxJ2s86UEgmyTBPmwDHvZAn2");
define("CURRENCY", "MXN");

//Configuración para Mercado Pago
define("TOKEN_MP", "TEST-XXXXXXXXX");
define("PUBLIC_KEY_MP", "TEST-XXXXXXXXX");
define("LOCALE_MP", "es-MX");


//Datos para envio de correo electronico
define("MAIL_HOST", "ramagallonab@gmail.com");
define("MAIL_USER", "ramagallonab@gmail.com");
define("MAIL_PASS", "R4m4g4!98");
define("MAIL_PORT", "465");

session_start();

$num_cart = 0;
if (isset($_SESSION['carrito']['productos'])) {
    $num_cart = count($_SESSION['carrito']['productos']);
}
