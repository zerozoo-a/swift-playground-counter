# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

MVVM-C 아키텍처 학습용 iOS 토이 프로젝트. RxSwift 기반의 카운터 앱으로, MustIt 앱의 아키텍처 패턴을 단순화하여 학습한다.

**App Lifecycle**: AppDelegate 기반. SceneDelegate를 사용하지 않으며, `AppDelegate.window`에서 직접 UIWindow를 관리한다.

## Build & Development

- **Project**: Open `abc.xcodeproj` in Xcode
- **Minimum iOS**: 18.1
- **Swift**: 5.0
- **Dependencies**: RxSwift via SPM (RxSwift, RxCocoa, RxRelay)

```bash
# Build
xcodebuild -project abc.xcodeproj -scheme abc -sdk iphonesimulator build

# Test
xcodebuild -project abc.xcodeproj -scheme abc -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 16' test
```

## Architecture: MVVM-C (Model-View-ViewModel-Coordinator)

### App Entry Flow

```
@main AppDelegate
  → didFinishLaunchingWithOptions
    → UIWindow(frame:) 생성
    → UINavigationController 생성
    → AppCoordinator.start() → CounterViewController + CounterViewModel 생성
    → window.rootViewController 설정
```

### Core Pattern

새 기능 추가 시 아래 구조를 따른다:

```
[Feature]ViewController.swift   # ViewModelBindable 채택
[Feature]ViewModel.swift        # InputOutputAttachable 채택
[Feature]Coordinator.swift      # ReactiveCoordinator<T> 상속
```

### Key Protocols

| Protocol | Purpose |
|----------|---------|
| `ViewModelBindable` | ViewController에 ViewModel을 바인딩. `bind(viewModel:)` → `loadViewIfNeeded()` → `bindViewModel()` |
| `InputOutputAttachable` | ViewModel의 `transform(input:) → Output` 계약 정의 |

### Reactive Data Flow (RxSwift)

```
UI 이벤트 → Input (PublishRelay) → ViewModel.transform() → Output (BehaviorRelay) → UI 업데이트
```

- `PublishRelay<Void>` — 버튼 탭 등 일회성 이벤트
- `BehaviorRelay<T>` — 현재 상태를 유지하는 출력 값
- `DisposeBag` — 모든 VC, VM, Coordinator에 존재

### Navigation

- `ReactiveCoordinator<ResultType>` — 베이스 클래스. `navigationController`와 `disposeBag` 보유
- `AppCoordinator` — 루트 코디네이터. `start()`에서 첫 화면 생성

## Naming Conventions

- ViewControllers: `[Feature]ViewController`
- ViewModels: `[Feature]ViewModel`
- Coordinators: `[Feature]Coordinator`
- Protocols: `-able` suffix (`ViewModelBindable`, `InputOutputAttachable`)
