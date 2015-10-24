package learnmath.mathml.formula{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.text.TextField;
import learnmath.mathml.formula.*;
import flash.events.MouseEvent;
import flash.geom.*;
import flash.display.MovieClip;

public class DrawFormula{
	private var parentBox:Box;
	public static var index:Number = 0;
	private var mc:MovieClip;
	
	
	public function DrawFormula(box:Box):void{
		parentBox=box;
	}
	
	public function clear(graph:MovieClip):void{
		if(mc!=null){
			//removeMovieClip(mc);
			mc.graphics.clear();
		}
	}
	
	public function draw(graph:MovieClip, style:Style, leftMiddlePoint:Point):Rectangle{

		if(mc==null){
			mc = new MovieClip();
			mc.name = "mc" + index;
			graph.addChild(mc);
		}

		ResizeBox.clear();
		parentBox.copyParentStyle(style);
		parentBox.calculateBox(leftMiddlePoint);
		ResizeBox.resizeChildren();
		parentBox.draw(mc);

		return parentBox.finalBounds.clone();
		
	}
	
	public static function createText(graph:MovieClip, startPoint:Point, text:String, style:Style):void{
		var width:Number = FontConstant.getWidth(style, text);
		var height:Number = FontConstant.getHeight(style, text);
		var l:TextField = new TextField();
		l.name = "g" + index;
		l.width = width;
		l.height = height;
		//graph.createTextField("g" + index, graph.getNextHighestDepth(), 0, 0, width, height);
		//var l:TextField = eval("graph.g" + index);
		l.selectable = false;
		l.x = startPoint.x;
		l.y = startPoint.y;
		l.text = text;
		l.setTextFormat(FontConstant.getTextFormat(style));
		graph.addChild(l);
		index = index + 1;
	}
	
	public static function calculateText(bounds:Rectangle, text:String, style:Style):void{
		bounds.width = FontConstant.getWidth(style, text);
		bounds.height = FontConstant.getHeight(style, text);
	}
	
	public static function drawRectangle(graph:MovieClip, bounds:Rectangle):void{
		graph.graphics.lineStyle(1, 0x000000, 100);
		graph.graphics.moveTo(bounds.x, bounds.y);
		graph.graphics.lineTo(bounds.x + bounds.width, bounds.y);
		graph.graphics.lineTo(bounds.x + bounds.width, bounds.y + bounds.height);
		graph.graphics.lineTo(bounds.x, bounds.y + bounds.height);
		graph.graphics.lineTo(bounds.x, bounds.y);

	}
	
}

}