package learnmath.mathml.formula.token.operators.normal{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.script.*;
import flash.geom.*;
import flash.display.MovieClip;

public class GgOBox extends OBox{

	private var k:Number = 0.08;
	private var wl:Number = 1;

	public function	GgOBox(parentBox:Box):void{
		super(parentBox);
	}

	
	override public function calculate():void{
		DrawFormula.calculateText(finalBounds, text, style);
		var h1:Number = FontConstant.getHeight(style, "X");
		var w1:Number = FontConstant.getWidth(style, "X");
		
		finalBounds.width=w1*1.3;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1/2
	}
	
	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
	}
	
	override public function draw(graph:MovieClip):void{
		graph.graphics.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		wl = finalBounds.width*0.6;
		
		var step:Number = wl*0.35;
		graph.graphics.moveTo(finalBounds.x+finalBounds.width/2-wl/2, finalBounds.y + finalBounds.height*0.5-wl/3);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width/2, finalBounds.y + finalBounds.height*0.5);
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width/2-wl/2, finalBounds.y + finalBounds.height*0.5+wl/3);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width/2, finalBounds.y + finalBounds.height*0.5);

		graph.graphics.moveTo(finalBounds.x+finalBounds.width/2-wl/2 + step, finalBounds.y + finalBounds.height*0.5-wl/3);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width/2 + step, finalBounds.y + finalBounds.height*0.5);
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width/2-wl/2 + step, finalBounds.y + finalBounds.height*0.5+wl/3);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width/2 + step, finalBounds.y + finalBounds.height*0.5);

		graph.graphics.moveTo(finalBounds.x+finalBounds.width/2-wl/2 + 2*step, finalBounds.y + finalBounds.height*0.5-wl/3);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width/2 + 2*step, finalBounds.y + finalBounds.height*0.5);
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width/2-wl/2 + 2*step, finalBounds.y + finalBounds.height*0.5+wl/3);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width/2 + 2*step, finalBounds.y + finalBounds.height*0.5);

	}
	
	override public function toString():String{
		return "GgOBox";
	}
	
}

}