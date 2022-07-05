//
//  LoadingView.swift
//  TestPod01
//
//  Created by Sumetha on 5/7/22.
//

import SwiftUI

public struct LoadingView: View {
    public var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(1.5)
                .padding(.top, 20)
            Spacer()
            Text("Loading...")
                .font(
                    .system(size: 17, weight: .medium)
                )
                .foregroundColor(.white)
        }
        .padding(10)
        .frame(width: 160, height: 160, alignment: .center)
        .background(
            Color.black.opacity(0.67)
        )
        .cornerRadius(20)
    }
}

public extension View {
    func showLoading(isPresented : Bool) -> some View {
        Group {
            if isPresented {
                ZStack {
                    self
                    LoadingView()
                }
            } else {
                self
            }
        }
    }
}


struct LoadingView_Previews: PreviewProvider {
    struct SampleView : View {
        @State var isPresented = false
        var body: some View {
            VStack {
                Spacer()
                Text("Some text...")
                    .frame(maxWidth: .infinity)
                Button {
                    isPresented = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isPresented = false
                    }
                } label: {
                    Text("Submit")
                }
                Spacer()
            }
            .showLoading(isPresented: isPresented)
        }
    }
    static var previews: some View {
        SampleView()
    }
}
