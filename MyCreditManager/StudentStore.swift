//
//  StudendManager.swift
//  MyCreditManager
//
//  Created by 홍수만 on 2023/04/27.
//

import Foundation

struct StudetStore {
    var studentList: [Student] = []
    
    mutating func addStudent(name: String) {
        if studentList.contains(where: {$0.name == name}) {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        } else {
            let newStudent: Student = Student(name: name)
            studentList.append(newStudent)
            print("\(name) 학생을 추가했습니다.")
        }
    }
    
    mutating func deleteStudent(name: String) {
        if let index = studentList.firstIndex(where: {$0.name == name}) {
            studentList.remove(at: index)
            print("\(name) 학생을 삭제하였습니다.")
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
    
    mutating func addGrade(name: String, subject: String, grade: String) {
        if let index = studentList.firstIndex(where: {$0.name == name}) {
            studentList[index].subjectAndGrade[subject] = grade
            print("\(name) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다")
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
    
    mutating func deletGrade(name: String, subject: String) {
        if let index = studentList.firstIndex(where: {$0.name == name}) {
            studentList[index].subjectAndGrade.removeValue(forKey: subject)
            print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
    
    mutating func average(name: String) {
        var sum: Float = 0.0
        var average: Float = 0.0
        
        if let index = studentList.firstIndex(where: {$0.name == name}) {
            studentList[index].subjectAndGrade.forEach {
                print("\($0): \($1)")
                sum += gradeToFloat(grade: $1)
            }
            average = sum / Float(studentList[index].subjectAndGrade.count)
            print("평점: \(String(format: "%.2f", average))")
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
        
        
    }
    
    mutating func gradeToFloat(grade: String) -> Float {
        if grade == "A+" {
            return 4.5
        } else if grade == "A" {
            return 4.0
        } else if grade == "B+" {
            return 3.5
        }else if grade == "B" {
            return 3.0
        }else if grade == "C+" {
            return 2.5
        }else if grade == "C" {
            return 2.0
        }else if grade == "D+" {
            return 1.5
        }else if grade == "D" {
            return 0.5
        }else if grade == "F" {
            return 0.0
        } else {
            return -1
        }
    }

}


