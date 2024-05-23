<?php
    require 'config/config.php';
require 'config/database.php';

$db = new Database();
$con = $db->conectar();

$comando->execute();
$resultado = $comando->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = trim($_POST["nombre"]);
    $email = trim($_POST["email"]);
    $mensaje = trim($_POST["mensaje"]);

    // Aquí debes implementar el envío del correo electrónico
    // Por ejemplo, utilizando la función mail() de PHP

    $to = "tu@email.com";
    $subject = "Mensaje de contacto desde la heladería";
    $message = "Nombre: $nombre\n";
    $message .= "Email: $email\n";
    $message .= "Mensaje:\n$mensaje";

    $headers = "From: $email" . "\r\n" .
               "Reply-To: $email" . "\r\n" .
               "X-Mailer: PHP/" . phpversion();

    if (mail($to, $subject, $message, $headers)) {
        http_response_code(200);
        echo json_encode(array("message" => "Mensaje enviado correctamente."));
    } else {
        http_response_code(500);
        echo json_encode(array("message" => "Error al enviar el mensaje."));
    }
} else {
    http_response_code(405); // Método no permitido
    echo json_encode(array("message" => "Método no permitido."));
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Helados El Paraíso</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="css/all.min.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <h2>Contacto</h2>
    <form id="contactForm" action="contact.php" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="mensaje">Mensaje:</label>
        <textarea id="mensaje" name="mensaje" rows="4" required></textarea>

        <button type="submit" id="submitBtn">Enviar Mensaje</button>
    </form>
    <p id="responseMessage"></p>
</div>

<script src="script.js"></script>
</body>
</html>

