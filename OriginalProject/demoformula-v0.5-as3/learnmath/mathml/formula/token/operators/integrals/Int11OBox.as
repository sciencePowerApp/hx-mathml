package learnmath.mathml.formula.token.operators.integrals{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.token.operators.*;
import learnmath.mathml.formula.token.operators.integrals.*;
import learnmath.mathml.formula.script.*;
import learnmath.mathml.formula.util.*;
import flash.geom.*;
import flash.display.MovieClip;

public class Int11OBox extends IntOBox{

	public function	Int11OBox(parentBox:Box):void{
		//fpartint
		super(parentBox);
	}

	
	override public function draw(graph:MovieClip):void{
		super.draw(graph);
		
		var x:Number = finalBounds.x + finalBounds.width/2;
		var y:Number = finalBounds.y + finalBounds.height/2;
		var rx:Number = intWidth/4;
		
		graph.graphics.lineStyle(2*l*finalBounds.height, getHexColor(), 100);
		graph.graphics.moveTo(x + rx , y);
    		graph.graphics.lineTo(x - rx , y);

	}

	override public function toString():String{
		return "Int11OBox";
	}
}

}