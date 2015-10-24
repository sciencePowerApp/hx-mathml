package learnmath.mathml.formula.token.operators.arrows;
import openfl.display.MovieClip;

class RharuOBox extends LineOBox {
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function draw(graph:MovieClip):Void {
		super.draw(graph);
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width-wl, finalBounds.y + finalBounds.height/2);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width-3*wl, finalBounds.y + finalBounds.height/2-2*wl);
	}
	
	override public function toString():String{
		return "RharuOBox";
	}
}