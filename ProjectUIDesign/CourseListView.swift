//
//  CourseListView.swift
//  ProjectUIDesign
//
//  Created by Penny Ahlstrom on 2026-03-03.
//

import SwiftUI

enum Route: Hashable {
    case course(Course)
    case detail(Course)
    case courseProgress(Progress)
}

struct CourseView: View {
    
    let courses = Course.sampleCourses
    @State private var path = NavigationPath() // Add navigation path variable
    
    var body: some View {
        NavigationStack(path: $path) { // use the path variable
            Text("Courses")
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical, 6)
            
            List(courses) { course in
                NavigationLink(value: Route.course(course)) {
                    VStack(alignment: .leading) {
                        Text(course.title).font(.headline)
                        Text(course.code).font(.subheadline).foregroundColor(.gray)
                        Text(course.instructor).font(.subheadline).foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("CourseDetails")
            .navigationDestination(for: Route.self) { route in
                            switch route {
                            case .detail(let course):
                                CourseDetailView(course: course, path: $path)
                            }
                        }
        }
    }
}
#Preview {
    ContentView()
}
