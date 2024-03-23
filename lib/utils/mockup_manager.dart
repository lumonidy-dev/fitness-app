// mockup_manager.dart

class MockupManager {
  static List<String> mockups = [
    // Lista de mensajes de mockup
    """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Anuncio</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }
            .container {
                background-color: #ffffff;
                box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                padding: 20px;
                margin: 20px;
            }
            .message {
                font-size: 18px;
                font-weight: bold;
                color: #333333;
                text-align: center;
            }
            .ad {
                font-size: 14px;
                color: #666666;
                text-align: center;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="message">
                ¡BEBER AGUA TE HACE BIEN!
            </div>
            <div class="ad">
                Bebe más de 2 litros al día.
            </div>
            <img src="https://cataas.com/cat" alt="Gato" style="display: block; margin: 20px auto;">
            
        </div>
    </body>
    </html>
    """,
    // Agrega más mensajes aquí si es necesario
  ];

  static String getNextMockup() {
    // Devuelve el siguiente mensaje de mockup en la lista
    return mockups[0];
  }
}
