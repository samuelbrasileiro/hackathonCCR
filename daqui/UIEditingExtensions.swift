//
//  UIEditingExtensions.swift
//  daqui
//
//  Created by Samuel Brasileiro on 16/01/21.
//

import SwiftUI

/// Editing is a property that can manipulate the state of something in the UIApllication

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

struct ResignKeyboardOnTapGesture: ViewModifier {
    var gesture = TapGesture().onEnded{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
    func resingKeyboardOnTapGesture() -> some View{
        return modifier(ResignKeyboardOnTapGesture())
    }
}
