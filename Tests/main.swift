//
//  main.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

// swiftlint:disable no_magic_numbers type_body_length missing_docs function_body_length closure_body_length

import Libadwaita

@main
public enum SwiftGui {

    public static func main() {
        let application = MyApplication()
        application.run()
    }
}

public class MyApplication: Application {

    public init() { super.init(name: "org.swift.Foo") }

    func helloButton() -> Button { Button("Hello!").handler { print("Hello!") } }

    func aboutWindow(win: Window) -> AboutWindow {
        AboutWindow(parent: win)
            .generalData(
                title: "SwiftGui",
                icon: .default(icon: .applicationXExecutable),
                developer: "JCWasmx86",
                version: "main"
            )
            .website(url: "https://github.com/JCWasmx86/SwiftGui")
            .issue(url: "https://github.com/JCWasmx86/SwiftGui/issues")
            .developers([
                "JCWasmx86 https://github.com/JCWasmx86", "david-swift https://github.com/david-swift"
            ])
            .copyright("© 2023 JCWasmx86, david-swift")
            .license(.gpl3_0)
    }

    func toastOverlay(win: Window) -> ToastOverlay {
        var toastOverlay = ToastOverlay(Label(""))
        let carousel = Carousel()
            .append(StatusPage().title("Hello").description("Page 1").hexpand().frame(minHeight: 300).onClick {
                print("Click!")
            })
            .append(StatusPage().title("World").description("Page 2").hexpand())
            .insert(Label("Inserted Page"), at: 0)
        let banner = Banner("Okay, so let's close the window.")
            .buttonLabel("Close")
            .buttonHandler {
                win.close()
            }
        toastOverlay = ToastOverlay(
            Box(horizontal: false).append(banner).append(
                StatusPage()
                    .title("Hello")
                    .description("World")
                    .icon(.default(icon: .softwareUpdateUrgent))
                    .child(
                        Box(horizontal: false, spacing: 5)
                            .append(MarkupLabel("<b>Foo</b> Bar"))
                            .append(
                                Box(horizontal: false, spacing: 5)
                                    .append(
                                        Box(spacing: 5)
                                            .append(
                                                Button("New Window")
                                                    .handler {
                                                        let otherWin = self.createWindow()
                                                        otherWin.show()
                                                    }
                                                    .hexpand()
                                            )
                                            .append(
                                                Button("Toast")
                                                    .handler {
                                                        let toast = Toast("Quit this <i>application!</i>")
                                                            .buttonLabel("Actions")
                                                            .buttonHandler {
                                                                let messageDialog = MessageDialog(
                                                                    parent: win,
                                                                    heading: "Hello, world!",
                                                                    body: "Some body text"
                                                                )
                                                                .response(
                                                                    id: "cancel",
                                                                    label: "Cancel",
                                                                    type: .closeResponse
                                                                ) {
                                                                    print("Cancel")
                                                                }
                                                                .response(id: "about", label: "About") {
                                                                    self.aboutWindow(win: win).show()
                                                                }
                                                                .response(
                                                                    id: "quit",
                                                                    label: "Quit",
                                                                    appearance: .destructive,
                                                                    type: .defaultResponse
                                                                ) {
                                                                    print("Quit")
                                                                    self.quit()
                                                                }
                                                                .child(
                                                                    Avatar(size: 100)
                                                                        .fallbackIcon(.default(icon: .dialogWarning))
                                                                )
                                                                messageDialog.show()
                                                            }
                                                            toastOverlay.addToast(toast)
                                                    }
                                                    .hexpand()
                                            )
                                            .append(
                                                Button("Maximize")
                                                    .handler {
                                                        if win.isMaximized { win.unmaximize() } else { win.maximize() }
                                                    }
                                                    .hexpand()
                                            )
                                            .append(
                                                Button("Close")
                                                    .handler {
                                                        if banner.isRevealed { banner.hide() } else { banner.show() }
                                                    }
                                                    .hexpand()
                                            )
                                    )
                                    .append(CheckButton("Test").handler { print("Toggle") })
                                    .append(TextView())
                                    .append(TextDropDown().append("FOO").append("BAR"))
                                    .frame(maxSize: 400)
                            )
                            .append(carousel.addIndicatorDots())
                            .padding()
                            .vexpand()
            )
        )
    )
    return toastOverlay
    }

    func createWindow() -> Window {
        let win = ApplicationWindow(app: self)
        let tabView = TabView()
        let createTab = {
            var tab: UInt64 = 0
            _ = tabView.append(title: "Toast Overlay", self.toastOverlay(win: win)) { tab = $0 }
            return tab
        }
        let contentView = TabOverview().createTabHandler { createTab() }
        let box = Box(horizontal: false)
        let switcher = ViewSwitcher()
        _ = contentView.add(
            ToolbarView(box.append(tabView.append(title: "Initial View", self.toastOverlay(win: win))))
                .addTopBar(
                    HeaderBar()
                        .packStart(helloButton())
                        .titleWidget(
                            switcher
                                .addOption(title: "Test", icon: .default(icon: .actionUnavailable))
                                .addOption(title: "Case", icon: .default(icon: .addressBookNew))
                                .wideDesign()
                                .onSelect {
                                    print(switcher.getSelection())
                                }
                        )
                        .packEnd(Button(icon: .default(icon: .tabNew)).handler { _ = createTab() })
                        .packEnd(TabButton(view: tabView).handler { contentView.showOverview() })
                )
                .addTopBar(TabBar(view: tabView))
                .topBarStyle(.raisedBorder),
            view: tabView
        )
        let listBox = ListBox()
        let splitView = OverlaySplitView().content(
            NavigationView()
                .add(contentView, title: "Test")
                .add(
                    ToolbarView(
                        Overlay()
                            .child(StatusPage().title("Navigation View"))
                            .addOverlay(
                                ProgressBar()
                                    .fraction(0.5)
                                    .addStyle("osd")
                            )
                    ).addTopBar(HeaderBar()).topBarStyle(.raised),
                    title: "Navigation Page"
                )
        )
        var trailing = false
        _ = splitView.sidebar(
            ToolbarView(
                listBox
                    .append(Label("Hello").halign(.start).padding())
                    .append(Label("World").halign(.start).padding())
                    .sidebarStyle()
                    .handler { print(listBox.getSelectedRow() ?? -1) }
            )
            .addTopBar(
                HeaderBar()
                    .append(
                        MenuButton(icon: .default(icon: .openMenu)).menu { menu in
                            _ = menu
                                .append("New Window", id: "win.new")
                                .append("Move Sidebar", app: self) {
                                    splitView.position(trailing: !trailing)
                                    trailing.toggle()
                                }
                                .append("Copy", app: self) {
                                    print("Copy")
                                    Clipboard.copy("Test Text")
                                }
                                .append(
                                    "More",
                                    submenu: .init()
                                        .append("Close Window", window: win, shortcut: "w".ctrl()) {
                                            win.close()
                                        }
                                )
                                .append(
                                    "Quit",
                                    section: .init()
                                        .append("Quit", app: self, shortcut: "q".ctrl()) { self.quit() }
                                )
                        }
                    )
            )
        )
        win.setChild(splitView)
        win.setDefaultSize(width: 700, height: 500)
        win.observeHide {
            print("Close Window")
            return false
        }
        win.addKeyboardShortcut("n".ctrl(), id: "new") { self.createWindow().show() }
        return win
    }

    override public func onActivate() {
        print(NativePeer.getUserDataDirectory())
        let win = createWindow()
        let preferencesWindow = PreferencesWindow(parent: win)
        let group = PreferencesGroup(name: "A Group", description: "Description")
        let content1 = helloButton().padding()
        let content2 = Label("Hello, world!")
        let stack = Stack().append(content1, transition: .slideUp)
            .append(content2, transition: .slideUp)
        preferencesWindow.setDefaultSize(width: 500, height: 400)
        let combo = ComboRow(title: "ComboRow", subtitle: "Description")
        preferencesWindow.add(
            page: .init(name: "Hello", icon: .default(icon: .daytimeSunrise), description: "Hello world?")
                .add(
                    group: group
                        .add(ActionRow(title: "ActionRow", subtitle: "Description").addSuffix(stack))
                        .add(
                            combo.append("Hello").append("World").onChange {
                                print(combo.selected())
                            }
                        )
                        .headerSuffix(
                            Button("Add")
                                .handler {
                                    _ = group.add(
                                        ActionRow(
                                            title: String(Int.random(in: 0...1_000)),
                                            subtitle: String(Int.random(in: 0...100_000))
                                        )
                                    )
                                }
                                .padding()
                        )
                )
                .add(
                    group: .init(name: "Another Group", description: "Description")
                        .add(
                            ExpanderRow(title: "ExpanderRow", subtitle: "Description")
                                .addRow(
                                    ActionRow(title: "Row 1", subtitle: "Description")
                                        .addSuffix(
                                            Button("Toggle Stack")
                                                .handler {
                                                    switch stack.getVisible()?.0.nativePtr {
                                                    case content1.nativePtr:
                                                        stack.setVisible(content2)
                                                    default:
                                                        stack.setVisible(content1)
                                                    }
                                                }
                                                .padding()
                                        )
                                )
                                .addRow(ActionRow(title: "Row 2", subtitle: "Description"))
                                .addRow(SwitchRow(title: "Switch Row", subtitle: "Description"))
                                .addRow(
                                    SpinRow(title: "Spin Row", subtitle: "Description", min: 0, max: 10, step: 0.5)
                                        .configuration(min: -10, max: 10, step: 2)
                                )
                        )
                )
        )
        let entryRow = EntryRow(title: "Entry Row")
            .changeHandler { print("Update!") }
        let passwordEntryRow = PasswordEntryRow(title: "Password Entry Row")
        preferencesWindow.add(
            page: .init(name: "World", icon: .default(icon: .faceCool), description: "Cool!")
                .add(
                    group: .init(name: "Entries", description: "Description")
                        .add(
                            entryRow.submitHandler {
                                print(entryRow.contents())
                                entryRow.setContents("")
                            }
                        )
                        .add(passwordEntryRow)
                        .headerSuffix(
                            Button("Print")
                                .handler {
                                    print("\(entryRow.contents()), \(passwordEntryRow.contents())")
                                }
                                .padding()
                                .sensitive(false)
                        )
                )
        )
        win.show()
        preferencesWindow.show()
        preferencesWindow.add(toast: .init("Toast!"))
        let dialog = FileDialog(nil)
        dialog.setExtensions(["py"])
        dialog.open { url in
            print(url)
        } onClose: {
            print("Close")
        }
    }
}

// swiftlint:enable no_magic_numbers type_body_length missing_docs function_body_length closure_body_length
