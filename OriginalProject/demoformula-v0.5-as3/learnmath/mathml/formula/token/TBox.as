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

public class TBox extends TokenBox{
	public var text:String;
	
	public function	TBox(parentBox:Box):void{
		super(parentBox);
	}

	override public function calculate():void{
		text = EntityManager.replaceAllCode(text);
		DrawFormula.calculateText(finalBounds, text, style);
		finalBounds.y = finalBounds.y - finalBounds.height/2;
	}

	override public function draw(graph:MovieClip):void{
		var s:Point = new Point();
		s.x = originPoint.x;
		s.y = originPoint.y - finalBounds.height/2;
		DrawFormula.createText(graph, s, text, style);
	}

}

}