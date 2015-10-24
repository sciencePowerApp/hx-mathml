package learnmath.mathml.formula.layout{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import flash.geom.*;
import flash.display.MovieClip;

public class PhantomBox extends RowBox{
	
	public function	PhantomBox(parentBox:Box){
		super(parentBox);
	}
	
	
	override public function draw(graph:MovieClip):void{
	}

	override public function toString():String{
		return "PhantomBox";
	}
	
}

}