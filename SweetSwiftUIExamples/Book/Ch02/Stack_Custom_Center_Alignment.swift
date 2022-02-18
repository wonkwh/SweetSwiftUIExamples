//
//  Stack_Custom_Center_Alignment.swift
//  SweetSwiftUIExamples
//
//  Created by kwanghyun won on 2022/02/18.
//  Copyright © 2022 Giftbot. All rights reserved.
//
// https://useyourloaf.com/blog/swiftui-stack-custom-center-alignment/
//
import SwiftUI

struct Stack_Custom_Center_Alignment: View {
  var body: some View {
    Example03()
  }
}

private extension Stack_Custom_Center_Alignment {
  // MARK: Example 01
  
  /// 현재 시간을 커스텀 폰트로 업데이트하여 보여준다.
  struct Example01: View {
    @State private var counter = Date()
    
    var body: some View {
      // leading alignment로 보여준다.
      VStack(alignment: .leading) {
        Text("Timer")
          .font(.title)
        
        HStack(spacing: 16) {
          if #available(iOS 15.0, *) {
            Text(counter.formatted(.iso8601.time(includingFractionalSeconds: true)))
              .font(Font.system(.body, design: .monospaced))
            Button(role: .destructive) {
              counter = Date()
            } label: {
              Image(systemName: "gobackward")
                .imageScale(.large)
            }
            .buttonStyle(.borderedProminent)

          } else {
            // Fallback on earlier versions
          }
          
        }
      }
    }
  }
  
  /// Timer text 를 버튼을 제외하고 Center에 보여주려면
  struct Example02: View {
    @State private var counter = Date()
    

    var body: some View {
      
      HStack(alignment: .bottom,  spacing: 16) {
        VStack(spacing: 16) {
          Text("Timer")
            .font(.title)
          if #available(iOS 15.0, *) {
            Text(counter.formatted(.iso8601.time(includingFractionalSeconds: true)))
              .font(Font.system(.body, design: .monospaced))
          } else {
            // Fallback on earlier versions
          }
        }
        
        if #available(iOS 15.0, *) {
          Button(role: .destructive) {
            counter = Date()
          } label: {
            Image(systemName: "gobackward")
              .imageScale(.large)
          }
          .buttonStyle(.borderedProminent)
        } else {
          // Fallback on earlier versions
        }
      }
    }
  }
  
  // MARK: Example 03
  
  /// alignment를 이용해 뷰의 위치를 결정할 수 있습니다.
  struct Example03: View {
    @State private var counter = Date()
    
    var body: some View {
      // custom center modifier를 이용한 방법
      VStack(alignment: .customCenter) {
        Text("Timer")
          .font(.title)
        
        HStack(spacing: 16) {
          if #available(iOS 15.0, *) {
            Text(counter.formatted(.iso8601.time(includingFractionalSeconds: true)))
              .font(Font.system(.body, design: .monospaced))
              .alignmentGuide(.customCenter) {
                $0[HorizontalAlignment.center]
              }
            Button(role: .destructive) {
              counter = Date()
            } label: {
              Image(systemName: "gobackward")
                .imageScale(.large)
            }
            .buttonStyle(.borderedProminent)

          } else {
            // Fallback on earlier versions
          }
          
        }
      }
    }
  }
}

struct CustomCenter: AlignmentID {
  static func defaultValue(in context: ViewDimensions) -> CGFloat {
    context[HorizontalAlignment.center]
  }
}

extension HorizontalAlignment {
  static let customCenter: HorizontalAlignment = .init(CustomCenter.self)
}

// MARK: - Previews

struct Stack_Custom_Center_Alignment_Previews: PreviewProvider {
  static var previews: some View {
    Stack_Custom_Center_Alignment()
      .previewDisplayName("Sweet SwiftUI")
  }
}
