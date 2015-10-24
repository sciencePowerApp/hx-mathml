package learnmath.mathml.formula.token.operators{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.util.*;
import flash.geom.*;
import flash.display.MovieClip;

public class IntersectOBox extends OBox{

	private var addSize:Number = 3;
	private var k:Number = 30./45;
	private var l:Number = 0.2;
	private var z:Number = 0.2;

	public function	IntersectOBox(parentBox:Box):void{
		super(parentBox);
	}

	
	override public function calculate():void{
		var h:Number = FontConstant.getHeight(style, "X");
		finalBounds.width=k*h;
		finalBounds.height=h;
		finalBounds.y=finalBounds.y-finalBounds.height/2;
		ResizeBox.addBox(this);
	}
	
	
	override public function changeSizeFromParent():void{
		resizeFromParent();
	}
	
	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
		this.style.size = this.style.size + addSize;
	}
	
	override public function draw(graph:MovieClip):void{
		var h:Number = finalBounds.height;
		var w:Number = finalBounds.width
		var d:Number = l*w;
				
		graph.graphics.lineStyle(d, getHexColor(), 100);
		
		var r:Number = (w - 2*d)/2;
		
		graph.graphics.moveTo(finalBounds.x + d, finalBounds.y + h - d);
		graph.graphics.lineTo(finalBounds.x + d, finalBounds.y + r + d);

		graph.graphics.moveTo(finalBounds.x + w - d, finalBounds.y + h -d );
		graph.graphics.lineTo(finalBounds.x + w - d, finalBounds.y + r + d);

    		DrawUtil.drawArc(graph, finalBounds.x + w - d, finalBounds.y + r + d, r, 180, 0);
    		

	}

	override public function toString():String{
		return "IntersectOBox";
	}
}

}