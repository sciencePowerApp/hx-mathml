package learnmath.mathml.formula.token.operators.arrows;
import learnmath.mathml.formula.script.OverBox;
import learnmath.mathml.formula.script.UnderBox;
import learnmath.mathml.formula.script.UnderOverBox;
import openfl.display.MovieClip;

class HatOBox extends OBox {
	private var k:Float = 0.1;
	private var l:Float = 0.1;
	private var wl:Float = 1;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void{
		DrawFormula.calculateText(finalBounds, text, style);
		var h1:Float = FontConstant.getHeight(style, "X");
		var w1:Float = FontConstant.getWidth(style, "X");
		
		finalBounds.width=w1;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1 / 2;
		wl = finalBounds.width * l;
		ResizeBox.addBox(this);
	}
	
	override public function changeSizeFromParent():Void {
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
	
	override public function copyParentStyle(_styleParent:Style):Void{
		super.copyParentStyle(_styleParent);
	}
	
	override public function draw(graph:MovieClip):Void{
		graph.graphics.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		graph.graphics.moveTo(finalBounds.x+wl, finalBounds.y + finalBounds.height*3/4);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width/2, finalBounds.y + finalBounds.height*0.4);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width-wl, finalBounds.y + finalBounds.height*3/4);
	}
	
	override public function toString():String{
		return "HatOBox";
	}
}