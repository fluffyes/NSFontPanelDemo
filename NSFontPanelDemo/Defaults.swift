//
//  Defaults.swift
//  NSFontPanelDemo
//
//  Created by Soul on 15/08/2019.
//  Copyright © 2019 Fluffy. All rights reserved.
//

import Foundation
import Cocoa

struct Defaults {
	static func currentFont() -> NSFont {
		guard let name = UserDefaults.standard.object(forKey: "fontName") as? String else {
			return NSFont.systemFont(ofSize: NSFont.systemFontSize)
		}
		
		let size = CGFloat(UserDefaults.standard.float(forKey: "fontSize"))
		guard let font = NSFont(name: name, size: size) else {
			return NSFont.systemFont(ofSize: NSFont.systemFontSize)
		}
		
		return font
	}
	
	static func saveCurrentFont(name: String, size: Float) {
		UserDefaults.standard.set(name, forKey: "fontName")
		UserDefaults.standard.set(size, forKey: "fontSize")
	}
}
