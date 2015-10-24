package learnmath.mathml.formula.token.operators.normal;
import learnmath.mathml.formula.util.DrawUtil;
import openfl.display.MovieClip;

class CircleTimesOBox extends OBox {
	private var k:Float = 0.04;
	private var wl:Float = 2;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void{
		DrawFormula.calculateText(finalBounds, text, style);
		var h1:Float = FontConstant.getHeight(style, "X");
		var w1:Float = FontConstant.getWidth(style, "X");
		
		finalBounds.width=w1*0.84;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1/2;
	}
	
	override public function copyParentStyle(_styleParent:Style):Void{
		super.copyParentStyle(_styleParent);
	}
	
	override public function draw(graph:MovieClip):Void {
		graph.graphics.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		var x:Float = finalBounds.x + finalBounds.width/2;
		var y:Float = finalBounds.y + finalBounds.height*0.55;
		var rx:Float = finalBounds.width/2 -2;
		
		DrawUtil.drawOval(graph, x, y, rx, rx);		

		wl = rx/1.44;
		graph.graphics.moveTo(finalBounds.x+finalBounds.width/2-wl, finalBounds.y + finalBounds.height*0.55 - wl);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width/2+wl, finalBounds.y + finalBounds.height*0.55 + wl);

		graph.graphics.moveTo(finalBounds.x+finalBounds.width/2+wl, finalBounds.y + finalBounds.height*0.55 - wl);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width/2-wl, finalBounds.y + finalBounds.height*0.55 + wl);
	}
	
	override public function toString():String{
		return "CircleTimesOBox";
	}
}