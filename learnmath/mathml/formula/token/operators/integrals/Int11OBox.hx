package learnmath.mathml.formula.token.operators.integrals;
import openfl.display.MovieClip;

class Int11OBox extends IntOBox {
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function draw(graph:MovieClip):Void {
		super.draw(graph);
		
		var x:Float = finalBounds.x + finalBounds.width/2;
		var y:Float = finalBounds.y + finalBounds.height/2;
		var rx:Float = intWidth/4;
		
		graph.graphics.lineStyle(2*l*finalBounds.height, getHexColor(), 100);
		graph.graphics.moveTo(x + rx , y);
    		graph.graphics.lineTo(x - rx , y);

	}

	override public function toString():String{
		return "Int11OBox";
	}
}