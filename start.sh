#!/bin/bash
# ==============================================
#  GCUBE Extension Guide — Start Script
#  Ollama + Open WebUI 서비스 시작
#  실행: bash start.sh
# ==============================================

echo "======================================"
echo "  🚀 GCUBE Extension Guide 시작"
echo "======================================"
echo ""

# ----------------------------------------------
# 1. Ollama 서버 시작
# ----------------------------------------------
echo "Ollama 서버 시작 중..."
ollama serve &
OLLAMA_PID=$!

until curl -s http://localhost:11434 > /dev/null 2>&1; do
    sleep 2
done
echo "✅ Ollama 서버 준비 완료"

# ----------------------------------------------
# 2. Open WebUI 시작
# ----------------------------------------------
echo "Open WebUI 시작 중..."
OLLAMA_BASE_URL=http://localhost:11434 open-webui serve --port 8080 &
WEBUI_PID=$!

until curl -s http://localhost:8080 > /dev/null 2>&1; do
    sleep 2
done

echo ""
echo "======================================"
echo "  🌐 서비스 준비 완료!"
echo "  브라우저에서 아래 주소로 접속하세요:"
echo "  GCUBE 서비스 URL (포트 8080)"
echo "======================================"

wait $WEBUI_PID