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
 */
class BaseballGame {
    var num: Int
    
    init() {
        num = 0             //num 초기화 없이 randomNum 호출 시 에러
        gameStart()         //게임시작
        num = randomNum()   //컴퓨터 기본 값 셋팅
    }
    
    func gameStart() {
        print("< 게임을 시작합니다. >")
    }
    
    //컴퓨터 초기 값 셋팅
    func randomNum() -> Int {
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
        
        return Int(ranNum)!
    }
}

//컴퓨터 숫자 초기화
let baseballGame: BaseballGame = BaseballGame()
//print("컴터 선택 값: \(baseballGame.num)")
var myNum: Int = 0 // 내 선택 값

repeat {
    print("-----------------------")
    print("숫자를 입력하세요.")
    if let inputData = readLine() {
        //길이 체크
        if inputData.count != 3 {
            print("올바르지 않은 입력값입니다. (3자리 입력)")
        } else {
            //문자 체크
            if let number = Int(inputData) {
                myNum = number
                
                //print("숫자만 입력받았습니다. ")
                //중복 체크
                if Set(inputData).count == 3 {
                    //중복된 값이 없을때 체크
                    var comNumArr: [String] = []
                    var myNumArr: [String] = []
                    var strike: Int = 0
                    var ball: Int = 0
                    
                    for i in String(baseballGame.num) {
                        comNumArr.append(String(i))
                    }
                    for i in inputData {
                        myNumArr.append(String(i))
                    }
                    
                    for i in 0...inputData.count - 1 {
                        //숫자가 일치하면 스트라이크
                        for j in 0...inputData.count - 1 {
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
                    
                    print("\(strike) 스트라이크, \(ball) 볼")
                    
                    if strike == 3 {
                        print("정답입니다.")
                    } else if strike == 0 && ball == 0 {
                        print("Nothing")
                    }
                    
                } else {
                    print("올바르지 않은 입력값입니다. (중복 값)")
                }
            } else {
                print("올바르지 않은 입력값입니다. (문자 포함)")
            }
        }
    }
} while (baseballGame.num != myNum) //정답 맞출때까지 반복

