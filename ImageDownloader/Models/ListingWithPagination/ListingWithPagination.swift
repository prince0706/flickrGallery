//
//  ListingWithPagination.swift
//  Geenie
//
//  Created by Sanjay Kumar Yadav on 20/12/17.
//  Copyright © 2017 Appster LLP. All rights reserved.
//

import UIKit

import Foundation
import ObjectMapper

public class ListingWithPagination<T> {
    var records: [T]?
    var pagination: Pagination?
}
