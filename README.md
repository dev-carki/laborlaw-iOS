# 📱 LaborLawApp (iOS)

근로자 및 사업자를 위한 **노동법 정보 제공 iOS 애플리케이션**

사용자의 기본 정보와 관심 법률을 기반으로 맞춤형 노동법 정보를 제공하는 앱입니다.

---

## 🧩 프로젝트 개요

- **플랫폼**: iOS
- **UI 프레임워크**: SwiftUI
- **아키텍처**: Clean Architecture (Domain / Data / Presentation)
- **비동기 처리**: Swift Concurrency (`async / await`)
- **네트워크**: Alamofire
- **백엔드**: FastAPI (REST API)
- **상태 관리**: MVVM + ObservableObject

---

## 🏗️ 아키텍처 구조

본 프로젝트는 [**Clean Architecture**](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) 원칙을 기반으로 구성되어 있습니다.

```
📦 LaborLawApp
 ┣ 📂 Application
 ┃ ┣ 📂 Config
 ┃ ┣ 📂 Injection (DI)
 ┃ ┣ 📂 Helper
 ┃ ┣ 📂 Coordinator
 ┃ ┣ 📂 Extension
 ┃ ┣ 📂 Resources
 ┣ 📂 Presentation
 ┃ ┣ 📂 View
 ┃ ┣ 📂 ViewModel
 ┃ ┗ 📂 Component (Custom UI)
 ┣ 📂 Domain
 ┃ ┣ 📂 Entity (Model)
 ┃ ┣ 📂 Repository (Protocol)
 ┃ ┗ 📂 UseCase
 ┣ 📂 Data
 ┃ ┣ 📂 Network
 ┃ ┣ 📂 DTO
 ┃ ┣ 📂 RepositoryImpl
 ┃ ┗ 📂 Mapper
```

---

## 🔄 데이터 흐름 예시 (회원가입)

```
View
 → ViewModel
 → UseCase
 → UserRepository (Domain Protocol)
 → UserRepositoryImpl (Data)
 → API
 → DTO
 → Domain Model
 → ViewModel
 → View
```

---

## 🧑‍💼 사용자 정보 입력 플로우

### 입력 항목

- 성별 (단일 선택)
- 나이 (선택 / 최대 2자리 입력 제한)
- 연봉 구간 (단일 선택)
- 직군 (텍스트 입력)
- 고용 형태 (단일 선택)
- 관심 있는 법 (다중 선택)

### UI 특징

- 재사용 가능한 컴포넌트
    - `TitledSection`: 뷰 제목 + 뷰
    - `CustomRadioButton / CustomCheckBox`: 기반 단일/다중 선택 UI
    - `CustomTextField / CustomPasswordTextField`: 일반 입력 / 비밀번호 입력 필드
    - `CustomButton`

---

## 🧱 주요 SwiftUI 컴포넌트 설계

### 📌 CustomTextField

- `@Binding` 기반 양방향 바인딩
- 키보드 타입 설정 가능
- 입력 길이 제한 로직 분리

---

## 🔐 네트워크 & 에러 처리

- Alamofire 기반 REST API 통신
- 공통 Response Wrapper 사용
- HTTP Status Code 기반 에러 분기

---

## 🧪 트러블슈팅 경험

### ✔ Optional 처리

- ViewModel에서는 Optional 허용
- API 요청 시 Domain → DTO 변환 과정에서 안전하게 언래핑

### ✔ 서버는 성공했는데 프론트에서 실패로 처리되던 문제

- 원인: Response DTO와 실제 응답 JSON 구조 불일치
- 해결: Response Wrapper와 DTO 구조 재정의

### ✔ Git 관리

- `xcconfig`, `xcuserdata`, `xcuserstate` 등 **로컬/개인 설정 파일 완전 분리**
- `.gitignore` 정리
- 저장소에서 민감 설정 제거

---

## 🚀 향후 개선 예정

- 관심 법률 기반 추천 알고리즘 고도화
- 핵심 비즈니스 로직 추가
    - RAG Backend System
    - 법률 상담사 기능
