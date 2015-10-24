package learnmath.mathml.formula.token.operators;
import openfl.display.MovieClip;

class SumOBox extends OBox {
	private var addSize:Float = 3;
	private var k:Float = 20./45;
	private var l:Float = 1. / 50;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void{
		var h:Float = FontConstant.getHeight(style, "X");
		finalBounds.width=k*h;
		finalBounds.height=h;
		finalBounds.y=finalBounds.y-finalBounds.height/2;
		//ResizeBox.addBox(this);
	}
	
	override public function changeSizeFromParent():Void{
		resizeFromParent();
	}
	
	override public function copyParentStyle(_styleParent:Style):Void{
		super.copyParentStyle(_styleParent);
		this.style.size = Std.int(this.style.size + addSize);
	}
	
	override public function draw(graph:MovieClip):Void {
		var h:Float = finalBounds.height;
		var w:Float = finalBounds.width;
		var d:Float = l*h;
		if(d<1){
			d=1;
		}
		var h1:Float = h/6;
		var g:Float = 3*d;
		
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