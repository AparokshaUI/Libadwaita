import CGTUI

public class OverlaySplitView: NativeWidgetPeer {
  public override init() {
    super.init()
    self.nativePtr = gtui_create_overlaysplitview()
  }

  public func sidebar(_ view: NativeWidgetPeer) -> OverlaySplitView {
    gtui_overlaysplitview_set_sidebar(self.nativePtr, view.nativePtr)
    return self
  }

  public func content(_ view: NativeWidgetPeer) -> OverlaySplitView {
    gtui_overlaysplitview_set_content(self.nativePtr, view.nativePtr)
    return self
  }

  public func showSidebar() { gtui_overlaysplitview_show_sidebar(self.nativePtr) }

  public func hideSidebar() { gtui_overlaysplitview_hide_sidebar(self.nativePtr) }
}
