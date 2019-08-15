//
//  ViewController.swift
//  NSFontPanelDemo
//
//  Created by Soul on 15/08/2019.
//  Copyright © 2019 Fluffy. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
	
	@IBOutlet weak var demoLabel: NSTextField!
	
	// previously saved font
	// default is system font
	var font = Defaults.currentFont()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		
		// set the label to the previously saved font
		demoLabel.font = font
		
		// set the selected font in panel to the previously saved font
		NSFontPanel.shared.setPanelFont(font, isMultiple: false)
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}

	@IBAction func editFontClicked(_ sender: NSButton) {
		// show the font panel
		NSFontPanel.shared.makeKeyAndOrderFront(self)
	}
	
	// this will be called when user change the font in font panel
	// if this function is not implemented, the app will search up the responder chain
	override func changeFont(_ sender: Any?) {
		
		// the sender is a font manager
		guard let fontManager = sender as? NSFontManager else {
			return
		}
		
		// the newly selected font
		/*
			you can actually pass in any font into the .convert() function and it
			will return the selected font from the panel, lol
		*/
		
//		let newFont = fontManager.convert(NSFont.systemFont(ofSize: 13.0))
		let newFont = fontManager.convert(self.font)
		self.font = newFont
		demoLabel.font = newFont
		Defaults.saveCurrentFont(name: newFont.fontName, size: Float(newFont.pointSize))
	}
}
