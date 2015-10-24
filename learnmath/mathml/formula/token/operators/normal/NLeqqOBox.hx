package learnmath.mathml.formula.token.operators.normal;
import openfl.display.MovieClip;

class NLeqqOBox extends OBox {
	private var k:Float = 0.03;
	private var wl:Float = 1;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void{
		DrawFormula.calculateText(finalBounds, text, style);
		var h1:Float = FontConstant.getHeight(style, "X");
		var w1:Float = FontConstant.getWidth(style, "X");
		
		finalBounds.width=w1*1.3;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1 / 2;
	}
	
	override public function copyParentStyle(_styleParent:Style):Void{
		super.copyParentStyle(_styleParent);
	}
	
	override public function draw(graph:MovieClip):Void {
		graph.graphics.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.2, finalBounds.y + finalBounds.height*0.35);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.8, finalBounds.y + finalBounds.height*0.15);
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.2, finalBounds.y + finalBounds.height*0.35);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.8, finalBounds.y + finalBounds.height*0.55);

		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.2, finalBounds.y + finalBounds.height*0.6);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.8, finalBounds.y + finalBounds.height*0.6);

		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.2, finalBounds.y + finalBounds.height*0.75);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.8, finalBounds.y + finalBounds.height*0.75);

		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.75, finalBounds.y + finalBounds.height*0.1);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.25, finalBounds.y + finalBounds.height*0.9);
	}
	
	override public function toString():String{
		return "GgOBox";
	}
}