//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Mac on 16/03/2024.
//

import SwiftUI
import SwiftData
struct UsersView: View {
    @Query var users: [User]

    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    var body: some View {
        List(users) { user in
            NavigationLink(value: user) {
                HStack {
                    Text(user.name)
                    
                    Spacer()

                            Text(String(user.jobs.count))
                                .fontWeight(.black)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
                }
               
            }
        }
        .animation(.easeInOut, value: users)
    }
}


#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
