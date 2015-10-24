package learnmath.mathml.formula.token;
import learnmath.mathml.formula.EntityManager;
import openfl.display.MovieClip;
import openfl.geom.Point;

class IBox extends TokenBox {
	public var text:String;
	
	public function new(parentBox:Box) {
		super(parentBox);
		style.fontstyle = "italic";
	}
	
	override public function draw(graph:MovieClip):Void {
		var s:Point = new Point();
		s.x = originPoint.x;
		s.y = originPoint.y - finalBounds.height / 2;
		drawText(graph, s, text);		
	}
	
	override public function calculate():Void {
		text = EntityManager.replaceAllCode(text);	
		DrawFormula.calculateText(finalBounds, text, style);
		finalBounds.y = finalBounds.y - finalBounds.height / 2;
	}
}