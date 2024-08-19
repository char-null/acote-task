# acote_task

riverpod 상태관리와 mvvm패턴을 적용한 acote task 입니다.
flutter sdk version 3.22.2 에서 개발되었습니다.
조금 더 상세한 설명은 notion 페이지에서 확인 가능합니다

## 기술 스택

- **Flutter**: 3.22.2
- **Riverpod**: 상태 관리를 위한 라이브러리
- **개발 환경**: Windows

## 프로젝트 실행 방법

### 1. Flutter 설치
Flutter 3.22.2 버전을 설치합니다. fvm을 통해 버전을 맞춰도 됩니다.

### 2. 프로젝트 클론
Git을 사용하여 프로젝트를 로컬 환경에 클론합니다:

```bash
git clone https://github.com/char-null/acote-task.git
```
### 3. 의존성 설치
```bash
flutter pub get
```

### 4. 프로젝트 빌드
```bash
flutter run
```

### 추가 안내

작성된 코드를 통해 코드가 생성되는 부분들이 있습니다.(g,freezed 파일)
혹시나 오류가 발생한다면
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
명령어를 통해 재생성하면 됩니다.
