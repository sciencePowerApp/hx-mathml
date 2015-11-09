package haxe.math.ml.test;

import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;
import learnmath.mathml.formula.MathML;
import learnmath.mathml.formula.Style;
import openfl.Assets;

@:build(haxe.ui.toolkit.core.Macros.buildController("assets/ui/main.xml"))
class MainController extends XMLController {
	private static inline var URL:String = "http://cose.math.bas.bg/webMathematica/webComputing/ToMathML.jsp";
	
	private static inline var FIRST:String = "test9";
	private var _ml:MathML;
	
	public function new() {
		example.onChange = function(e:UIEvent) {
			var ex:String = example.text;
			loadExample(ex);
		};
	
		update.onClick = function(e) {
			if (useNotation.selected == true) {
				updateFromNotation(notation.text);
			} else {
				updateExample();
			}
		};
		
		useNotation.onClick = function(e) {
			if (useNotation.selected == true) {
				spacer.visible = false;
				notation.visible = true;
			} else {
				spacer.visible = true;
				notation.visible = false;
			}
		}
		
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
		update.disabled = false;
	}
	
	private function updateFromNotation(s:String) {
		var u:Http = new Http(URL);
		
		update.disabled = true;
		
		u.onData = function(s:String) {
			var n1:Int = s.indexOf("<pre>");
			
			n1 += 5;
			var n2:Int = s.indexOf("</pre>", n1);
			
			var ml:String = s.substring(n1, n2);
			
			ml = StringTools.replace(ml, "&lt;", "<");
			ml = StringTools.replace(ml, "&gt;", ">");
			ml = StringTools.replace(ml, "&#160;", " ");
			ml = StringTools.replace(ml, "<math", "<mathml");
			ml = StringTools.replace(ml, "</math", "</mathml");
			
			var xml:Xml = Xml.parse(ml);
			code.text = xml.toString();
			updateExample();
		}
		
		u.onError = function(error:Dynamic) {
			update.disabled = false;
			showSimplePopup(error);
		}
		
		//u.addParameter("input", "Sqrt[ Sin[x^2]]");
		u.addParameter("input", s);
		
		u.request(true);
	}
}