package learnmath.mathml.formula.token.operators;
import learnmath.mathml.formula.util.DrawUtil;
import openfl.display.MovieClip;

class UnionOBox extends OBox {
	private var addSize:Float = 3;
	private var k:Float = 30./45;
	private var l:Float = 0.2;
	private var z:Float = 0.2;
	
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
		var d:Float = l*w;
				
		graph.graphics.lineStyle(d, getHexColor(), 100);
		
		var r:Float = (w - 2*d)/2;
		
		graph.graphics.moveTo(finalBounds.x + d, finalBounds.y + d);
		graph.graphics.lineTo(finalBounds.x + d, finalBounds.y + h - r - d);

		graph.graphics.moveTo(finalBounds.x + w - d, finalBounds.y + d);
		graph.graphics.lineTo(finalBounds.x + w - d, finalBounds.y + h - r - d);

    		DrawUtil.drawArc(graph, finalBounds.x + d, finalBounds.y + h - r - d, r, 180, 180);
    		

	}

	override public function toString():String{
		return "UnionOBox";
	}
}