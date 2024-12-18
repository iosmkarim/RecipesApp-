//
//  ImageCache.swift
//  RecipesApp
//
//  Created by Md Rezaul Karim on 12/17/24.
//

import UIKit

final class ImageCache {
    private let cache = NSCache<NSString, UIImage>()
    private let fileManager = FileManager.default

    func image(for url: URL) async throws -> UIImage {
        let cacheKey = NSString(string: url.absoluteString)

        if let cachedImage = cache.object(forKey: cacheKey) {
            return cachedImage
        }

        let diskPath = cachePath(for: url)
        if let diskImage = UIImage(contentsOfFile: diskPath) {
            cache.setObject(diskImage, forKey: cacheKey)
            return diskImage
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else {
            throw URLError(.cannotDecodeContentData)
        }

        try data.write(to: URL(fileURLWithPath: diskPath))
        cache.setObject(image, forKey: cacheKey)
        return image
    }

    private func cachePath(for url: URL) -> String {
        let fileName = url.lastPathComponent
        let cachesDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
        return cachesDirectory.appendingPathComponent(fileName).path
    }
}
