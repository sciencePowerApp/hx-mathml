package learnmath.mathml.formula.layout;
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/

import learnmath.mathml.formula.Box;
import openfl.display.MovieClip;
import openfl.geom.Point;

class RowBox extends Box {
	public function new(parentBox:Box) {
		super(parentBox);
		children = new Array<Box>();
	}
	
	public function addChild(newBox:Box):Void {
		children.push(newBox);
	}
	
	public override function calculate():Void {
		if (children.length == 0) return;
		var childx:Float = 0;
		
		for (i in 0...children.length) {
			var child:Box = children[i];

			var cP:Point = new Point();
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y;
			child.calculateBox(cP);
			
			childx = childx + child.finalBounds.width;
		}
		
		finalBounds.width = 0;
		finalBounds.height = 0;
		finalBounds.y = children[0].finalBounds.y;
		var minYPoint:Float = children[0].finalBounds.y;
		
		for (i in 0...children.length) {
			var child:Box = children[i];
			
			finalBounds.width = finalBounds.width + child.finalBounds.width;
			if ((child.finalBounds.y + child.finalBounds.height) > minYPoint) {
				minYPoint = child.finalBounds.y + child.finalBounds.height;
			}
			
			if (child.finalBounds.y < finalBounds.y) {
				finalBounds.y = child.finalBounds.y;
			}
		}
		
		finalBounds.height = minYPoint - finalBounds.y;
	}
	
	public override function moveMyChildren():Void {
		var childx:Float = 0;
		for (i in 0...children.length) {
			var child:Box = children[i];
			
			var cP:Point = new Point();
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y;
			
			child.moveOriginTo(cP);
			childx = childx + child.finalBounds.width;
		}
	}
	
	public override function copyParentStyle(_styleParent:Style):Void {
		super.copyParentStyle(_styleParent);
		for (i in 0...children.length) {
			var child:Box = children[i];
			child.copyParentStyle(this.style);
		}
	}
	
	public override function draw(graph:MovieClip):Void {
		for (i in 0...children.length) {
			var child:Box = children[i];
			child.drawBox(graph);
		}
	}
	
	public override function toString():String {
		var s:String = "RowBox " + finalBounds + " [";
		for (i in 0...children.length) {
			var child:Box = children[i];
			s = s + child.toString();
			if ((i + 1) != children.length) {
				s = s + ",";	
			}
		}
		s = s + "]";
		return s;
	}
}