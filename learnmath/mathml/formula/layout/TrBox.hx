package learnmath.mathml.formula.layout;
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/

import learnmath.mathml.formula.Box;
import openfl.display.MovieClip;
import openfl.geom.Point;

class TrBox extends Box {
	public var rowalign:String = "";			//(top || bottom || center)
	public var columnalign:String = ""; 			//(left || center || right)
	public var columnspacing:Float = -1;			// exact units or -1 default		
	
	private var childrenWidth:Array<Float>;
	private var finalColumnWidth:Array<Float>;
	
	public function new(parentBox:Box) {
		super(parentBox);
		children = new Array<Box>();
		childrenWidth = new Array<Float>();
	}
	
	public function addTd(newBox:Box):Void {
		children.push(newBox);
	}
	
	override public function calculate():Void {
		var childx:Float = 0;
		for (i in 0...children.length) {
			var child:Box = children[i];
			
			var cP:Point = new Point();
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y;
			child.calculateBox(cP);
			
			childx = childx + child.finalBounds.width + getColumnspacing();
			childrenWidth.push(child.finalBounds.width);
		}
	}
	
	public function calculateFinalBounds():Void {
		finalBounds.height = 0;
		finalBounds.y = children[0].finalBounds.y;
		var maxYPoint:Float = children[0].finalBounds.y + children[0].finalBounds.height;
		
		for (i in 0...children.length) {
			var child:Box = children[i];
			
			maxYPoint = Math.max(maxYPoint, child.finalBounds.y + child.finalBounds.height);
			finalBounds.y = Math.min(finalBounds.y, child.finalBounds.y);
		}
		
		finalBounds.height = maxYPoint - finalBounds.y;
		var lastChild:Box = children[children.length - 1];
		finalBounds.width=lastChild.finalBounds.x + lastChild.finalBounds.width - originPoint.x;
	}
	
	public function setFinalColumnWidth(_finalColumnWidth:Array<Float>):Void {
		finalColumnWidth = _finalColumnWidth;
		moveMyChildren();
		calculateFinalBounds();
	}
	
	override public function moveMyChildren():Void {
		var childx:Float = 0;
		for (i in 0...children.length) {
			var child:Box = children[i];
			
			var w:Float = child.finalBounds.width;
			var maxW:Float = finalColumnWidth[i];
			var dx:Float = (maxW - w) / 2;
			
			var tdBox:TdBox = cast child;
			if (tdBox.columnalign == "left") {
				dx = 0;
			} else if (tdBox.columnalign == "right") {
				dx = (maxW - w);
			}
			
			var cP:Point = new Point();
			cP.x = originPoint.x + childx + dx;
			cP.y = originPoint.y;
			child.moveOriginTo(cP);
			
			childx = childx + maxW + getColumnspacing();
		}
	}
	
	public function getChildrenWidth():Array<Float> {
		return childrenWidth;
	}
	
	public function getColumnspacing():Float {
		if (columnspacing == -1) {
			var w:Float = FontConstant.getWidth(style, "X");
			return 0.5 * w;
		}
		return columnspacing;
	}
	
	override public function copyParentStyle(_styleParent:Style):Void {
		super.copyParentStyle(_styleParent);	
		for (i in 0...children.length) {
			var child:Box = children[i];
			
			var tdBox:TdBox = cast child;
			if (tdBox.rowalign == "") { tdBox.rowalign = rowalign; }
			if (tdBox.columnalign == "") { tdBox.columnalign = columnalign; }
			
			child.copyParentStyle(this.style);
		}
	}
	
	override public function draw(graph:MovieClip):Void {
		for (i in 0...children.length) {
			var child:Box = children[i];
			child.drawBox(graph);
		}
	}
	
	override public function toString():String {
		var s:String = "TrBox " + finalBounds + " [";
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