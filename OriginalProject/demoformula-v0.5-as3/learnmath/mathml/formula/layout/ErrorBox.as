package learnmath.mathml.formula.layout{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import flash.geom.*;

public class ErrorBox extends RowBox{
	
	public function	ErrorBox(parentBox:Box):void{
		super(parentBox);
	}
	
	
	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];
			child.copyParentStyle(this.style);
		}
	}

	override public function toString():String{
		return "ErrorBox";
	}
	
}

}