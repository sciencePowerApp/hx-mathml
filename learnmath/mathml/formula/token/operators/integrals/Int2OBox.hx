package learnmath.mathml.formula.token.operators.integrals;
import openfl.display.MovieClip;

class Int2OBox extends IntOBox {
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void {
		var h1:Float = FontConstant.getHeight(style, "X");
		step = h1/10;
		finalBounds.width=k*h1 + 2*step;
		intWidth = k*h1;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - finalBounds.height / 2;
	}
	
	override public function draw(graph:MovieClip):Void{
		drawIntegral(graph, finalBounds.x, finalBounds.y, finalBounds.width - 2 * step, finalBounds.height);
		drawIntegral(graph, finalBounds.x + step, finalBounds.y, finalBounds.width - 2 * step, finalBounds.height);
		drawIntegral(graph, finalBounds.x + 2 * step, finalBounds.y, finalBounds.width - 2 * step, finalBounds.height);
	}

	override public function toString():String{
		return "Int2OBox";
	}
}