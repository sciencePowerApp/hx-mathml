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

public class Int5OBox extends Int1OBox{

	public function	Int5OBox(parentBox:Box):void{
		super(parentBox);
	}

	
	
	override public function draw(graph:MovieClip):void{
		super.draw(graph);
		var x:Number = finalBounds.x + finalBounds.width/2;
		var y:Number = finalBounds.y + finalBounds.height/2;
		var rx:Number = intWidth/4;		
		
		DrawUtil.drawOval(graph, x, y, rx*1.33, rx);
	}
	

	override public function toString():String{
		return "Int5OBox";
	}
}

}