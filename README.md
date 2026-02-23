# 🚀 GCUBE Extension Guide — Ollama + Open WebUI

> 💡 **GCUBE VS Code Extension 환경에서 Ollama + Open WebUI를 배포하고, 모델을 커스터마이징하여 본인 GitHub 계정에 반영하는 전체 과정을 안내합니다.**

---

## 📌 소개

이 가이드는 GCUBE GPU 워크로드 위에서 다음을 수행하는 방법을 설명합니다.

- Ollama + Open WebUI 기반 LLM 서빙 환경 구축
- 모델 커스터마이징 (시스템 프롬프트 수정)
- 변경 사항을 본인 GitHub 계정에 Push

> ✅ 기본 모델은 `qwen2.5-coder:7b`이며, Ollama에서 지원하는 모든 모델로 교체 가능합니다.  
> ✅ HuggingFace 계정 및 토큰이 **필요하지 않습니다.**

---

## ⚙️ GCUBE 워크로드 설정

| 항목 | 값 |
|------|-----|
| 컨테이너 이미지 | `pytorch/pytorch:2.7.0-cuda12.8-cudnn9-devel` |
| 저장소 유형 | 도커허브 |
| 컨테이너 포트 | `8080` |
| 컨테이너 명령 | `/bin/bash -c "apt-get update && apt-get install -y git curl && sleep infinity"` |
| 환경변수 | `OLLAMA_HOST` = `0.0.0.0:11434` |
| 환경변수 | `OPEN_WEBUI_PORT` = `8080` |
| GPU | RTX 4080S x 1 |
| GPU 메모리 | 16GB |

---

## 🚀 빠른 시작

### Step 1. 저장소 Fork 또는 Clone

본인 GitHub 계정으로 이 저장소를 Fork하거나 Clone합니다.

```bash
git clone https://github.com/chaeyoon08/gcube-extension-guide.git
cd gcube-extension-guide
```

### Step 2. Setup 실행

Ollama, Open WebUI 설치 및 모델 다운로드를 자동으로 진행합니다.

```bash
bash setup.sh
```

> ⏳ 처음 실행 시 설치 및 모델 다운로드로 수~수십 분이 소요될 수 있습니다.

### Step 3. 서비스 시작

```bash
bash start.sh
```

### Step 4. 브라우저에서 접속

GCUBE 워크로드의 **서비스 URL (포트 8080)** 으로 접속하면 Open WebUI 채팅 인터페이스가 열립니다.

---

## 🛠️ 커스터마이징 — 시스템 프롬프트 수정

Open WebUI의 시스템 프롬프트를 수정하여 모델의 응답 방식을 원하는 용도에 맞게 조정할 수 있습니다.

### 1. Open WebUI 접속 후 Admin Panel 진입

상단 우측 프로필 아이콘 → **Admin Panel** → **Settings** → **System Prompt**

### 2. 기본 시스템 프롬프트 (예시)

```
You are a helpful, accurate, and professional AI assistant.
You provide clear explanations, well-structured code, and practical solutions.
You support both Korean and English and respond in the same language as the user.
```

### 3. 연구 목적 커스텀 프롬프트 예시

```
You are an expert AI assistant specializing in scientific research support.
Your role is to assist researchers with data analysis, experiment design, 
literature review, and technical problem solving.
Provide precise, evidence-based responses. When writing code, prioritize 
readability and include comments for reproducibility.
You support both Korean and English and respond in the same language as the user.
```

> ✅ 시스템 프롬프트는 도메인(의료, 금융, 생물정보학 등)에 맞게 자유롭게 수정 가능합니다.

---

## 📤 변경 사항 GitHub에 Push

커스터마이징 작업 후 본인 GitHub 계정에 반영합니다.

### 1. Git 사용자 정보 설정 (최초 1회)

```bash
git config --global user.name "본인 GitHub 사용자명"
git config --global user.email "본인 GitHub 이메일"
```

### 2. 변경 사항 확인

```bash
git status
git diff
```

### 3. Commit 및 Push

```bash
git add .
git commit -m "feat: 시스템 프롬프트 커스터마이징"
git push origin main
```

### 4. GitHub에서 반영 확인

브라우저에서 본인 GitHub 레포지토리에 접속하여 커밋이 정상적으로 반영되었는지 확인합니다.

---

## 📁 프로젝트 구조

```
gcube-extension-guide/
├── README.md        # 프로젝트 설명 및 가이드 (현재 파일)
├── setup.sh         # Ollama + Open WebUI 설치 + 모델 다운로드
└── start.sh         # 서비스 시작 스크립트
```

---

## ❓ 자주 묻는 질문

**Q. 다른 모델로 교체하고 싶어요.**  
A. `setup.sh` 내 `ollama pull qwen2.5-coder:7b` 부분을 원하는 모델명으로 변경하세요.  
사용 가능한 모델 목록: [ollama.com/library](https://ollama.com/library)

**Q. 처음 실행 시 시간이 오래 걸려요.**  
A. setup.sh 실행 중 Ollama, Open WebUI 설치 및 모델 다운로드가 진행됩니다. 다음 실행부터는 `bash start.sh`만 실행하면 됩니다.

**Q. HuggingFace 토큰이 필요한가요?**  
A. 필요하지 않습니다. Ollama 레지스트리에서 직접 다운로드합니다.

**Q. 브라우저에서 접속이 안 돼요.**  
A. GCUBE 워크로드 설정에서 포트 8080이 열려 있는지 확인해주세요.

---

## 📜 라이선스

이 프로젝트의 코드는 MIT License를 따릅니다.  
Qwen2.5-Coder 모델은 Apache 2.0 License를 따릅니다.