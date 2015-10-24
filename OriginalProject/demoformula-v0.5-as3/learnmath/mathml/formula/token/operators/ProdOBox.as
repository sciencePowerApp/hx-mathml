package learnmath.mathml.formula.token.operators{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import flash.geom.*;
import flash.display.MovieClip

public class ProdOBox extends OBox{

	private var addSize:Number = 3;
	private var k:Number = 30./45;
	private var l:Number = 3./45;
	private var z:Number = 0.2;

	public function	ProdOBox(parentBox:Box):void{
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
		var d:Number = l*h;
				
		var s:Number = d;
		if(s<2){
			s=2;
		}
		if(s>5){
			s=5;
			d=5;
		}
		graph.graphics.lineStyle(s, getHexColor(), 100);

		graph.graphics.moveTo(finalBounds.x+w, finalBounds.y + 2*d);
		graph.graphics.lineTo(finalBounds.x, finalBounds.y + 2*d);
		
		graph.graphics.lineStyle(2*s, getHexColor(), 100);
		graph.graphics.moveTo(finalBounds.x+ w*z, finalBounds.y + d*5/2);
		graph.graphics.lineTo(finalBounds.x+ w*z, finalBounds.y + h - d*3/2 );
		
		graph.graphics.lineStyle(s, getHexColor(), 100);
		graph.graphics.moveTo(finalBounds.x+ w*z-d, finalBounds.y + h - d);
		graph.graphics.lineTo(finalBounds.x+ w*z+d, finalBounds.y + h - d );
		
		graph.graphics.lineStyle(2*s, getHexColor(), 100);
		graph.graphics.moveTo(finalBounds.x + w*(1-z), finalBounds.y + d*5/2);
		graph.graphics.lineTo(finalBounds.x + w*(1-z), finalBounds.y + h - d*3/2);
		
		graph.graphics.lineStyle(s, getHexColor(), 100);
		graph.graphics.moveTo(finalBounds.x + w*(1-z) -d, finalBounds.y + h - d);
		graph.graphics.lineTo(finalBounds.x + w*(1-z) +d, finalBounds.y + h - d );
	}

	override public function toString():String{
		return "ProdOBox";
	}
}

}