//
//  ColorSwatchView.swift
//  SO-31702193
//
//  Copyright (c) 2017 Xavier Schott
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit

@IBDesignable class ColorSwatchView: UIView {

    enum ColorPalette: String {
        case GoldenRod  = "goldenrod"
        case CornSilk   = "cornsilk"
        case Wheat      = "wheat"
        case Thistle    = "thistle"
        case Plum       = "plum"
        case Olive      = "olive"
        case Iris       = "iris"

        case Clear      = "clear"
    }

    let namedColors = [
        "goldenrod" : UIColor(red:218/255, green:165/255, blue:32/255, alpha:1),
        "cornsilk"  : UIColor(red:255/255, green:248/255, blue:220/255, alpha:1),
        "wheat"     : UIColor(red: 216/255, green: 216/255, blue: 191/255, alpha: 1),
        "thistle"   : UIColor(red: 216/255, green: 191/255, blue: 216/255, alpha: 1),
        "plum"      : UIColor(red: 221/255, green: 160/255, blue: 221/255, alpha: 1),
        "olive"     : UIColor(red: 128/255, green: 128/255, blue: 0/255, alpha: 1),
        "iris"      : UIColor(red: 3/255, green: 180/255, blue: 200/255, alpha: 1)
    ]

    var tincture:ColorPalette = .Clear

    // Stored IB property
    @available(*, unavailable, message: "Use Tincture Name in IB, use tincture programmatically")
    @IBInspectable var tinctureName: String? {
        willSet {
            if let color = ColorPalette(rawValue: newValue?.lowercased() ?? "") {
                tincture = color
            }
        }
    }

    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.saveGState()
        let uiColor = namedColors[tincture.rawValue] ?? UIColor.clear
        ctx?.setFillColor(uiColor.cgColor)
        ctx?.fill(bounds)
        ctx?.restoreGState()
    }
}
