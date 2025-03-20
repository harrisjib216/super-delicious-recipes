//
//  RecipeImage.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI

// a component to handle good, bad, and in progress
// thumbnails for a recipe
struct RecipeImage: View {
    @State private var loading = true
    @State private var hasError = false
    @State private var image: UIImage?
    private var filename: String {
        Recipe.filenameFromLink(link: link)
    }
    
    var link: String
    var size: CGFloat?
    var radius: CGFloat?
    
    init(link: String, size: CGFloat? = nil, radius: CGFloat? = nil) {
        self.loading = true
        self.hasError = false
        
        self.link = link
        self.size = size
        self.radius = radius
    }
    
    var body: some View {
        let _size = (size == nil ? UIScreen.main.bounds.width / 2.0 - 16.0 : size)!
        let _radius = (radius == nil ? 12.0 : radius)!
        
        VStack {
            if loading {
                GlimmerView()
                    .frame(width: _size, height: _size)
            } else if hasError {
                ErrorPlaceholder(imgSize: _size)
            } else {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: _size, height: _size)
            }
        }
        .cornerRadius(_radius)
        .onAppear {
            Task {
                await loadImage()
            }
        }
    }
    
    func loadImage() async {
        do {
            let imageUrl = try getDocumentsDirectory().appendingPathComponent(filename)
            
            // try disk
            if FileManager.default.fileExists(atPath: imageUrl.path) {
                if let imageData = try? Data(contentsOf: imageUrl),
                   let loadedImage = UIImage(data: imageData) {
                    
                    print("got image from disk")
                    image = loadedImage
                    loading = false
                    hasError = false
                    return
                }
            }
            
            // try server
            loadImageFromURL(path: link) { loadedImage in
                guard let loadedImage = loadedImage else {
                    loading = false
                    hasError = true
                    return
                }
                
                image = loadedImage
                loading = false
                hasError = false
                saveImageToDisk(img: loadedImage)
                print("got image from server")
            }
        } catch {
            print("failed to get image", error.localizedDescription)

            loading = false
            hasError = true
        }
    }
    
    func loadImageFromURL(path: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: path) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let loadedImage = UIImage(data: data)
            completion(loadedImage)
        }.resume()
    }
    
    func saveImageToDisk(img: UIImage?) {
        guard let _img = img, let imageData = _img.jpegData(compressionQuality: 0.9) else {
            return
        }
        
        do {
            let fileURL = try getDocumentsDirectory().appendingPathComponent(filename)
            try imageData.write(to: fileURL)
            print("Image saved to disk")
        } catch {
            print("Failed to save image to disk")
        }
    }

    func getDocumentsDirectory() throws -> URL {
         return try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
         )
    }
    
    func ErrorPlaceholder(imgSize: CGFloat) -> some View {
        ZStack {
            Rectangle()
                .fill(.gray)
                .frame(width: imgSize, height: imgSize)

            VStack(spacing: 10) {
                Image(systemName: "questionmark.circle.fill")
                    .foregroundStyle(.white)
                    .font(.system(size: 45))

                Text("Preview is not available")
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    let recipe = MockDataService.getSampleRecipe()
    
    RecipeImage(
        link: recipe.photoUrlSmall,
        size: 140.0,
        radius: 140.0
    )
}
