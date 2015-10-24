package learnmath.mathml.formula;
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/

import openfl.display.MovieClip;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import openfl.text.TextField;

class DrawFormula {
	public var parentBox:Box;
	public static var index:Int = 0;
	public var mc:MovieClip;

	public function new(box:Box) {
		parentBox = box;
	}
	
	public function clear():Void {
		if (mc != null) {
			mc.graphics.clear();
			while (mc.numChildren > 0) {
				mc.removeChildAt(0);	
			}
		}
	}
	
	public function draw(graph:MovieClip, style:Style, leftMiddlePoint:Point):Rectangle {
		if (mc == null) {
			mc = new MovieClip();	
			mc.name = "mc" + index;
			graph.addChild(mc);
		}
		
		ResizeBox.clear();
		parentBox.copyParentStyle(style);
		parentBox.calculateBox(leftMiddlePoint);
		ResizeBox.resizeChildren();
		parentBox.draw(mc);
		
		return parentBox.finalBounds.clone();
	}
	
	public static function createText(graph:MovieClip, startPoint:Point, text:String, style:Style):Void {
		var width:Float = FontConstant.getWidth(style, text);
		var height:Float = FontConstant.getHeight(style, text);
		var l:TextField = new TextField();
		l.name = "g" + index;
		l.width = width;
		l.height = height;
		l.selectable = false;
		l.x = startPoint.x;
		l.y = startPoint.y;
		l.text = text;
		l.setTextFormat(FontConstant.getTextFormat(style));
		graph.addChild(l);
		index = index + 1;
	}
	
	public static function calculateText(bounds:Rectangle, text:String, style:Style):Void {
		if (text == null || text == "") return;	
		bounds.width = FontConstant.getWidth(style, text);
		bounds.height = FontConstant.getHeight(style, text);
	}
	
	public static function drawRectangle(graph:MovieClip, bounds:Rectangle):Void {
		graph.graphics.lineStyle(1, 0x000000, 100);	
		graph.graphics.moveTo(bounds.x, bounds.y);
		graph.graphics.lineTo(bounds.x + bounds.width, bounds.y);
		graph.graphics.lineTo(bounds.x + bounds.width, bounds.y + bounds.height);
		graph.graphics.lineTo(bounds.x, bounds.y + bounds.height);
		graph.graphics.lineTo(bounds.x, bounds.y);
	}
	
	public static function drawBackground(graph:MovieClip, bounds:Rectangle, style:Style):Void {
		if (style != null && style.bgcolor != null && style.bgcolor.length > 0) {
			graph.graphics.lineStyle(0, style.getHexBgColor(), 100);	
			graph.graphics.beginFill(style.getHexBgColor());  
			graph.graphics.drawRect(bounds.x, bounds.y, bounds.width, bounds.height);
			graph.graphics.endFill(); 
		}
	}
}