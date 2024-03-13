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
 */
