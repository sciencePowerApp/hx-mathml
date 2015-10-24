package learnmath.mathml.formula.layout;
import openfl.display.MovieClip;

class PhantomBox extends RowBox {
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function draw(graph:MovieClip):Void {
	}
	
	override public function toString():String {
		return "PhantomBox";
	}
}