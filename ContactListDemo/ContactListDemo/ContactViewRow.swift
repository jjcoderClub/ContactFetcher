//
//  ContactViewRow.swift
//  ContactListDemo
//
//  Created by Jagdish jangir on 05/04/20.
//  Copyright © 2020 Jagdish jangir. All rights reserved.
//

import SwiftUI

struct ContactViewRow: View {
    
    
    let contact:Contact
    
    var body: some View {
        
        HStack(spacing:20) {
            
            Image(uiImage:getImage())
                .resizable()
                .frame(width:80,height: 80)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white,lineWidth:2))
                .shadow(radius:1)
            
            
            VStack(alignment:.leading) {
                Text(contact.name)
                    .font(.title)
                Text(contact.phoneNumber)
                    .foregroundColor(Color.gray)
            }
        }
    }
    
    
    func getImage() -> UIImage {
        if contact.image != nil {
            return UIImage(data:contact.image!)!
        }
        return UIImage(named:"dummyUser")!
    }
}

struct ContactViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactViewRow(contact:Contact(name:"Rahul", phoneNumber:"4234234"))
    }
}
