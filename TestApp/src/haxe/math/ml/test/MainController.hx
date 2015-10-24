package haxe.math.ml.test;

import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;
import learnmath.mathml.formula.MathML;
import learnmath.mathml.formula.Style;
import openfl.Assets;

@:build(haxe.ui.toolkit.core.Macros.buildController("assets/ui/main.xml"))
class MainController extends XMLController {
	private static inline var FIRST:String = "test9";
	private var _ml:MathML;
	
	public function new() {
		example.onChange = function(e:UIEvent) {
			var ex:String = example.text;
			loadExample(ex);
		};
	
		update.onClick = function(e) {
			updateExample();
		};
		
		example.text = FIRST;
		loadExample(FIRST);
	}
	
	private function loadExample(ex:String) {
		var xml:Xml = Xml.parse(Assets.getText("tests/" + ex + ".xml"));
		code.text = xml.toString();
		updateExample();
	}
	
	private function updateExample() {
		var xml:Xml = null;
		try {
			xml = Xml.parse(code.text);
		} catch (e:Dynamic) {
			showSimplePopup("Problem parsing xml:\n" + e);
			return;
		}
		
		canvas.removeAllChildren();
		_ml = new MathML(xml);
		var s:Style = new Style();
		s.size = 12;
		s.font = "_sans";
		_ml.drawFormula(canvas.sprite, s);
	}
}