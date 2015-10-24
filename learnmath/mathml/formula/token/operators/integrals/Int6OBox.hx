package learnmath.mathml.formula.token.operators.integrals;
import learnmath.mathml.formula.util.DrawUtil;
import openfl.display.MovieClip;

class Int6OBox  extends Int2OBox {
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function draw(graph:MovieClip):Void {
		super.draw(graph);
		var x:Float = finalBounds.x + finalBounds.width/2;
		var y:Float = finalBounds.y + finalBounds.height/2;
		var rx:Float = intWidth/4;		

		DrawUtil.drawOval(graph, x, y, rx*1.66, rx);
	}

	override public function toString():String{
		return "Int6OBox";
	}
}