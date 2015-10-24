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

public class SqrtBox extends RowBox{
	
	public var linethickness:Number = 1;
	private var kLine:Number = 0.06;		
	
	private var widthR:Number = 3;
	private var kWR:Number = 0.17;		
	
	public function	SqrtBox(parentBox:Box):void{
		super(parentBox);
	}
	
	
	override public function calculate():void{
		super.calculate();

		widthR = finalBounds.height * kWR;

		finalBounds.width=finalBounds.width + widthR;
		var s:Number = getTinethickness(linethickness, kLine);
		finalBounds.y = finalBounds.y - s;
		finalBounds.height=finalBounds.height + s;
		moveMyChildren();
	}


	override public function moveMyChildren():void{
		var childx:Number = widthR;
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];
			
			var cP:Point = new Point();
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y;
			
			child.moveOriginTo(cP);
			childx = childx + child.finalBounds.width;
		}
	}



	override public function draw(graph:MovieClip):void{
		super.draw(graph);
		var s:Number = getTinethickness(linethickness, kLine);
		graph.graphics.lineStyle(s, getHexColor(), 100);
		graph.graphics.moveTo(finalBounds.x, finalBounds.y+ 2*widthR);
		graph.graphics.lineTo(finalBounds.x + (widthR/2), finalBounds.y + finalBounds.height);
		graph.graphics.lineTo(finalBounds.x + widthR, finalBounds.y + s/2+1);
		graph.graphics.lineTo(finalBounds.x + finalBounds.width, finalBounds.y + s/2+1);
	}

	override public function toString():String{
		return "SqrtBox";
	}
	
}

}