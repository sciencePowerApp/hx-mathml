package learnmath.mathml.formula;

import openfl.display.MovieClip;
import openfl.geom.Point;
import openfl.geom.Rectangle;

class Box {
	public var originPoint:Point;
	public var finalBounds:Rectangle;
	public var style:Style;
	private var children:Array<Box>;

	private var parentBox:Box;
	
	public function new(_parentBox:Box) {
		parentBox = _parentBox;
		finalBounds = new Rectangle();
		originPoint = new Point();
		style = new Style();
	}
	
	public function initBounds(_originPoint:Point):Void {
		finalBounds.x = _originPoint.x;
		finalBounds.y = _originPoint.y;
		finalBounds.width = 0;
		finalBounds.height = 0;
		originPoint.x = _originPoint.x;
		originPoint.y = _originPoint.y;
	}
	
	public function calculateBox(_originPoint:Point):Void {
		initBounds(_originPoint);
		calculate();
	}
	
	public function calculate():Void {
	}
	
	public function moveOriginTo(newOriginPoint:Point):Void {
		finalBounds.x = newOriginPoint.x;
		finalBounds.y = finalBounds.y + (newOriginPoint.y - originPoint.y);

		originPoint.x = newOriginPoint.x;
		originPoint.y = newOriginPoint.y;
		moveMyChildren();
	}
	
	public function moveMyChildren():Void {
	}
	
	public function changeSizeFromParent():Void {
	}
	
	public function resizeFromParent():Void {
		//parent box must be msubsup
		// parent of msubsup can be only type RowBox and if the next child is greater take this  height.
		var p:Box = parentBox.parentBox;
		var nextChild:Box = null;
		if (p != null) {
			for (i in 0...p.children.length) {	
				var child:Box = p.children[i];
				if (child == parentBox) {
					nextChild = p.children[i + 1];
					break;
				}
			}
			
			if (nextChild != null) {
				var dxs:Float = parentBox.finalBounds.y - nextChild.finalBounds.y;	
				var dxi:Float = nextChild.finalBounds.y + nextChild.finalBounds.height - parentBox.finalBounds.y - parentBox.finalBounds.height;
				if (dxs > 0 && dxi > 0) {
					var min:Float = dxs;	
					if (dxi < min) {
						min = dxi;	
					}
					
					min = 0.8 * min;
					
					parentBox.finalBounds.y = parentBox.finalBounds.y - min;
					parentBox.finalBounds.height = parentBox.finalBounds.height + min * 2;
					
					finalBounds.y = finalBounds.y - min;
					finalBounds.height = finalBounds.height + min * 2;
					
					parentBox.moveMyChildren();
				}
			}
		}
	}
	
	public function copyParentStyle(_styleParent:Style):Void {
		if (style.font == null && _styleParent.font != null) {
			style.font = _styleParent.font;
		}
		//if (style.size == 0 && _styleParent.size > 0) {
			style.size = _styleParent.size;
		//}
		if (style.color == null && _styleParent.color != null) {
			style.color = _styleParent.color;
		}
		if (style.fontweight == null && _styleParent.fontweight != null) {
			style.fontweight = _styleParent.fontweight;
		}
		if (style.fontstyle == null && _styleParent.fontstyle != null) {
			style.fontstyle = _styleParent.fontstyle;
		}
	}
	
	public function getHexColor():Int {
		if (style.color == null) {
			return 0;
		}
		return Std.parseInt("0x" + style.color.substring(1));
	}
	
	public function drawBox(graph:MovieClip):Void {
		DrawFormula.drawBackground(graph, finalBounds, style);
		draw(graph);
	}
	
	public function draw(graph:MovieClip):Void {
		
	}
	
	public function toString():String {
		return "Box";	
	}
	
	public function getTinethickness(l:Float, kLine:Float):Float {
		var s:Float = l;
		if (l == 0) {
			s = finalBounds.height * kLine;
		} else {
			return l;
		}
		if (s < 1) {
			s = 1;
		} else if (s > 4) {
			s = 4;
		}
		return s;
	}
	
	//added for editor
	public var selectionStart:Int = 0;
	public var selectionEnd:Int = 0;
	
	public function drawText(graph:MovieClip, p:Point, text:String):Void {
		if (selectionStart > text.length) {
			selectionStart = text.length;
		}
		if (selectionStart < 0) {
			selectionStart = 0;
		}
		if (selectionEnd > text.length) {
			selectionEnd = text.length;	
		}
		if (selectionEnd < 0) {
			selectionEnd = 0;	
		}
		if (selectionStart == selectionEnd) {
			DrawFormula.createText(graph, p, text, style);	
		} else if ((selectionStart == 0 && selectionEnd == text.length) || (selectionEnd == 0 && selectionStart == text.length)) {
			var newStyle:Style = style.getCopy();
			newStyle.color = "#ff0000";
			DrawFormula.createText(graph, p, text, newStyle);
		} else if (selectionEnd < selectionStart) {
			drawTextS(graph, text, selectionEnd, selectionStart, p);
		} else {
			drawTextS(graph, text, selectionStart, selectionEnd, p);
		}
	}
	
	public function drawTextS(graph:MovieClip, text:String, startS:Int, endS:Int,  p:Point):Void {
		var t:String = text.substring(0, startS);
		DrawFormula.createText(graph, p, t, style);
		var w1:Float = FontConstant.getWidth(style, t);

		t = text.substring(startS, endS);
		var newStyle:Style = this.style.getCopy();
		newStyle.color = "#ff0000";
		var newP:Point = new Point();
		newP.x = p.x + w1 - 4;
		newP.y = p.y;
		DrawFormula.createText(graph, newP, t, newStyle);
		var w2:Float = FontConstant.getWidth(style, t);

		newP.x = p.x + w1 + w2-8;
		newP.y = p.y;
		t = text.substring(endS);
		DrawFormula.createText(graph, newP, t, style);
	}
}