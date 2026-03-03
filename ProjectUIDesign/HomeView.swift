//
//  HomeView.swift
//  ProjectUIDesign
//
//  Created by Penny Ahlstrom on 2026-03-03.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        CourseListView(courses: Course.sampleCourses)
                    } label: {
                        Label("Courses", systemImage: "book.closed")
                    }

                    NavigationLink {
                        TaskListPlaceholderView()
                    } label: {
                        Label("Tasks", systemImage: "checklist")
                    }

                    NavigationLink {
                        ReminderListPlaceholderView()
                    } label: {
                        Label("Reminders", systemImage: "bell")
                    }

                    NavigationLink {
                        ProgressPlaceholderView()
                    } label: {
                        Label("Progress", systemImage: "chart.line.uptrend.xyaxis")
                    }
                }
            }
            .navigationTitle("ClassMate")
        }
    }
}

#Preview {
    HomeView()
}
