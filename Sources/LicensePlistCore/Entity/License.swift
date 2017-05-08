import Foundation
import APIKit
import LoggerAPI

public protocol LicenseInfo: HasName {
    var name: String { get }
    var body: String { get }
}

public protocol License: LicenseInfo {
    associatedtype LibraryType: Library
    var library: LibraryType { get }
    var body: String { get }
}

extension License {
    public var name: String { return library.name }
}

public struct GitHubLicense: License {
    public let library: GitHub
    public let body: String
    let githubResponse: LicenseResponse
}

public struct CocoaPodsLicense: License {
    public let library: CocoaPods
    public let body: String
}

extension CocoaPodsLicense: CustomStringConvertible {
    public var description: String { return "name: \(library.name)\nbody: \(String(body.characters.prefix(20)))…" }
}
