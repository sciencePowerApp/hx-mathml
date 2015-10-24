package learnmath.mathml.formula.token.operators.integrals;
import openfl.display.MovieClip;

class Int8OBox extends Int4OBox {
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function draw(graph:MovieClip):Void {
		super.draw(graph);
		var x:Float = finalBounds.x + finalBounds.width/2;
		var y:Float = finalBounds.y + finalBounds.height/2;
		var rx:Float = intWidth/3;
		
		graph.graphics.lineStyle(1.7*l*finalBounds.height, getHexColor(), 100);
		graph.graphics.moveTo(x + rx, y -1);
    		graph.graphics.lineTo(x + rx +rx/2, y+rx/2);
		graph.graphics.moveTo(x + rx , y -1);
    		graph.graphics.lineTo(x + rx -rx/2, y+rx/2);
	}

	override public function toString():String{
		return "Int8OBox";
	}
}