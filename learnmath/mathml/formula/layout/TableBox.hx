package learnmath.mathml.formula.layout;
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/

import learnmath.mathml.formula.Box;
import openfl.display.MovieClip;
import openfl.geom.Point;

class TableBox extends Box {
	public var rowalign:String = "";			// (top || bottom || center) 
	public var columnalign:String = ""; 			// (left || center || right)
	public var rowspacing:Float = -1;			// exact units or -1 default
	public var columnspacing:Float = -1;			// exact units or -1 default
	public var framespacing:Float = -1;			// exact units or -1 default
	
	private var childrenWidth:Array<Array<Float>>;
	private var finalColumnWidth:Array<Float>;
	
	public function new(parentBox:Box) {
		super(parentBox);
		children = new Array<Box>();
		childrenWidth = new Array<Array<Float>>();
	}
	
	public function addRow(newBox:Box):Void {
		children.push(newBox);
	}
	
	override public function calculate():Void {
		for (i in 0...children.length) {
			var child:Box = children[i];
			var cP:Point = new Point();
			child.calculateBox(cP);
			
			var trBox:TrBox = cast child;
			childrenWidth.push(trBox.getChildrenWidth());
		}
		
		calculateMaxColumnWidth();
		for (i in 0...children.length) {
			var child:Box = children[i];
			var trBox:TrBox = cast child;
			trBox.setFinalColumnWidth(finalColumnWidth);
		}
		
		finalBounds.width = 0;
		finalBounds.height = 2 * getFramespacing();
		
		for (i in 0...children.length) {
			var child:Box = children[i];
			finalBounds.height = finalBounds.height + child.finalBounds.height;
			if (i < (children.length - 1)) {
				finalBounds.height = finalBounds.height + getRowspacing();
			}
			
			finalBounds.width = Math.max(finalBounds.width, child.finalBounds.width);
		}
		
		finalBounds.width = finalBounds.width + 2 * getFramespacing();
		finalBounds.y = originPoint.y - finalBounds.height / 2;
		moveMyChildren();
	}
	
	override public function moveMyChildren():Void {
		var childy:Float = finalBounds.y + getFramespacing();	
		for (i in 0...children.length) {
			var child:Box = children[i];
			
			var cP:Point = new Point();
			cP.x = originPoint.x + getFramespacing();
			cP.y = childy + child.finalBounds.height / 2;
			
			child.moveOriginTo(cP);
			childy = childy + child.finalBounds.height + getRowspacing();
		}
	}
	
	public function getRowspacing():Float {
		if (rowspacing == -1) {	
			var h:Float = FontConstant.getHeight(style, "X");
			return 0.5 * h;
		}
		return rowspacing;
	}
	
	public function getFramespacing():Float {
		if (framespacing == -1) {
			var w:Float = FontConstant.getWidth(style, "X");
			return 0.2 * w;
		}
		return framespacing;
	}
	
	public function calculateMaxColumnWidth():Void {
		finalColumnWidth = childrenWidth[0];	
		for (i in 0...childrenWidth.length) {
			var childrenW:Array<Float> = childrenWidth[i];
			for (j in 0...childrenWidth.length) {
				finalColumnWidth[j] = Math.max(finalColumnWidth[j], childrenW[j]);
			}
		}
	}
	
	override public function copyParentStyle(_styleParent:Style):Void {
		super.copyParentStyle(_styleParent);	
		for (i in 0...children.length) {
			var child:Box = children[i];
			
			var trBox:TrBox = cast child;
			if (trBox.rowalign == "") { trBox.rowalign = rowalign; }
			if (trBox.columnalign == "") { trBox.columnalign = columnalign; }
			if (trBox.columnspacing == -1) { trBox.columnspacing = columnspacing; }
			
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
		var s:String = "TableBox " + finalBounds + " [";	
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