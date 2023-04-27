//
//  main.swift
//  MyCreditManager
//
//  Created by 홍수만 on 2023/04/24.
//

import Foundation
start()

func start() {
    var run: Bool = true
    var studentStore = StudetStore()

    while run {
        print("원하는 기능을 입력해주세요.")
        print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
        
        if let input = readLine() {
            switch input {
            case "1":
                print("추가할 학생의 이름을 입력해주세요")
                if let name = readLine() {
                    if name.isEmpty || !checkRule(string: name){
                        print("입력이 잘못되었습니다. 다시 확인해주세요.")
                    } else {
                        studentStore.addStudent(name: name)
                    }
                }
            case "2":
                print("삭제할 학생의 이름을 입력해주세요")
                if let name = readLine() {
                    if name.isEmpty || !checkRule(string: name){
                        print("입력이 잘못되었습니다. 다시 확인해주세요.")
                    } else {
                        studentStore.deleteStudent(name: name)
                    }
                }
                
            case "3":
                print("성적을 추가할 학생의 이름, 과목 이름, 성정(A+, A, F 등)을 띄어쓰기로 구분하여 차례롤 작성해주세요")
                print("입력예) Mickey Swift A+")
                print("만약에 학생의 성적 중 해당 과목이 존재하며 기존 점수가 갱신됩니다.")
                if let input = readLine() {
                    let studentInfo = input.components(separatedBy: " ")
                    
                    if studentInfo.count == 3 && studentStore.gradeToFloat(grade: studentInfo[2]) != -1 && checkRule(string: studentInfo[0]){
                        let name = studentInfo[0]
                        let subject = studentInfo[1]
                        let grade = studentInfo[2]
                        
                        studentStore.addGrade(name: name, subject: subject, grade: grade)
                    } else {
                        print("입력이 잘못되었습니다. 다시 확인해주세요.")
                    }
                }
                
            case "4":
                print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요")
                print("입력예) Mickey Swift")
                if let input = readLine() {
                    let studentInfo = input.components(separatedBy: " ")
                    
                    if studentInfo.count == 2 && checkRule(string: studentInfo[0]){
                        let name = studentInfo[0]
                        let subject = studentInfo[1]
                        
                        studentStore.deletGrade(name: name, subject: subject)
                    } else {
                        print("입력이 잘못되었습니다. 다시 확인해주세요.")
                    }
                }
                
            case "5":
                print("평점을 알고싶은 학생의 이름을 입력해세요")
                if let name = readLine() {
                    if name.isEmpty || !checkRule(string: name){
                        print("입력이 잘못되었습니다. 다시 확인해주세요.")
                    } else {
                        studentStore.average(name: name)
                    }
                }
                
            case "X":
                print("프로그램을 종료합니다...")
                return run = false
                
            default:
                print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
            }
        }
    }
}

func checkRule(string: String) -> Bool {
    let nicknameRegex = "^[0-9a-zA-Z]*$"
    return  NSPredicate(format: "SELF MATCHES %@", nicknameRegex).evaluate(with: string)
}

