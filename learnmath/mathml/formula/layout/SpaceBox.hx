package learnmath.mathml.formula.layout;
import learnmath.mathml.formula.Box;
import openfl.display.MovieClip;

class SpaceBox extends Box {
	public var width:Int = 1;
	public var height:Int = 1;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	public override function calculate():Void {
		finalBounds.width = width;
		finalBounds.height = height;
		finalBounds.y = finalBounds.y - finalBounds.height / 2;
	}
	
	public override function draw(graph:MovieClip):Void {
	}
	
	override public function toString():String {
		return "SpaceBox";
	}
}