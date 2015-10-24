package learnmath.mathml.formula.token;
import openfl.display.MovieClip;
import openfl.geom.Point;

class NBox extends TokenBox {
	public var number:String;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void{
		DrawFormula.calculateText(finalBounds, "" + number, style);
		finalBounds.y = finalBounds.y - finalBounds.height/2;
	}
	
	override public function draw(graph:MovieClip):Void {
		var s:Point = new Point();
		s.x = originPoint.x;
		s.y = originPoint.y - finalBounds.height/2;
		//DrawFormula.createText(graph, s, "" + number, style);
		drawText(graph, s, number);

	}
}