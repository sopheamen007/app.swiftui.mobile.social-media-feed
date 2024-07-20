//
//  FeedView.swift
//  YoutubeFeed
//
//  Created by Sopheamen VAN on 12/7/24.
//

import SwiftUI
import Kingfisher


struct FeedView: View {
    // search field declare
    @State private var searchField = ""
    
    // load dummy data here
    var postDatas:[PostResponse] = postData
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // do lazyload vstack
                LazyVStack {
                    ForEach(postDatas) { post in
                        // custom post view here
                        PostView(post: post)
                       
                    }
                }
            }
            .background(Color.backgroundColor)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // profile image
                ToolbarItem (placement: .topBarLeading){
                    ProfileImageView(profileImage: userDataCurrent.profileImage, size: 35)
                }
                
                // search field
                ToolbarItem (placement: .principal){
                    HStack (spacing: 10){
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(.black.opacity(0.8))
                        
                        TextField("Search",text: $searchField)
                        
                    }
                    .padding(.horizontal, 10)
                    .frame(height: 35)
                    .background(Color.textFieldBackgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 8)
                }
                
                // chat icon
                ToolbarItem (placement: .topBarTrailing){
                    Button {
                        
                    }label: {
                        Image(systemName: "ellipsis.message.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 22, height: 22)
                            .foregroundStyle(.black.opacity(0.5))
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
}

struct PostView: View {
    var post: PostResponse
    var body: some View {
        VStack (spacing: 10){
            // user likes the post section
            HStack {
                HStack {
                    ProfileImageRectangleView(profileImage: post.userLikesThisPost.profileImage, size: 30)
                    Text(post.userLikesThisPost.fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    +
                    Text(" likes this")
                        .font(.footnote)
                }
                
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundStyle(.black.opacity(0.7))
                
            }
            .padding(.horizontal, 12)
            
            // divider
            Divider()
                .padding(.horizontal, 12)
            
            // profile and follow text and icon
            HStack (alignment: .top){
                // profile
                HStack{
                    ProfileImageView(profileImage: post.user.profileImage, size: 60)
                    VStack (alignment: .leading, spacing:3){
                        HStack {
                            Text(post.user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            +
                            Text(" - 3rd+")
                                .font(.footnote)
                        }
                        Text(post.user.headLineBio)
                            .font(.footnote)
                            .frame(height: 10)
                        
                        HStack (spacing: 0){
                            Text("3d - ")
                                .font(.footnote)
                                .frame(height: 20)
                            Image(systemName: "globe.americas.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                        }
                    }
                    
                }
                
                Spacer()
                
                Button {
                    // follow button action
                }label: {
                    HStack (spacing: 5){
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 13, height: 13)
                            .fontWeight(.semibold)
                        
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(Color.primaryColor)
                }
            }
            .padding(.horizontal,12)
            
            // caption
            Text(post.caption)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 12)
            
            // divider
            Divider()
            
            // post image photo and link
            if post.type == 1 {
                // photo
                // kfimage for load image network and cache
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity, height: 250)
                    .clipped()
                
            }else {
                // link
                VStack (alignment: .leading){
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: .infinity, height: 250)
                        .clipped()
                    Text(post.title ?? "")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 12)
                    Text("\(post.user.fullname) on Linkedin - \(post.readTimeAgo)")
                        .font(.footnote)
                        .padding(.horizontal, 12)
                }
                .padding(.bottom, 10)
                .background(Color.backgroundColor)
                
            }
            
            // total likes, comments, and reposts
            HStack {
                // likes
                HStack {
                    ZStack {
                        Image("like")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 11, height: 11)
                            .foregroundStyle(.white)
                            .padding(.all, 5)
                            .background(Color.likeIconColor)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white.opacity(0.2), lineWidth: 1))
                        Image("heart")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 11, height: 11)
                            .foregroundStyle(.white)
                            .padding(.all, 5)
                            .padding(.top, 1)
                            .background(Color.likeIconColor)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white.opacity(0.2), lineWidth: 1))
                            .offset(x: 15)
                        Image("light")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 11, height: 11)
                            .foregroundStyle(.white)
                            .padding(.all, 5)
                            .background(Color.likeIconColor)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white.opacity(0.2), lineWidth: 1))
                            .offset(x: 30)
                    }
                    
                    // total likes
                    Text("\(post.totalLikes)")
                        .font(.footnote)
                        .offset(x: 28)
                }
                
                Spacer()
                
                // total comments
                Text("\(post.totalComments) comments")
                    .font(.footnote)
                    .offset(x: 28)
                
                Spacer()
                
                // total reposts
                Text("\(post.totalReposts) reposts")
                    .font(.footnote)
                    
                
                
                
            }
            .padding(.horizontal, 12)
            
            // divider
            Divider()
            
            // like, comment, and repost action icon
            HStack {
                IconTextButton(title: "Like", icon: "hand.thumbsup", action: {})
                Spacer()
                IconTextButton(title: "Comment", icon: "bubble", action: {})
                Spacer()
                IconTextButton(title: "Repost", icon: "arrow.up.arrow.down", action: {})
                Spacer()
                IconTextButton(title: "Send", icon: "paperplane", action: {})
            }
            .padding(.horizontal,12)
            
            
        }
        .padding(.vertical,10)
        .background(.white)
    }
}

struct IconTextButton:View {
    var title: String
    var icon: String
    var action: () -> Void
    var body: some View {
        Button (action: action){
            // ui here
            VStack (spacing: 2){
                Image(systemName: icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 16, height: 16)
                Text(title)
                    .font(.footnote)
                
            }
            .foregroundStyle(.black.opacity(0.7))
            .fontWeight(.semibold)
        }
    }
}
