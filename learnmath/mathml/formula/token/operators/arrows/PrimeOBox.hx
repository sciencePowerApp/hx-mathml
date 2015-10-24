package learnmath.mathml.formula.token.operators.arrows;
import openfl.display.MovieClip;

class PrimeOBox extends OBox {
	private var k:Float = 0.03;
	private var l:Float = 0.1;
	private var num:Float = 1;
	private var step:Float = 1;
	
	public function new(parentBox:Box, n:Float) {
		super(parentBox);
		num = n;
	}
	
	override public function calculate():Void{
		DrawFormula.calculateText(finalBounds, text, style);
		var h1:Float = FontConstant.getHeight(style, "X");
		var w1:Float = FontConstant.getWidth(style, "X");
		
		step = w1/3;
		finalBounds.width=num*step;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1 / 2;
	}
	
	override public function copyParentStyle(_styleParent:Style):Void{
		super.copyParentStyle(_styleParent);
	}

	
	override public function draw(graph:MovieClip):Void {
		graph.graphics.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		graph.graphics.moveTo(finalBounds.x+step, finalBounds.y + finalBounds.height/3);
		graph.graphics.lineTo(finalBounds.x, finalBounds.y + finalBounds.height - finalBounds.height/3);
		if(num>1){
			graph.graphics.moveTo(finalBounds.x+2*step, finalBounds.y + finalBounds.height/3);
			graph.graphics.lineTo(finalBounds.x + step, finalBounds.y + finalBounds.height - finalBounds.height/3);
		}
		if(num>2){
			graph.graphics.moveTo(finalBounds.x+3*step, finalBounds.y + finalBounds.height/3);
			graph.graphics.lineTo(finalBounds.x +2*step, finalBounds.y + finalBounds.height - finalBounds.height/3);
		}
		
	}
	
	override public function toString():String{
		return "PrimeOBox";
	}
}