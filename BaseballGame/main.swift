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

class Random {
    func randomNumber(randomNumberCount cnt: Int) -> [Int] {
        //1. 배열에 범위만큼의 숫자 할당
        var arrNumber: [Int] = Array(1...9)
        var arrRandomNumber: [Int] = []
        
        //임의 개수만큼 반복
        for _ in 1...cnt {
            //2. 배열 범위에서 랜덤 숫자 인덱스 할당
            var index: Int = Int.random(in: 0...arrNumber.count - 1)
            //3. 할당된 숫자를 새로운 배열에 저장
            arrRandomNumber.append(arrNumber[index])
            //4. 할당된 숫자의 Index를 제거
            arrNumber.remove(at: index)
        }
        return arrRandomNumber
    }
}
var random: Random = Random()
print(random.randomNumber(randomNumberCount: 3))
//print("임의의 수 3가지를 입력하세요. ex) 1 2 3")



