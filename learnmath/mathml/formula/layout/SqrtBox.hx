package learnmath.mathml.formula.layout;
import openfl.display.MovieClip;
import openfl.geom.Point;

class SqrtBox extends RowBox {

	public var linethickness:Float = 1.5;
	private var kLine:Float = 0.06;		
	
	private var widthR:Float = 3;
	private var kWR:Float = 0.17;		
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void {
		super.calculate();
		
		widthR = finalBounds.height * kWR;
		
		finalBounds.width = finalBounds.width + widthR;
		var s:Float = getTinethickness(linethickness, kLine);
		finalBounds.y = finalBounds.y - s;
		finalBounds.height = finalBounds.height + s;
		moveMyChildren();
	}
	
	override public function moveMyChildren():Void {
		var childx:Float = widthR;	
		for (i in 0...children.length) {
			var child:Box = children[i];
			
			var cP:Point = new Point();
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y;
			
			child.moveOriginTo(cP);
			childx = childx + child.finalBounds.width;
		}
	}
	
	override public function draw(graph:MovieClip):Void {
		super.draw(graph);	
		var s:Float = getTinethickness(linethickness, kLine);
		graph.graphics.lineStyle(s, getHexColor(), 100);
		graph.graphics.moveTo(finalBounds.x, finalBounds.y + 2 * widthR);
		graph.graphics.lineTo(finalBounds.x + (widthR / 2), finalBounds.y + finalBounds.height);
		graph.graphics.lineTo(finalBounds.x + widthR, finalBounds.y + s / 2 + 1);
		graph.graphics.lineTo(finalBounds.x + finalBounds.width, finalBounds.y + s / 2 + 1);
	}
	
	override public function toString():String {
		return "SqrtBox";
	}
}