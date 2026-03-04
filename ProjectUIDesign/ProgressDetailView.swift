//
//  ProgressDetailView.swift
//  ProjectUIDesign
//
//  Created by Penny Ahlstrom on 2026-03-03.
//

import SwiftUI

struct ProgressDetailView: View {
    let progress: Progress

    var body: some View {
        List {
            Section("Week") {
                DetailRow(label: "Week Of", value: progress.weekOf)
            }

            Section("Percent Points") {
                DetailRow(label: "Accumulated", value: progress.accumulatedPercentPoints.map { "\($0, default: "%.0f")" } ?? "—")
                DetailRow(label: "Used", value: progress.usedPercentPoints.map { "\($0, default: "%.0f")" } ?? "—")
                DetailRow(label: "Lost", value: progress.lostPercentPoints.map { "\($0, default: "%.0f")" } ?? "—")
                DetailRow(label: "Max Possible", value: progress.maxPossiblePercent.map { "\($0, default: "%.0f")" } ?? "—")
            }

            Section("Status") {
                DetailRow(label: "Current Grade", value: progress.currentGradePercent.map { "\($0, default: "%.0f")%" } ?? "—")
                DetailRow(label: "Can Meet Goal", value: progress.canMeetGoal.map { $0 ? "Yes" : "No" } ?? "—")
            }
        }
        .navigationTitle("Progress")
    }
}

#Preview {
    NavigationStack { ProgressDetailView(progress: Progress.sampleProgresses[0]) }
}
