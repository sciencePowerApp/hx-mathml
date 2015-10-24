package learnmath.mathml.formula.token.operators.normal;
import openfl.display.MovieClip;

class ParOBox extends OBox {
	private var k:Float = 0.04;
	private var wl:Float = 1;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void{
		DrawFormula.calculateText(finalBounds, text, style);
		var h1:Float = FontConstant.getHeight(style, "X");
		var w1:Float = FontConstant.getWidth(style, "X");
		
		finalBounds.width=w1;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1 / 2;
	}
	
	override public function copyParentStyle(_styleParent:Style):Void{
		super.copyParentStyle(_styleParent);
	}
	
	override public function draw(graph:MovieClip):Void {
		graph.graphics.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width/3, finalBounds.y + finalBounds.height*0.2);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width/3, finalBounds.y + finalBounds.height*0.8);

		graph.graphics.moveTo(finalBounds.x+finalBounds.width*2/3, finalBounds.y + finalBounds.height*0.2);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*2/3, finalBounds.y + finalBounds.height*0.8);
		
	}
	
	override public function toString():String{
		return "DMinusPlusOBox";
	}
}