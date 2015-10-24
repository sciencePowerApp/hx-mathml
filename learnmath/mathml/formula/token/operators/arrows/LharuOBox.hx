package learnmath.mathml.formula.token.operators.arrows;
import openfl.display.MovieClip;

class LharuOBox extends LineOBox {
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function draw(graph:MovieClip):Void {
		super.draw(graph);
		
		graph.graphics.moveTo(finalBounds.x+wl, finalBounds.y + finalBounds.height*prec);
		graph.graphics.lineTo(finalBounds.x+3*wl, finalBounds.y + finalBounds.height*prec-2*wl);
	}
	
	override public function toString():String{
		return "LharuOBox";
	}
}