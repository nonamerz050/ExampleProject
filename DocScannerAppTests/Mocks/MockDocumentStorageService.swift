//
//  MockDocumentStorageService.swift
//  DocScannerApp
//
//  Created by Artem Kolesnik on 11.04.2025.
//

import Foundation
@testable import DocScannerApp

final class MockDocumentStorageService: DocumentStorageServiceProtocol {
    var shouldThrow = false

    private(set) var didCallSave = false
    private(set) var savedScan: ScannedDocumentProtocol?
    private(set) var savedName: String?

    func save(scan: ScannedDocumentProtocol, name: String) async throws {
        didCallSave = true
        if shouldThrow {
            throw MockError.test
        }

        savedScan = scan
        savedName = name
    }
}

enum MockError: Error {
    case test
}
