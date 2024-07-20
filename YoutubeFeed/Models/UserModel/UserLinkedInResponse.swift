//
//  UserLinkedInResponse.swift
//  YoutubeFeed
//
//  Created by Sopheamen VAN on 12/7/24.
//

import Foundation

struct UserLinkedInResponse: Hashable, Identifiable {
    let id: UUID
    let fullname: String
    let type: Int // assuming 1 is person, 2 is company
    let profileImage: String
    let imageCover: String
    let headLineBio: String
    let companyName: String
    let companyLocation: String?
    let gender: String?
    let totalFollowers: Int
}
