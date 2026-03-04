//
//  AppStore.swift
//  ProjectUIDesign
//
//  Created by Penny Ahlstrom on 2026-03-03.
//

import Foundation
import Combine

final class AppStore: ObservableObject {

    @Published var courses: [Course] = []
    @Published var tasks: [Task] = []
    @Published var reminders: [Reminder] = []
    @Published var progresses: [Progress] = []

    init() {
        // start with sample data
        courses = Course.sampleCourses
        tasks = Task.sampleTasks
        reminders = Reminder.sampleReminders
        progresses = Progress.sampleProgresses
    }

    // MARK: - Courses
    func addCourse(code: String, title: String, instructor: String, gradeGoal: Int?, startWeek: Date?) {
        let new = Course(code: code, title: title, instructor: instructor, gradeGoal: gradeGoal, startWeek: startWeek)
        courses.append(new)
    }

    func updateCourse(_ updated: Course) {
        guard let idx = courses.firstIndex(where: { $0.id == updated.id }) else { return }
        courses[idx] = updated
    }

    func deleteCourse(id: UUID) {
        courses.removeAll { $0.id == id }
    }

    // MARK: - Tasks
    func updateTask(_ updated: Task) {
        guard let idx = tasks.firstIndex(where: { $0.id == updated.id }) else { return }
        tasks[idx] = updated
    }

    func deleteTask(id: UUID) {
        tasks.removeAll { $0.id == id }
    }

    // MARK: - Reminders
    func updateReminder(_ updated: Reminder) {
        guard let idx = reminders.firstIndex(where: { $0.id == updated.id }) else { return }
        reminders[idx] = updated
    }

    func deleteReminder(id: UUID) {
        reminders.removeAll { $0.id == id }
    }

    // MARK: - Progress
    func updateProgress(_ updated: Progress) {
        guard let idx = progresses.firstIndex(where: { $0.id == updated.id }) else { return }
        progresses[idx] = updated
    }

    func deleteProgress(id: UUID) {
        progresses.removeAll { $0.id == id }
    }
}
