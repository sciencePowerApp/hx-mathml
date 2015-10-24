package learnmath.mathml.formula{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.geom.*;
import learnmath.mathml.formula.*;

public class ResizeBox{
	

	public static var children:Array = new Array();
	

	public static function clear():void{
		children = new Array();
	}

	public static function addBox(box:Box):void{
		children[children.length] = box;
	}


	public static function resizeChildren():void{
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];
			child.changeSizeFromParent();
		}
	}


}

}