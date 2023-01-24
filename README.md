# 인공지능 얼굴분석
인공지능 얼굴분석은 내 얼굴이 어떤 스타일인지 분석해주는 앱입니다.

# 기술스택 및 사용 라이브러리
- SwiftUI
- CoreML & CreateML
- Vision Framework
- KingFisher

# 시연 영상
![Simulator Screen Recording - iPhone 14 Pro - 2023-01-24 at 20 17 53](https://user-images.githubusercontent.com/64826110/214280299-28704b7d-a425-4760-bb00-824cd9857cac.gif)

# 구현할 때 어려웠던 것들
### 문제상황 
- CreateML로 만든 mlmodel 파일이 coreML 인스턴스를 가져오는 방법으로 가져올 수 없어 많이 헤맸습니다.

### 해결
- 해외 자료를 뒤지던 끝에 Vision Framework를 학습하여 createML로 만든 모델을 인스턴스로 가져올 수 있는 방법을 찾을 수 있었습니다.
- 거기에 추가적으로 응용하여 사람 얼굴만 인식할 수 있도록 VNDetectFaceRectanglesRequest를 학습하여 FaceDetector를 만들고 적용하였습니다.

# 프로젝트를 하며 느낀점 + 개선해나가야 할 부분
- 첫 개인 프로젝트라서 코드가 중구난방으로 정돈되지 않은 부분이 많고, 가독성 부분에서 정말 많이 부족하다고 느끼고 있습니다.
- 다음에는 아키텍처를 집중적으로 학습하여 정돈된 코드를 작성할 수 있도록 노력해나갈 예정입니다.
