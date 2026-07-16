// This is just a sample program that lets the user scroll through some empty images
// Just wanted to make an initial commit

import SwiftUI

struct ContentView: View {

    let posts = Array(1...20)

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {

                    ForEach(posts, id: \.self) { post in

                        VStack(alignment: .leading, spacing: 10) {

                            // User header
                            HStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.4))
                                    .frame(width: 40, height: 40)

                                VStack(alignment: .leading) {
                                    Text("User \(post)")
                                        .font(.headline)

                                    Text("Somewhere")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }

                                Spacer()
                            }
                            .padding(.horizontal)

                            // Placeholder image
                            Rectangle()
                                .fill(Color.gray.opacity(0.25))
                                .aspectRatio(1, contentMode: .fit)
                                .overlay(
                                    Image(systemName: "photo")
                                        .font(.system(size: 70))
                                        .foregroundColor(.gray)
                                )

                            // Buttons
                            HStack(spacing: 18) {
                                Image(systemName: "heart")
                                Image(systemName: "bubble.right")
                                Image(systemName: "paperplane")

                                Spacer()

                                Image(systemName: "bookmark")
                            }
                            .font(.title2)
                            .padding(.horizontal)

                            // Caption
                            VStack(alignment: .leading, spacing: 4) {
                                Text("User \(post)")
                                    .fontWeight(.bold)
                                +
                                Text(" This is where a caption would go.")
                            }
                            .padding(.horizontal)

                        }
                        .padding(.bottom)
                    }
                }
            }
            .navigationTitle("Feed")
        }
    }
}

#Preview {
    ContentView()
}
