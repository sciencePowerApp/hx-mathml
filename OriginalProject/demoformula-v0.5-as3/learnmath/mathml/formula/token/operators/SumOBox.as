package learnmath.mathml.formula.token.operators{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import flash.geom.*;
import flash.display.MovieClip;

public class SumOBox extends OBox{

	private var addSize:Number = 3;
	private var k:Number = 20./45;
	private var l:Number = 1./50;

	public function	SumOBox(parentBox:Box):void{
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
		if(d<1){
			d=1;
		}
		var h1:Number = h/6;
		var g:Number = 3*d;
		
		graph.graphics.lineStyle(1, getHexColor(), 100);

		graph.graphics.beginFill(getHexColor());

		graph.graphics.moveTo(finalBounds.x+w, finalBounds.y + g+ h1);
		graph.graphics.lineTo(finalBounds.x+w, finalBounds.y + g);
		graph.graphics.lineTo(finalBounds.x, finalBounds.y + g);
		graph.graphics.lineTo(finalBounds.x+w/2+d*0.7, finalBounds.y+h/2 + g);
		graph.graphics.lineTo(finalBounds.x, finalBounds.y+h);
		graph.graphics.lineTo(finalBounds.x+w, finalBounds.y+h);
		graph.graphics.lineTo(finalBounds.x+w, finalBounds.y+h-h1);
		
		graph.graphics.lineTo(finalBounds.x+w-g, finalBounds.y+h-g);
		graph.graphics.lineTo(finalBounds.x+g, finalBounds.y+h-g);
		graph.graphics.lineTo(finalBounds.x+w/2+g, finalBounds.y+h/2);
		graph.graphics.lineTo(finalBounds.x+g, finalBounds.y + d + g);
		graph.graphics.lineTo(finalBounds.x+w-g, finalBounds.y+d + g);
		graph.graphics.moveTo(finalBounds.x+w, finalBounds.y + h1 + g);
		

		graph.graphics.endFill();		
		
		
		
	}
	
	override public function toString():String{
		return "SumOBox";
	}
	
}

}