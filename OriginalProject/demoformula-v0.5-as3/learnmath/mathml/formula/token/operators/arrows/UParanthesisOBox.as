package learnmath.mathml.formula.token.operators.arrows{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.script.*;
import flash.geom.*;
import flash.display.MovieClip;

public class UParanthesisOBox extends OBox{

	private var k:Number = 0.1;
	private var l:Number = 0.1;
	private var wl:Number = 1;

	public function	UParanthesisOBox(parentBox:Box):void{
		super(parentBox);
	}

	
	override public function calculate():void{
		DrawFormula.calculateText(finalBounds, text, style);
		var h1:Number = FontConstant.getHeight(style, "X");
		var w1:Number = FontConstant.getWidth(style, "X");
		
		finalBounds.width=w1;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1/2
		wl = finalBounds.width * l;
		ResizeBox.addBox(this);
	}
	
	override public function changeSizeFromParent():void{
		var u:UnderBox = new UnderBox(parentBox);
		var o:OverBox = new OverBox(parentBox);
		var uo:UnderOverBox = new UnderOverBox(parentBox);
		if(u!=null || o!=null || uo!=null){
			if(parentBox.finalBounds.width>finalBounds.width){
				finalBounds.width = parentBox.finalBounds.width;
				finalBounds.x = parentBox.finalBounds.x;
			}
		}
	}
	
	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
	}
	
	override public function draw(graph:MovieClip):void{
		graph.graphics.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		graph.graphics.moveTo(finalBounds.x, finalBounds.y + finalBounds.height*0.1);
		graph.graphics.curveTo(finalBounds.x+finalBounds.width/2, finalBounds.y + finalBounds.height*0.5, finalBounds.x+finalBounds.width, finalBounds.y+ finalBounds.height*0.1);
	}
	
	override public function toString():String{
		return "UParanthesisOBox";
	}
	
}

}