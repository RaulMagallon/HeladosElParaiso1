document.getElementById('contactForm').addEventListener('submit', async (e) => {
    e.preventDefault();

    const nombre = document.getElementById('nombre').value;
    const email = document.getElementById('email').value;
    const mensaje = document.getElementById('mensaje').value;

    const responseMessage = document.getElementById('responseMessage');
    responseMessage.innerHTML = 'Enviando mensaje...';

    try {
        const response = await fetch('contact.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ nombre, email, mensaje }),
        });

        const responseData = await response.json();

        if (response.ok) {
            responseMessage.innerHTML = 'Mensaje enviado correctamente. ¡Gracias!';
            document.getElementById('contactForm').reset();
        } else {
            responseMessage.innerHTML = `Error: ${responseData.message}`;
        }
    } catch (error) {
        responseMessage.innerHTML = 'Error al enviar el mensaje. Inténtalo de nuevo más tarde.';
    }
});
