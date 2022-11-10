//
//  MessageModel.swift
//  stickyHeader
//
//  Created by 1100690 on 2022/11/10.
//

import SwiftUI

struct MessageModel: Identifiable {
    let id: String = UUID().uuidString
    let message: String
    let name: String
    let color: Color
}

var allMessages: [MessageModel] = [
    MessageModel(message: "San Antonio Spurs signed guard Jordan Hall to a Rest-of-Season Contract.", name: "Spurs", color: .blue),
    MessageModel(message: "Detroit Pistons re-signed forward Bojan Bogdanovic to a Veteran Extension.", name: "Detroit", color: .red),
    MessageModel(message: "San Antonio Spurs waived guard Joshua Primo.", name: "Oklahoma", color: .yellow),
    MessageModel(message: "Toronto Raptors waived guard Saben Lee.", name: "Toronto", color: .gray),
    MessageModel(message: "Portland Trail Blazers re-signed forward Nassir Little to a Rookie Scale Extension.", name: "Clippers", color: .pink),
    MessageModel(message: "New Orleans Pelicans signed forward E.J. Liddell to a Two-Way Contract.", name: "Pelicans", color: .green),
    MessageModel(message: "Memphis Grizzlies re-signed forward Brandon Clarke to a Rookie Scale Extension.", name: "Memphis", color: .green),
    MessageModel(message: "San Antonio Spurs waived guard Joshua Primo.", name: "Oklahoma", color: .yellow),
    MessageModel(message: "Toronto Raptors waived guard Saben Lee.", name: "Toronto", color: .gray),
    MessageModel(message: "Portland Trail Blazers re-signed forward Nassir Little to a Rookie Scale Extension.", name: "Clippers", color: .pink),
    MessageModel(message: "Memphis Grizzlies re-signed forward Brandon Clarke to a Rookie Scale Extension.", name: "Memphis", color: .green),
    MessageModel(message: "San Antonio Spurs waived guard Joshua Primo.", name: "Oklahoma", color: .yellow),
    MessageModel(message: "Toronto Raptors waived guard Saben Lee.", name: "Toronto", color: .gray),
    MessageModel(message: "Detroit Pistons re-signed forward Bojan Bogdanovic to a Veteran Extension.", name: "Detroit", color: .red),
    MessageModel(message: "San Antonio Spurs waived guard Joshua Primo.", name: "Oklahoma", color: .yellow),
    MessageModel(message: "Toronto Raptors waived guard Saben Lee.", name: "Toronto", color: .gray),
]


