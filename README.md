# 프로젝트 개요

본 프로젝트의 주된 목적은 사용자에게 효율적이고 간편한 영화 예매 경험을 제공하는 웹 페이지를 구축하는 것입니다. 이 예매 페이지는 사용자가 빠르고 쉽게 영화를 예매할 수 있도록 디자인 및 설계되었습니다.

# 프로젝트 인원

• 3명

# 사용된 언어 및 기술

![JAVA](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white)
![MTSQL](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)

#  코드 통합 및 관리 
![GIT](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)

• 개인 브랜치에서 작업 후 메인 브랜치로 병합하는 Git 플로우를 사용


# 제작 동기 및 목적

• 핵심 가치: 사용자 편의성 강화 및 예매 절차의 최적화

• 비즈니스적 영향: 사용자 만족도 및 예매율 증가로 이어지는 수익성 향상

• 사용자 및 사용 환경: 영화 애호가 및 일반 대중들이 쉽게 영화를 예매 할 수 있는 기능 및 인터페이스 제공

• 일반적인 예매의 불편함: 사용자 인터페이스의 복잡성과 예매 절차의 불편함

• 새로운 시스템의 차별점: 직관적인 사용자 인터페이스 및 간편하고 빠른 예매

# 주요 기능 및 개발 내용

• 페이지 로드맵 및 디자인: 초기 단계에서 Figma를 사용하여 전체 페이지의 로드맵과 디자인 가이드라인을 설정

![KakaoTalk_20240502_165814481](https://github.com/kimjonghui/MovieReservation-Webproject-/assets/154950232/6bab8079-d43e-41af-8b21-ebdfb0cb0c00)

• API 연동 및 데이터베이스 설계: 외부 영화 데이터 API와 연동하여 필요한 영화 정보를 가져오고, 이를 기반으로 한 데이터베이스 설계 및 구축을 진행

![KakaoTalk_20240502_170037829](https://github.com/kimjonghui/MovieReservation-Webproject-/assets/154950232/3cdb5a6a-9992-46d8-a910-bae29b569515)

• 페이지 개발 분담: 팀원들과의 역할 배분을 통해 각자 페이지 개발 분담. 영화 소개 페이지, 상세 정보 페이지, 예매 페이지를 담당

• 사용자 친화적인 UI 제공: 사용자에게 매끄럽고 자연스러운 화면을 제공하기 위해 한 화면에 소수의 영화 포스트와 영화의 정보가 한눈에 보이게 하였으며, 페이지 스크롤을 이용하여 휠을 한번 움직일 때마다 영화의 정보가 바뀌어 사용성을 높임

https://github.com/kimjonghui/MovieReservation-Webproject-/assets/154950232/946da02f-9fd6-4591-ac7e-37ce94f2618f

• 간편한 예매방식 제공: 일반 예매만이 아닌 주변 예매 기능을 구현하여 자신의 위치의를 기반으로 당일 영화관에서 상영하는 모든 영화를 시간대별로 보여주어 선택할 시 좌석 선택과 예매 결제로 이어져 간편한 예매 방식을 제공

https://github.com/kimjonghui/MovieReservation-Webproject-/assets/154950232/a40aab97-3017-4db0-9e2b-700ca4b4e242

# 기술적 도전과 해결책

• 정보 전달: 예매를 진행하면서 선택한 영화의 정보와 시간, 좌석 등의 정보를 전달하기 위해 팀원들과 고민한 결과 URL 파라미터에 값을 전달하는 방식으로 구현

• 정보 조회 및 처리: 예매 시스템을 위해 구현한, 다수의 데이터베이스 테이블을 효율적인 정보 조회를 위해 비정규화를 시도함

• 아쉬웠던 점: URL 파라미터에 값을 모두 전달하다 보니 사용자가 직접 파라미터에 값을 입력하여 조작이 가능하고 의도하지 않은 페이지 흐름 발생, 시간적 문제로 주변예매의 영화선택창이 미완성됨

• 향후 계획: 위의 서술했던 파라미터 값에 대한 입력을 보완하여 보안성을 확보해야 함. 차후 파라미터로 직접적인 정보 전달이 아닌 세션을 이용하여 보안성을 더욱 높일 예정, 차후 주변예매의 영화선택창을 완성해야함
