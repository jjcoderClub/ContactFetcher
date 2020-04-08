//
//  Contact.swift
//  ContactListDemo
//
//  Created by Jagdish jangir on 05/04/20.
//  Copyright © 2020 Jagdish jangir. All rights reserved.
//

import Foundation
import SwiftUI

struct Contact:Identifiable {
    
    var id = UUID()
   
    var name:String
    var phoneNumber:String
    var image:Data?
}
