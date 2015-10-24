package learnmath.mathml.formula.token.operators.arrows{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.token.operators.arrows.*;
import flash.geom.*;
import flash.display.MovieClip;

public class RharuOBox extends LineOBox{

	public function	RharuOBox(parentBox:Box):void{
		super(parentBox);
	}

	
	override public function draw(graph:MovieClip):void{
		super.draw(graph)
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width-wl, finalBounds.y + finalBounds.height/2);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width-3*wl, finalBounds.y + finalBounds.height/2-2*wl);
	}
	
	override public function toString():String{
		return "RharuOBox";
	}
	
}

}