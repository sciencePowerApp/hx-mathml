package learnmath.mathml.formula.token.operators.arrows;
import learnmath.mathml.formula.script.OverBox;
import learnmath.mathml.formula.script.UnderBox;
import learnmath.mathml.formula.script.UnderOverBox;
import openfl.display.MovieClip;

class LineOBox extends OBox {
	private var k:Float = 0.1;
	private var l:Float = 0.1;
	private var wl:Float = 1;
	private var prec:Float = 0.55;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void{
		DrawFormula.calculateText(finalBounds, text, style);
		var h1:Float = FontConstant.getHeight(style, "X");
		var w1:Float = FontConstant.getWidth(style, "X");

		finalBounds.width=1.5*w1;
		wl = finalBounds.width * l;
		if(minsize>-1){
			if(finalBounds.width<(minsize*w1)){
				finalBounds.width = minsize*w1;
			}
		}

		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1 / 2;
		ResizeBox.addBox(this);
	}
	
	override public function changeSizeFromParent():Void {
		var u:UnderBox = new UnderBox(parentBox);
		var o:OverBox = new OverBox(parentBox);
		var uo:UnderOverBox = new UnderOverBox(parentBox);
		if(Std.is(parentBox, UnderBox) || Std.is(parentBox, OverBox) || Std.is(parentBox, UnderOverBox)){
			var w1:Float = FontConstant.getWidth(style, "X");

			if(stretchy){
				var mSize:Int = Std.int(finalBounds.width);
				var newX:Float = finalBounds.x;
				if(parentBox.finalBounds.width>finalBounds.width){
					mSize = Std.int(parentBox.finalBounds.width);
					if(maxsize>-1 && mSize>(maxsize*w1)){
						mSize = Std.int(maxsize*w1);
					}
					finalBounds.width = mSize;
					finalBounds.x = parentBox.finalBounds.x  + (parentBox.finalBounds.width-mSize)/2;
				}
			}
			
		}
	}
	
	override public function copyParentStyle(_styleParent:Style):Void{
		super.copyParentStyle(_styleParent);
	}
	
	override public function draw(graph:MovieClip):Void{
		graph.graphics.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		graph.graphics.moveTo(finalBounds.x+wl, finalBounds.y + finalBounds.height*prec);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width-wl, finalBounds.y + finalBounds.height*prec);
	}
	
	override public function toString():String{
		return "LineOBox";
	}
}