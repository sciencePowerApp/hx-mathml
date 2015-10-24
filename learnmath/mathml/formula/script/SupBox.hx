package learnmath.mathml.formula.script;
import learnmath.mathml.formula.Box;
import learnmath.mathml.formula.layout.FracBox;
import openfl.display.MovieClip;
import openfl.geom.Point;

class SupBox extends Box {
	public var base:Box;
	public var exp:Box;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void {
		var cP:Point = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.calculateBox(cP);
		
		var cE:Point = new Point();
		cE.x = originPoint.x + base.finalBounds.width;
		if (Std.is(exp, FracBox)) {
			cE.y = originPoint.y - base.finalBounds.height/2;
		} else {
			cE.y = originPoint.y - base.finalBounds.height/3;
		}
		exp.calculateBox(cE);
		
		finalBounds.x = base.finalBounds.x;
		finalBounds.y = exp.finalBounds.y;
		finalBounds.width = base.finalBounds.width + exp.finalBounds.width;
		finalBounds.height = base.finalBounds.y + base.finalBounds.height - exp.finalBounds.y;
	}
	
	override public function moveMyChildren():Void {
		var cP:Point = new Point();	
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.moveOriginTo(cP);
		
		var cS:Point = new Point();
		cS.x = originPoint.x + base.finalBounds.width;
		if (Std.is(exp, FracBox)) {
			cS.y = originPoint.y - base.finalBounds.height / 2;
		} else {
			cS.y = originPoint.y - base.finalBounds.height / 3;
		}
		exp.moveOriginTo(cS);
	}
	
	override public function copyParentStyle(_styleParent:Style):Void {
		var s:Int = 3;
		if (Std.is(exp, FracBox)) { s = 5; }
		super.copyParentStyle(_styleParent);
		base.copyParentStyle(this.style);
		var newStyle:Style = this.style.getCopy();
		newStyle.size = newStyle.size - s;
		newStyle.fontweight = 'bold';
		exp.copyParentStyle(newStyle);
	}
	
	override public function draw(graph:MovieClip):Void {
		base.drawBox(graph);
		exp.drawBox(graph);
	}
}