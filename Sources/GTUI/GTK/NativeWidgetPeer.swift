import CGTUI

open class NativeWidgetPeer: NativePeer {
  public var height: Int { .init(gtui_get_height(self.nativePtr)) }

  public var width: Int { .init(gtui_get_width(self.nativePtr)) }

  public func hexpand(_ enabled: Bool = true) -> NativeWidgetPeer {
    gtui_set_hexpand(self.nativePtr, enabled.cBool)
    return self
  }

  public func vexpand(_ enabled: Bool = true) -> NativeWidgetPeer {
    gtui_set_vexpand(self.nativePtr, enabled.cBool)
    return self
  }

  public func halign(_ alignment: Alignment) -> NativeWidgetPeer {
    gtui_set_halign(self.nativePtr, alignment.rawValue.cInt)
    return self
  }

  public func valign(_ alignment: Alignment) -> NativeWidgetPeer {
    gtui_set_valign(self.nativePtr, alignment.rawValue.cInt)
    return self
  }

  public func padding(_ padding: Int = 10, _ edges: Set<Edge> = .all) -> NativeWidgetPeer {
    for edge in edges {
      switch edge {
      case .leading: gtui_set_margin_start(self.nativePtr, padding.cInt)
      case .trailing: gtui_set_margin_end(self.nativePtr, padding.cInt)
      case .top: gtui_set_margin_top(self.nativePtr, padding.cInt)
      case .bottom: gtui_set_margin_bottom(self.nativePtr, padding.cInt)
      }
    }
    return self
  }

  public func frame(minWidth: Int? = nil, minHeight: Int? = nil) -> NativeWidgetPeer {
    gtui_set_size_request(self.nativePtr, (minWidth ?? -1).cInt, (minHeight ?? -1).cInt)
    return self
  }

  public func frame(maxSize: Int? = nil) -> NativeWidgetPeer {
    if let maxSize { return Clamp(self).maximumSize(maxSize) } else { return self }
  }

  public func addStyle(_ style: String) -> NativeWidgetPeer {
    gtui_add_css_class(self.nativePtr, style.cString)
    return self
  }

  public func sensitive(_ sensitive: Bool = true) -> NativeWidgetPeer {
    gtui_set_sensitive(self.nativePtr, sensitive.cBool)
    return self
  }
}
