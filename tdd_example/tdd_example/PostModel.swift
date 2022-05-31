//
//  PostModel.swift
//  tdd_example
//
//  Created by 최민한 on 2022/06/01.
//

import Foundation

struct Post: Decodable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}
