//
//  FileDialog.swift
//  Libadwaita
//
//  Created by david-swift on 03.12.23.
//

import CGTUI
import Foundation

/// Gtk.FileDialog
public class FileDialog: NativePeer {

    /// The parent window, if there is one.
    let window: Window?
    /// A link to the file dialog.
    var selfAddr: UInt64 {
        unsafeBitCast(self, to: UInt64.self)
    }
    /// The closure that gets called when a file for opening has been selected.
    var openClosure: ((URL) -> Void)?
    /// The closure that gets called when a file for saving has been selected.
    var saveClosure: ((URL) -> Void)?
    /// The closure that gets called when a dialog has been closed.
    var closeClosure: (() -> Void)?
    /// Whether folders are allowed when opening a file.
    var folders = false

    /// Initialize a file dialog.
    /// - Parameter parent: The parent window.
    public init(_ parent: Window?) {
        self.window = parent
        super.init()
        self.nativePtr = gtui_create_filedialog()
    }

    // swiftlint:disable discouraged_optional_collection
    /// Set the allowed file extensions for opening a file (e.g. `[".py"]`).
    /// - Parameters:
    ///     - extensions: The allowed extensions, or nil for allowing every type.
    ///     - folders: Whether folders are allowed.
    public func setExtensions(_ extensions: [String]?, folders: Bool = false) {
        self.folders = folders
        if let extensions {
            gtui_filedialog_set_accepted_extensions(self.nativePtr, extensions.cArray)
        } else {
            gtui_filedialog_accept_all_extensions(self.nativePtr)
        }
    }
    // swiftlint:enable discouraged_optional_collection

    /// Set the initial name of the file when saving it.
    /// - Parameter name: The file's initial name.
    public func setInitialName(_ name: String) {
        gtui_filedialog_set_initial_name(self.nativePtr, name.cString)
    }

    /// Open the file dialog for opening a file.
    /// - Parameters:
    ///     - folder: The URL of the initial folder, or `nil` for the "Recent" view.
    ///     - onOpen: Run this closure when a URL is available.
    ///     - onClose: Run this closure when the user cancels the action.
    public func open(folder: URL? = nil, _ onOpen: @escaping (URL) -> Void, onClose: @escaping () -> Void) {
        self.openClosure = onOpen
        self.closeClosure = onClose
        if let folder {
            gtui_filedialog_set_initial_folder(self.nativePtr, folder.absoluteString.cString)
        }
        gtui_filedialog_open(self.nativePtr, selfAddr, window?.nativePtr ?? 0)
    }

    /// Open the file dialog for saving a file.
    /// - Parameters:
    ///     - folder: The URL of the initial folder, or `nil` for the "Home" folder.
    ///     - onSave: Run this closure when the file should be saved at a URL.
    ///     - onClose: Run this closure when the user cancels the action.
    public func save(folder: URL? = nil, _ onSave: @escaping (URL) -> Void, onClose: @escaping () -> Void) {
        self.saveClosure = onSave
        self.closeClosure = onClose
        if let folder {
            gtui_filedialog_set_initial_folder(self.nativePtr, folder.absoluteString.cString)
        }
        gtui_filedialog_save(self.nativePtr, selfAddr, window?.nativePtr ?? 0)
    }

    /// Run this when a file gets opened.
    /// - Parameter path: The file path.
    func onOpen(_ path: String) {
        let url = URL(fileURLWithPath: path)
        if url.pathExtension.isEmpty && !folders, let openClosure, let closeClosure {
            self.open(folder: url, openClosure, onClose: closeClosure)
        } else {
            openClosure?(url)
        }
    }

    /// Run this when a file gets saved.
    /// - Parameter path: The file path.
    func onSave(_ path: String) {
        saveClosure?(.init(fileURLWithPath: path))
    }

    /// Run this when the user cancels the action.
    func onClose() {
        closeClosure?()
    }
}

/// Run when a file should be opened.
/// - Parameters:
///   - ptr: The pointer.
///   - file: The path to the file.
///   - userData: The file dialog data.
@_cdecl("filedialog_on_open_cb")
func filedialog_on_open_cb(
    ptr: UnsafeMutableRawPointer,
    file: UnsafePointer<CChar>?,
    userData: UnsafeMutableRawPointer
) {
    let dialog = Unmanaged<FileDialog>.fromOpaque(userData).takeUnretainedValue()
    if let file {
        dialog.onOpen(.init(cString: file))
    } else {
        dialog.onClose()
    }
}

/// Run when a file should be saved.
/// - Parameters:
///   - ptr: The pointer.
///   - file: The path to the file.
///   - userData: The file dialog data.
@_cdecl("filedialog_on_save_cb")
func filedialog_on_save_cb(
    ptr: UnsafeMutableRawPointer,
    file: UnsafePointer<CChar>?,
    userData: UnsafeMutableRawPointer
) {
    let dialog = Unmanaged<FileDialog>.fromOpaque(userData).takeUnretainedValue()
    if let file {
        dialog.onSave(.init(cString: file))
    } else {
        dialog.onClose()
    }
}
