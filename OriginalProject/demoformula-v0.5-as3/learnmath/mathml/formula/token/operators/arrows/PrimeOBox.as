package learnmath.mathml.formula.token.operators.arrows{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import flash.geom.*;
import flash.display.MovieClip;

public class PrimeOBox extends OBox{

	private var k:Number = 0.03;
	private var l:Number = 0.1;
	private var num:Number = 1;
	private var step:Number = 1;

	public function	PrimeOBox(parentBox:Box, n:Number){
		super(parentBox);
		num = n;
	}

	
	override public function calculate():void{
		DrawFormula.calculateText(finalBounds, text, style);
		var h1:Number = FontConstant.getHeight(style, "X");
		var w1:Number = FontConstant.getWidth(style, "X");
		
		step = w1/3;
		finalBounds.width=num*step;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1/2
	}
	
	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
	}

	
	override public function draw(graph:MovieClip):void{
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

}