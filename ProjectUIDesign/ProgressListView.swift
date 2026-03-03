//
//  ProgressListView.swift
//  ProjectUIDesign
//
//  Created by Penny Ahlstrom on 2026-03-03.
//

import SwiftUI

struct ProgressListView: View {
    let progresses: [Progress]

    var body: some View {
        List(progresses) { progress in
            VStack(alignment: .leading, spacing: 6) {
                Text("Week Of: \(progress.weekOf)")
                    .font(.headline)

                if let grade = progress.currentGradePercent {
                    Text("Current Grade: \(grade, specifier: "%.0f")%")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                HStack(spacing: 12) {
                    if let acc = progress.accumulatedPercentPoints {
                        Text("Accum: \(acc, specifier: "%.0f")")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    if let used = progress.usedPercentPoints {
                        Text("Used: \(used, specifier: "%.0f")")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    if let lost = progress.lostPercentPoints {
                        Text("Lost: \(lost, specifier: "%.0f")")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }

                if let canMeet = progress.canMeetGoal {
                    Text(canMeet ? "On track to meet goal" : "At risk of missing goal")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 6)
        }
        .navigationTitle("Progress")
    }
}

#Preview {
    NavigationStack {
        ProgressListView(progresses: Progress.sampleProgresses)
    }
}
