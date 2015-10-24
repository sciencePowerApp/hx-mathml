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

public class Int4OBox extends IntOBox{

	public function	Int4OBox(parentBox:Box):void{
		//oint
		super(parentBox);
	}

	
	override public function draw(graph:MovieClip):void{
		super.draw(graph);
		
		var x:Number = finalBounds.x + finalBounds.width/2;
		var y:Number = finalBounds.y + finalBounds.height/2;
		var rx:Number = intWidth/3;		
		
		DrawUtil.drawOval(graph, x, y, rx, rx);
	}

	override public function toString():String{
		return "Int4OBox";
	}
}

}