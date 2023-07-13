//
//  CustomSwiftUICell.swift
//  WhatsNewInUIKit
//
//  Created by Ferhan Akkan on 10.06.2022.
//

import SwiftUI

struct CustomSwiftUICell: View {

    let contentData: ContentData

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: contentData.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
                .frame(
                    minWidth: .leastNormalMagnitude,
                    maxWidth: 40,
                    minHeight: 40,
                    maxHeight: .infinity,
                    alignment: .center
                )
                .clipped()
            VStack(spacing: 10) {
                Group {
                    Text(contentData.title)
                        .font(.system(size: 20))
                    Text(contentData.description)
                        .font(.system(size: 16))
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading
                  )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}
