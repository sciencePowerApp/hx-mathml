package learnmath.mathml.formula.token.operators;
import openfl.display.MovieClip;

class ProdOBox extends OBox {
	private var addSize:Float = 3;
	private var k:Float = 30./45;
	private var l:Float = 3./45;
	private var z:Float = 0.2;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void {
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
	
	override public function draw(graph:MovieClip):Void{
		var h:Float = finalBounds.height;
		var w:Float = finalBounds.width;
		var d:Float = l*h;
				
		var s:Float = d;
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