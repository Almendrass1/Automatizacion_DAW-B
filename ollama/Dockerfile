FROM ollama/ollama:latest
# Copiar script de inicialización
COPY scripts/init-ollama.sh /init-ollama.sh
RUN chmod +x /init-ollama.sh
# Copiar configuración del modelo
COPY ollama/modelo-config.json /modelo-config.json
EXPOSE 11434

# Usar un script para arrancar ollama y ejecutar el pull
ENTRYPOINT ["/usr/bin/bash", "-c", "/usr/bin/ollama serve & sleep 5 && /init-ollama.sh && wait"]
