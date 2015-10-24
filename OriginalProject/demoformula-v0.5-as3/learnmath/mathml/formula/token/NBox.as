package learnmath.mathml.formula.token{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import flash.geom.*;
import flash.display.MovieClip;

public class NBox extends TokenBox{
	public var number:Number;
	
	
	public function	NBox(parentBox:Box):void{
		super(parentBox);
	}

	override public function calculate():void{
		DrawFormula.calculateText(finalBounds, "" + number, style);
		finalBounds.y = finalBounds.y - finalBounds.height/2;
	}
	
	override public function draw(graph:MovieClip):void{
		var s:Point = new Point();
		s.x = originPoint.x;
		s.y = originPoint.y - finalBounds.height/2;
		DrawFormula.createText(graph, s, "" + number, style);
	}
	
}

}