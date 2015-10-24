package learnmath.mathml.formula.layout;
import openfl.display.MovieClip;
import openfl.geom.Point;

class PaddedBox extends RowBox {
	public var widthS:String = "";
	public var lspaceS:String = "";
	public var heightS:String = "";
	public var depthS:String = "";

	public var width:Int;
	public var lspace:Int;
	public var height:Int;
	public var depth:Int;

	public var moveY:Int = 0;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	public override function calculate():Void {
		super.calculate();
		
		width = calcValue(widthS, Std.int(finalBounds.width));
		lspace = calcValue(lspaceS, Std.int(finalBounds.width));
		height = calcValue(heightS, Std.int(finalBounds.height));
		depth = calcValue(depthS, Std.int(finalBounds.height));
		
		if (lspace > 0) {
			finalBounds.width = finalBounds.width + lspace;	
		}
		if (width > 0 && width > finalBounds.width) {
			finalBounds.width = width;	
		}
		if (depth > 0) {
			finalBounds.height = finalBounds.height + depth;	
		}
		if (height > 0 && height > finalBounds.height) {
			moveY = Std.int(height - finalBounds.height);	
			finalBounds.height = height;
		}
		
		moveMyChildren();
	}
	
	override public function moveMyChildren():Void {
		var cP:Point = new Point();	
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		
		var childx:Float = 0;
		var childy:Float = 0;
		if (lspace > 0) {
			childx = lspace;	
		}
		if (moveY > 0) {
			childy = moveY;	
		}
		
		for (i in 0...children.length) {
			var child:Box = children[i];
			
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y + childy;
			child.moveOriginTo(cP);
			childx = childx + child.finalBounds.width;
		}
	}
	
	public override function draw(graph:MovieClip):Void {
		super.draw(graph);	
	}
	
	override public function toString():String {
		return "PaddedBox";
	}
	
	public function calcValue(number:String, def:Int):Int {
		if (number.indexOf("%") > -1) {	
			var s:String = number.substring(0, number.indexOf("%"));
			var n:Int = Std.parseInt(s);
			return Std.int(n / 100 * def);
		} else {
			return Std.parseInt(number);
		}
	}
}