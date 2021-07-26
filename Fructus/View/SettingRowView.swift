//
//  SettingRowView.swift
//  Fructus
//
//  Created by Chenran Jin on 7/4/21.
//

import SwiftUI

struct SettingRowView: View {
//    MARK: - PROPERTIES
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name).foregroundColor(Color.gray)
                Spacer()
                if(content != nil) {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: linkDestination!)!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                }
            }
        }
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingRowView(name: "Developer", content: "Chenran Jin")
                .previewLayout(.fixed(width: 375, height: 60))
            .padding()
            SettingRowView(name: "Website", linkLabel: "jinchenran.com", linkDestination: "jinchenran.com")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
