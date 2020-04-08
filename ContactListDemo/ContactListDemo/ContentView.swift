//
//  ContentView.swift
//  ContactListDemo
//
//  Created by Jagdish jangir on 05/04/20.
//  Copyright © 2020 Jagdish jangir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var fetch:ContactFetcher = ContactFetcher()
    
    var body: some View {
        NavigationView  {
            VStack {
                if fetch.contacts.isEmpty {
                    addFetchButton()
                }else{
                    showContacts()
                }
            }.navigationBarTitle("Contacts")
        }
    }
    
    func addFetchButton() -> some View {
        return Button(action: contactPressed){
            Text("Contacts")
                .font(.headline)
        }
        .frame(width:200,height:40)
        .background(Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .shadow(radius:5)
    }
    
    func showContacts() -> some View {
        return List {
            ForEach(fetch.contacts) { contact in
                ContactViewRow(contact:contact)
            }
        }
    }
    
    func contactPressed() {
        fetch.checkPermissionForContact(success: { (isGranted) in
            if isGranted {
                self.fetch.refreshContacts()
            }
        }) { (erro) in
            print(erro)
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
