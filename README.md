# 진행 방법

- 카드게임에 대한 요구사항을 파악한다.
- 요구사항에 대한 구현을 완료한 후 자신의 github 아이디에 해당하는 브랜치에 Pull Request(이하 PR)를 통해 코드 리뷰 요청을 한다.
- 코드 리뷰 피드백에 대한 개선 작업을 하고 다시 PUSH한다.
- 모든 피드백을 완료하면 다음 단계를 도전하고 앞의 과정을 반복한다.



## 카드덱 구현

- 모든 종류의 카드 객체 인스턴스를 포함하는 카드덱 구조체를 구현한다.
- 객체지향 설계 방식에 맞도록 내부 속성을 모두 감추고 다음 인터페이스만 보이도록 구현한다.
  - count() 갖고 있는 카드 개수를 반환한다.
  - shuffle() 기능은 전체 카드를 랜덤하게 섞는다.
  - removeOne() 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
  - reset() 처음처럼 모든 카드를 다시 채워넣는다.


- 카드덱 기능을 확인할 수 있도록 메뉴를 만들기 위해 InputView를 구현한다.
- 사용자가 입력한 메뉴에 따라서 카드덱 구조체 함수를 호출하고 결과를 출력한다.



## 카드스택 출력

- 카드덱에 카드 여러 장을 한꺼번에 배열로 뽑아내는 메서드를 추가한다.
- 카드덱을 활용해서 다음 화면처럼 표시할 카드스택(쌓인 모양)을 출력하도록 수정한다.


- 카드덱에 새로 추가한 메서드를 활용해서 카드스택 출력을 담당할 객체를 구현한다.
  - 클래스 이름, 변수 이름, 메서드 이름을 어떤 기준으로 작성했는지 readme 문서에 작성한다.
- main에서 입력 기능을 잠시 제거하고, 바로 카드스택을 출력한다.
  - 일시적으로 기능을 제거할 때 어떤 방법이 좋은지 고민해본다.
  - 어떤 방식으로 기능을 제거했는지 주석을 남긴다.



```
클래스 
class Card = 카드모양과 숫자를 가지고 있는 객체
class CardDeck = 카드 기능 가지고 있는 객체
class CardStack = 카드 스텍을 가지고 있는 객체

구조체 
struct InputView = 메뉴 값을 입력 받는 객체
struct OutputView = 선택된 메뉴에 따라서 카드 결과를 출력하는 객체

변수 
suit = 카드의 모양 enum type 
rank = 카드의 계급 enum type 
cards = 기본적으로 set 된 52개의 카드들
pickCards = 선택된 카드들 

메서드
count() 갖고 있는 카드 개수를 반환한다.
shuffle() 기능은 전체 카드를 랜덤하게 섞는다.
removeOne() 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
reset() 처음처럼 모든 카드를 다시 채워넣는다.
printMenu() 처음 시작할때 메뉴 print
printReset() 카드 초기화 카드 개수 print
printShuffle() 셔플된 카드 개수 print
printRemoveOne(_ pickCard: Card) pick된 카드와 기본 카드 개수 print
printinValid() 1,2,3번 이외의 값이 입력되었을 경우 print
printCardStack(_ card:[[Card]] 카드 스택 print
```

