//
//  CourseListView.swift
//  ProjectUIDesign
//
//  Created by Penny Ahlstrom on 2026-03-03.
//

import SwiftUI

struct CourseListView: View {
    //let courses: [Course]
    @EnvironmentObject var store: AppStore


    var body: some View {
        //List(courses) { course in
        List(store.courses) { course in // ADD
            NavigationLink {
                //CourseDetailView(course: course)
                CourseDetailView(courseID: course.id)
            } label: {
                VStack(alignment: .leading, spacing: 4) {
                    Text(course.code)
                        .font(.headline)
                    
                    Text(course.title)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("Instructor: \(course.instructor)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                }
                .padding(.vertical, 6)
            }
        }
        .navigationTitle("Courses")
    }
}

//#Preview {
//    NavigationStack {
//        CourseListView(courses: Course.sampleCourses)
//    }
//}

#Preview {
    NavigationStack {
        CourseListView()
    }
    .environmentObject(AppStore())
}
