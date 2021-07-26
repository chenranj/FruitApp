//
//  SettingView.swift
//  Fructus
//
//  Created by Chenran Jin on 7/3/21.
//

import SwiftUI

struct SettingView: View {
//    MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
//    MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
//                    MARK: - SECTION 1
                    GroupBox(label: SettingsLabelView(labelText: "Frucus", labelImage: "info.circle")) {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium, adn calories. None have cholesterol. Fruits are sources of many essential nutrients, include potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                    }
                    
//                    MARK: - SECTION 2
                    GroupBox(label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")) {
                        Divider().padding(.vertical, 4)
                        Text("If you wish, you can restart the application by toggle the seitch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("restarted".uppercased())
                                    .foregroundColor(Color.green)
                                    .fontWeight(.bold)
                            } else {
                                Text("restart".uppercased())
                                    .foregroundColor(Color.secondary)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding()
                        .background(Color(UIColor.tertiarySystemBackground)
                                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)))
                        
                        
                    }
                    
//                    MARK: - SECTION 3
                    GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")) {
                        SettingRowView(name: "Developer", content: "Chenran Jin")
                        SettingRowView(name: "Dsigner", content: "Robert Petras")
                        SettingRowView(name: "Website", linkLabel: "jinchenran.com", linkDestination: "https://jinchenran.com")
                        SettingRowView(name:"Compatibility",content: "iOS 14")
                        SettingRowView(name: "SwiftUI", content: "2.0")
                        SettingRowView(name: "Version", content: "1.1.0")
                    }
                    
                }
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                    trailing: Button(action:{
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                    })
                .padding()
            }
        }
    }
}

// MARK: - PREVIEW
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .preferredColorScheme(.dark)
    }
}
