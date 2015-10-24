package learnmath.mathml.formula;
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/

class ResizeBox {
	public static var children:Array<Box> = new Array<Box>();
	
	public static function clear():Void {
		children = new Array<Box>();	
	}
	
	public static function addBox(box:Box):Void {
		children.push(box);	
	}
	
	public static function resizeChildren():Void {
		for (child in children) {
			child.changeSizeFromParent();
		}
	}
}