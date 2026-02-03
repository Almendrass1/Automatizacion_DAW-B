#!/bin/bash
# scripts/init-ollama.sh
echo " Inicializando Ollama con modelo ligero..."
# Descargar modelo pequeño para análisis de texto
ollama pull llama3.2:1b
echo " Modelo descargado y listo"
