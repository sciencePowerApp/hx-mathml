package learnmath.mathml.formula.token.operators.normal;
import openfl.display.MovieClip;

class LlOBox extends OBox {
	private var k:Float = 0.04;
	private var wl:Float = 1;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void{
		DrawFormula.calculateText(finalBounds, text, style);
		var h1:Float = FontConstant.getHeight(style, "X");
		var w1:Float = FontConstant.getWidth(style, "X");
		
		finalBounds.width=w1*1.6;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1 / 2;
	}
	
	override public function copyParentStyle(_styleParent:Style):Void{
		super.copyParentStyle(_styleParent);
	}
	
	override public function draw(graph:MovieClip):Void{
		graph.graphics.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.45, finalBounds.y + finalBounds.height*0.70);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.05, finalBounds.y + finalBounds.height*0.5);
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.45, finalBounds.y + finalBounds.height*0.30);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.05, finalBounds.y + finalBounds.height*0.5);

		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.7, finalBounds.y + finalBounds.height*0.7);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.3, finalBounds.y + finalBounds.height*0.5);
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.7, finalBounds.y + finalBounds.height*0.3);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.3, finalBounds.y + finalBounds.height*0.5);

		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.95, finalBounds.y + finalBounds.height*0.7);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.55, finalBounds.y + finalBounds.height*0.5);
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.95, finalBounds.y + finalBounds.height*0.3);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.55, finalBounds.y + finalBounds.height*0.5);

	}
	
	override public function toString():String{
		return "LlOBox";
	}
}