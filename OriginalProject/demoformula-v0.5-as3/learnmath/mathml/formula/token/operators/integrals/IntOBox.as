package learnmath.mathml.formula.token.operators.integrals{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.script.*;
import learnmath.mathml.formula.util.*;
import flash.geom.*;
import flash.display.MovieClip;

public class IntOBox extends OBox{

	private var addSize:Number = 8;
	protected var k:Number = 0.4;
	protected var l:Number = 1./45;
	private var r:Number = 0.1;

	protected var intWidth:Number = 0;
	protected var step:Number = 0;
	
	public function	IntOBox(parentBox:Box):void{
		super(parentBox);
	}

	
	override public function calculate():void{
		var h1:Number = FontConstant.getHeight(style, "X");
		finalBounds.width=k*h1;
		intWidth = k*h1;
		finalBounds.height=h1;
		finalBounds.y=finalBounds.y-finalBounds.height/2;
		ResizeBox.addBox(this);
	}
	
	override public function changeSizeFromParent():void{
		resizeFromParent();
		
		var s:SubSupBox = SubSupBox(parentBox);
		if(s.sub!=null){
			var cP:Point = new Point();
			cP.x = s.sub.originPoint.x - finalBounds.width/4;
			cP.y = s.sub.originPoint.y;
			s.sub.moveOriginTo(cP);

			if((s.exp.finalBounds.x + s.exp.finalBounds.width)>s.sub.finalBounds.x + s.sub.finalBounds.width){
				s.finalBounds.width = s.exp.finalBounds.x + s.exp.finalBounds.width - s.base.finalBounds.x;
			}else{
				s.finalBounds.width = s.sub.finalBounds.x + s.sub.finalBounds.width - s.base.finalBounds.x;
			}
		}
		
	}
	


	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
		this.style.size = this.style.size + addSize;
	}
	
	override public function draw(graph:MovieClip):void{
		drawIntegral(graph, finalBounds.x, finalBounds.y, finalBounds.width, finalBounds.height)
	}

	public function drawIntegral(graph:MovieClip, x:Number, y:Number, w:Number, h:Number):void{
		var rr:Number = r*w;
		var g:Number = r*h/3;
		graph.graphics.lineStyle(l*h, getHexColor(), 100);
		graph.graphics.moveTo(x + w, y + rr);
    		graph.graphics.curveTo(x + w - rr, y ,x + w - 2*rr, y + rr);
    		
    		DrawUtil.drawOval(graph, x + w -rr/2, y + rr, rr/2, rr/2);

		graph.graphics.moveTo(x + w - 2*rr, y + rr);
    		graph.graphics.curveTo(x + w/2 + g, y+h/2, x+2*rr, y + h - rr);
    		
		graph.graphics.moveTo(x + w - 2*rr, y + rr);
    		graph.graphics.curveTo(x + w/2 - g, y+h/2, x+2*rr, y + h - rr);
    		
    		graph.graphics.moveTo(x + w - 2*rr, y + rr);
    		graph.graphics.lineTo(x+2*rr, y + h - rr);

		graph.graphics.moveTo(x+2*rr, y + h - rr);
    		graph.graphics.curveTo(x+ rr, y + h , x, y + h - rr);

    		DrawUtil.drawOval(graph, x + rr/2, y + h - rr, rr/2, rr/2);
    		
    	}

	override public function toString():String{
		return "IntOBox";
	}
}

}