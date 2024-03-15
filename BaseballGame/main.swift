//
//  main.swift
//  BaseballGame
//
//  Created by imhs on 3/13/24.
//

import Foundation

/**
 Lv1
- 1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임
- 정답은 랜덤으로 만듭니다. 1에서 9까지의 서로 다른 임의의 수 3자리
*/
//class Random {
//    func randomNumber(randomNumberCount cnt: Int) -> [Int] {
//        //1. 배열에 범위만큼의 숫자 할당
//        var arrNumber: [Int] = Array(1...9)
//        var arrRandomNumber: [Int] = []
//        
//        //임의 개수만큼 반복
//        for _ in 1...cnt {
//            //2. 배열 범위에서 랜덤 숫자 인덱스 할당
//            var index: Int = Int.random(in: 0...arrNumber.count - 1)
//            //3. 할당된 숫자를 새로운 배열에 저장
//            arrRandomNumber.append(arrNumber[index])
//            //4. 할당된 숫자의 Index를 제거
//            arrNumber.remove(at: index)
//        }
//        return arrRandomNumber
//    }
//}
////정답 확인
//func answerCheck(comArr comArrNum: [Int], myArr myArrNum: [Int]) -> String {
//    //맞춘 개수 확인
//    for i in 0...myArrNum.count - 1 {
//        if myArrNum[i] == comArrNum[i] {
//            rightCnt += 1
//        }
//    }
//
//    return rightCnt == 3 ? "정답입니다." : "틀렸습니다! (\(rightCnt)개 맞췄습니다.)"
//}
//
//var comRandom: Random = Random()
//var comArrNum: [Int] = comRandom.randomNumber(randomNumberCount: 3).sorted()
//var myRandom: Random = Random()
//var myArrNum: [Int] = myRandom.randomNumber(randomNumberCount: 3).sorted()
//var result: String = ""
//var rightCnt: Int = 0
//
//print("컴퓨터 선택: \(comArrNum)")
//print("내 선택: \(myArrNum)")
//print(answerCheck(comArr: comArrNum, myArr: myArrNum))

/**
 Lv2
 - 정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다
 - 힌트는 야구용어인 볼과 스트라이크입니다.
 - 같은 자리에 같은 숫자가 있는 경우 스트라이크, 다른 자리에 숫자가 있는 경우 볼입니다
 - ex) 정답 : 456 인 경우
     - 435를 입력한 경우 → 1스트라이크 1볼
     - 357를 입력한 경우 → 1스트라이크
     - 678를 입력한 경우 → 1볼
     - 123를 입력한 경우 → Nothing
 - ex) 정답 : 456 인 경우
     - 435를 입력한 경우 → 1스트라이크 1볼
     - 357를 입력한 경우 → 1스트라이크
     - 678를 입력한 경우 → 1볼
     - 123를 입력한 경우 → Nothing
 - 만약 올바르지 않은 입력값에 대해서는 오류 문구를 보여주세요
 - 3자리 숫자가 정답과 같은 경우 게임이 종료됩니다
 
 실행 예시(정답 : 456)
 < 게임을 시작합니다 >
 숫자를 입력하세요
 435
 1스트라이크 1볼

 숫자를 입력하세요
 357
 1스트라이크

 숫자를 입력하세요
 123
 Nothing

 숫자를 입력하세요
 dfg // 세 자리 숫자가 아니어서 올바르지 않은 입력값
 올바르지 않은 입력값입니다

 숫자를 입력하세요
 199 // 9가 두번 사용되어 올바르지 않은 입력값
 올바르지 않은 입력값입니다

 숫자를 입력하세요
 103 // 0이 사용되어 올바르지 않은 입력값
 올바르지 않은 입력값입니다

 숫자를 입력하세요
 456
 정답입니다!
 
 Lv3
 정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자로 바꿔주세요
 맨 앞자리에 0이 오는 것은 불가능합니다
 - 092 → 불가능
 - 870 → 가능
 - 300 → 불가능
 
 Lv4
 프로그램을 시작할 때 안내문구를 보여주세요
 // 예시
 환영합니다! 원하시는 번호를 입력해주세요
 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
 
 // 예시
 환영합니다! 원하시는 번호를 입력해주세요
 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
 1 // 1번 게임 시작하기 입력

 < 게임을 시작합니다 >
 숫자를 입력하세요
 .
 .
 .
 
 Lv5
 // 예시
 환영합니다! 원하시는 번호를 입력해주세요
 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
 2 // 2번 게임 기록 보기 입력

 < 게임 기록 보기 >
 1번째 게임 : 시도 횟수 - 14
 2번째 게임 : 시도 횟수 - 9
 3번째 게임 : 시도 횟수 - 12
 .
 .
 .
 
 Lv6
 3번 종료하기의 경우 프로그램이 종료됩니다
 이전의 게임 기록들도 초기화됩니다
 // 예시
 환영합니다! 원하시는 번호를 입력해주세요
 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
 3 // 3번 종료하기 입력
 
 1, 2, 3 이외의 입력값에 대해서는 오류 메시지를 보여주세요
 // 예시
 환영합니다! 원하시는 번호를 입력해주세요
 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
 4

 올바른 숫자를 입력해주세요!
 
 < 숫자 야구 게임을 종료합니다 >
 */
class BaseballGame {
    var comNum: String = "" //컴퓨터 랜덤 값
    var strike: Int = 0     //스트라이크 개수
    var ball: Int = 0       //볼 개수
    var flag: Bool = false  //게임 정답 유무 확인
    
    var inputCnt: Int = 0   //입력횟수
    
    init() {
        print("< 게임을 시작합니다. >")
        self.comNum = randomNum()   //컴퓨터 기본 값 셋팅
    }
    
    //컴퓨터 초기 값 셋팅
    func randomNum() -> String {
        var index: Int = 0
        var ranNum: String = ""
        var arr: [Int] = Array(0...9)
        
        for i in 0...2 {
            repeat {
                index = Int.random(in: 0...arr.count - 1)
            } while(i == 0 && index == 0) //index가 0(첫번째 숫자가 0)이면 다른 숫자가 나올때까지 반복
            ranNum += String(arr[index])
            arr.remove(at: index)
        }
        
        return ranNum
    }
    
    //입력 값 받아오기
    func inputData() -> String {
        self.inputCnt += 1
        print("-------------------------------")
        print("숫자를 입력하세요")
        if let inputData = readLine() {
            return inputData
        } else {
            return ""
        }
    }
    
    //데이터 체크
    func inputDataValidation(_ inputData: String) -> Bool {
        if inputData.count != 3 {
            print("올바르지 않은 입력값입니다. (3자리 입력)")
            return false
        } else {
            //숫자/문자 체크
            if let number = Int(inputData) {
                //숫자 중복값 체크
                if Set(String(number)).count == 3 {
                    return true
                } else {
                    print("올바르지 않은 입력값입니다. (중복 값)")
                    return false
                }
            } else {
                print("올바르지 않은 입력값입니다. (문자 포함)")
                return false
            }
        }
    }
    
    func gameStart(_ myNum: String) {
        //print("내입력값: \(myNum), 컴터입력값: \(comNum)")
        let myNumArr: [String] = myNum.map { String($0) }
        let comNumArr: [String] = comNum.map { String($0) }

        for i in 0...myNumArr.count - 1 {
            //숫자가 일치하면 스트라이크
            for j in 0...myNumArr.count - 1 {
                //print("i: \(i), j: \(j), comNumArr[\(i)]: \(comNumArr[i]), myNumArr[\(j)]: \(myNumArr[j])")

                //index와 값이 일치하면 스트라이크
                if (i == j) && (comNumArr[i] == myNumArr[j]) {
                    strike += 1
                    //값이 일치하지만 index가 다르면 ball
                } else if (i != j) && (comNumArr[i] == myNumArr[j]) {
                    ball += 1
                }
            }
        }
    }
    
    //결과 확인
    func gameResult() -> Bool {
        if strike == 3 {
            print("정답입니다!!!!!!!!!!!!!!!!!!!!!!!!")
            print("-------------------------------")
            return true
        } else if strike == 0 && ball == 0 {
            print("Nothing")
            return false
        } else {
            print("\(self.strike) 스트라이크, \(self.ball) 볼")
            return false
        }
    }
    
    func recordClear() {
        self.strike = 0
        self.ball = 0
    }
}

class GameRecord {
    var gameRecordDictionary = [Int:Int]()
}

//게임 횟수 저장
let gameRecord: GameRecord = GameRecord()

while true {
    print("환영합니다! 원하시는 번호를 입력해주세요.")
    print("1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
    if let inputData = readLine() {
        if let number = Int(inputData) {
            switch number {
            case 1:
                //컴퓨터 숫자 초기화
                let baseballGame: BaseballGame = BaseballGame()
                
                //print("컴터 선택 값: \(baseballGame.num)")
                repeat {
                    let myNum = baseballGame.inputData() //내 입력 숫자
                
                    //입력값 체크
                    if baseballGame.inputDataValidation(myNum) {
                        //게임 시작
                        baseballGame.gameStart(myNum)
                        //결과보기
                        baseballGame.flag = baseballGame.gameResult()
                        
                        if baseballGame.flag {
                            //정답시 게임 기록
                            if gameRecord.gameRecordDictionary.keys.isEmpty {
                                gameRecord.gameRecordDictionary[1] = baseballGame.inputCnt
                            } else {
                                gameRecord.gameRecordDictionary[gameRecord.gameRecordDictionary.keys.max()! + 1] = baseballGame.inputCnt
                            }
                            baseballGame.inputCnt = 0   //입력 횟수 초기화
                        } else {
                            //오답 시 초기화
                            baseballGame.recordClear()
                        }
                    }
                } while (baseballGame.flag != true) //true가 될때까지 반복
                
                break
            case 2:
                print("----------------------------------")
                print("게임 기록 보기")
                if(gameRecord.gameRecordDictionary.count == 0) {
                    print("진행한 게임이 없습니다.")
                } else {
                    for i in gameRecord.gameRecordDictionary.keys.sorted() {
                        print("\(i)번째 게임 : 시도 횟수 - \(gameRecord.gameRecordDictionary[i]!)")
                    }
                }
                print("----------------------------------")
                break
            case 3:
                print("<숫자 야구 게임을 종료합니다.>")
                exit(0)
            default:
                print("올바른 숫자를 입력해주세요!")
            }
        } else {
            print("올바른 숫자를 입력해주세요!")
        }
    }
}
