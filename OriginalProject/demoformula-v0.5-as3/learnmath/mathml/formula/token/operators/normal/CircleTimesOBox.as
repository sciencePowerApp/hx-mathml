package learnmath.mathml.formula.token.operators.normal{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.script.*;
import learnmath.mathml.formula.util.*;
import flash.geom.*;
import flash.display.MovieClip;

public class CircleTimesOBox extends OBox{

	private var k:Number = 0.05;
	private var wl:Number = 2;

	public function	CircleTimesOBox(parentBox:Box):void{
		super(parentBox);
	}

	
	override public function calculate():void{
		DrawFormula.calculateText(finalBounds, text, style);
		var h1:Number = FontConstant.getHeight(style, "X");
		var w1:Number = FontConstant.getWidth(style, "X");
		
		finalBounds.width=w1*0.84;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1/2;
	}
	
	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
	}
	
	override public function draw(graph:MovieClip):void{
		graph.graphics.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		var x:Number = finalBounds.x + finalBounds.width/2;
		var y:Number = finalBounds.y + finalBounds.height*0.55;
		var rx:Number = finalBounds.width/2 -1;
		
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

}