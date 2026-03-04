//
//  TaskDetailView.swift
//  ProjectUIDesign
//
//  Created by Penny Ahlstrom on 2026-03-03.
//

//import SwiftUI
//
//struct TaskDetailView: View {
//    let task: Task
//
//    var body: some View {
//        List {
//            Section("Task") {
//                DetailRow(label: "Title", value: task.title)
//                DetailRow(label: "Type", value: task.type)
//                DetailRow(label: "Due Date", value: task.dueDate)
//            }
//
//            Section("Status") {
//                DetailRow(label: "Completed", value: task.isCompleted ? "Yes" : "No")
//                DetailRow(label: "Priority", value: task.isPriority ? "Yes" : "No")
//                DetailRow(label: "Bonus", value: task.isBonus ? "Yes" : "No")
//            }
//
//            Section("Grading") {
//                DetailRow(label: "Weight", value: "\(task.weight, default: "%.1f")%")
//                DetailRow(label: "Score", value: "\(task.scorePercent, default: "%.0f")%")
//            }
//        }
//        .navigationTitle("Task")
//    }
//}

import SwiftUI

struct TaskDetailView: View {
    @EnvironmentObject var store: AppStore
    let taskID: UUID

    @State private var showEdit = false
    @State private var showDeleteConfirm = false

    private var task: Task? { store.tasks.first { $0.id == taskID } }

    var body: some View {
        Group {
            if let task {
                List {
                    Section("Task") {
                        DetailRow(label: "Title", value: task.title)
                        DetailRow(label: "Type", value: task.type)
                        DetailRow(label: "Due Date", value: task.dueDate)
                    }

                    Section("Status") {
                        DetailRow(label: "Completed", value: task.isCompleted ? "Yes" : "No")
                        DetailRow(label: "Priority", value: task.isPriority ? "Yes" : "No")
                        DetailRow(label: "Bonus", value: task.isBonus ? "Yes" : "No")
                    }

                    Section("Grading") {
                        DetailRow(label: "Weight", value: "\(task.weight, default: "%.1f")%")
                        DetailRow(label: "Score", value: "\(task.scorePercent, default: "%.0f")%")
                    }
                }
                .navigationTitle("Task")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Edit") { showEdit = true }
                }
                .sheet(isPresented: $showEdit) {
                    TaskEditView(task: task)
                        .environmentObject(store)
                }
                .safeAreaInset(edge: .bottom) {
                    Button(role: .destructive) {
                        showDeleteConfirm = true
                    } label: {
                        Text("Delete Task").frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    .confirmationDialog("Delete this task?", isPresented: $showDeleteConfirm) {
                        Button("Delete", role: .destructive) {
                            store.deleteTask(id: task.id)
                        }
                    }
                }
            } else {
                Text("Task not found.")
                    .foregroundColor(.secondary)
                    .navigationTitle("Task")
            }
        }
    }
}

//#Preview {
//    NavigationStack { TaskDetailView(task: Task.sampleTasks[0]) }
//}

#Preview {
    let store = AppStore()
    return NavigationStack {
        TaskDetailView(taskID: store.tasks.first!.id)
    }
    .environmentObject(store)
}

