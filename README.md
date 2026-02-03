# 🚀 Proyecto: Automatización Inteligente de Google Drive con n8n y Ollama

¡Hola! Soy María y este es mi proyecto final para la asignatura de Desarrollo de Agentes de IA. He montado un sistema que "vigila" una carpeta de Google Drive y, cada vez que subo algo, una IA local lo analiza y me envía un resumen por email. ¡Todo funcionando en Docker!

## 🛠️ ¿Qué tecnologías he usado?
- **Docker & Docker Compose**: Para que todo corra en "contenedores" y no ensucie mi Windows.
- **n8n**: La herramienta que une todo (el "pegamento" de la automatización).
- **Ollama**: Mi propia IA local (modelo llama3.2:1b) para no depender de APIs de pago como OpenAI.
- **Google Drive API**: Para detectar los archivos.
- **Gmail SMTP**: Para recibir las notificaciones.

## 📂 Estructura del Proyecto
```bash
.
├── docker-compose.yml       # El cerebro que levanta n8n y Ollama
├── ollama/
│   ├── Dockerfile           # Cómo se construye mi servidor de IA
│   └── modelo-config.json   # Configuración de los prompts
├── n8n/local-files/         # Donde guardo los flujos (workflows)
└── google-credentials.json  # Mis llaves mágicas para entrar en Google Drive
```

## ⚙️ Cómo lo he configurado (Paso a paso)

### 1. Levantar el entorno
Usando la terminal, lancé el comando mágico:
```powershell
docker-compose up -d --build
```
Esto me levantó n8n en el puerto `5678` y Ollama en el `11434`.

### 2. El flujo de n8n
He creado un workflow con 3 nodos:
1.  **Google Drive Trigger**: Vigila mi carpeta tareas. Cada vez que hay un archivo nuevo, se activa.
2.  **Ollama Analysis (HTTP Request)**: Envía el archivo a mi IA local. Le pido que me haga un resumen en puntos clave para que sea fácil de leer.
3.  **Email Sender**: Me envía un correo que dice: *"El archivo [nombre] ha sido modificado"* y mete dentro el resumen de la IA.

### 3. Problemas que tuve (y cómo los arreglé) 😅
- **Versiones Rebeldes**: Al principio n8n no se actualizaba bien por un proceso fantasma de Windows (`wslrelay`). Tuve que reiniciar todo el sistema para que funcionara la versión 2.7.0.
- **Errores de JSON**: Los nombres de archivos con espacios daban fallos en la IA, así que simplifiqué el envío de datos para que fuera más robusto.
- **Gmail SMTP**: Google es muy estricto. Tuve que usar una "Contraseña de aplicación" de 16 letras y el puerto 465 con SSL para que me dejara enviar correos.

> [!NOTE]
> **Privacidad**: Por motivos de seguridad y privacidad de los datos personales, el resumen automático del contenido completo de los documentos no se ha activado en esta versión final, limitándose el análisis a metadatos y descripciones generales.

## 🚀 Metas Futuras
- ✨ Gracias a la ayuda de mi asistente, una de mis metas es dejar implementado al 100% el nodo de extracción de texto que permite al sistema "leer" el interior de los archivos PDF/TXT para generar resúmenes reales en el futuro.

---
*Proyecto realizado como parte del ejercicio práctico de Automatización.*
