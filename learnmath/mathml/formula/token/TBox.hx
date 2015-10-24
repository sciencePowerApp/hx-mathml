package learnmath.mathml.formula.token;
import openfl.display.MovieClip;
import openfl.geom.Point;

class TBox extends TokenBox {
	public var text:String;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void{
		text = EntityManager.replaceAllCode(text);
		DrawFormula.calculateText(finalBounds, text, style);
		finalBounds.y = finalBounds.y - finalBounds.height/2;
	}

	override public function draw(graph:MovieClip):Void {
		var s:Point = new Point();
		s.x = originPoint.x;
		s.y = originPoint.y - finalBounds.height/2;
		//DrawFormula.createText(graph, s, text, style);
		drawText(graph, s, text);
		
	}
}