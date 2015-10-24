package learnmath.mathml.formula.script;
import learnmath.mathml.formula.Box;
import learnmath.mathml.formula.layout.FracBox;
import openfl.display.MovieClip;
import openfl.geom.Point;

class SubSupBox extends Box {
	public var base:Box;
	public var sub:Box;
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
			cE.y = originPoint.y - base.finalBounds.height / 2;
		} else {
			cE.y = originPoint.y - base.finalBounds.height / 3;
		}
		exp.calculateBox(cE);

		var cS:Point = new Point();
		cS.x = originPoint.x + base.finalBounds.width;
		if (Std.is(sub, FracBox)) {
			cS.y = originPoint.y + base.finalBounds.height / 2;
		} else {
			cS.y = originPoint.y + base.finalBounds.height / 3;
		}
		sub.calculateBox(cS);
		
		finalBounds.x = base.originPoint.x;
		finalBounds.y = exp.finalBounds.y;

		if (sub.finalBounds.width > exp.finalBounds.width) {
			finalBounds.width = base.finalBounds.width + sub.finalBounds.width;
		} else {
			finalBounds.width = base.finalBounds.width + exp.finalBounds.width;
		}
		finalBounds.height = sub.finalBounds.y + sub.finalBounds.height - exp.finalBounds.y;
	}
	
	override public function moveMyChildren():Void {
		var cP:Point = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.moveOriginTo(cP);
		
		var cS:Point = new Point();
		cS.x = originPoint.x + base.finalBounds.width;
		if (Std.is(sub, FracBox)) {
			cS.y = originPoint.y + base.finalBounds.height / 2;
		} else {
			cS.y = originPoint.y + base.finalBounds.height / 3;
		}
		sub.moveOriginTo(cS);

		var cE:Point = new Point();
		cE.x = originPoint.x + base.finalBounds.width;
		if (Std.is(exp, FracBox)) {
			cE.y = originPoint.y - base.finalBounds.height / 2;
		} else {
			cE.y = originPoint.y - base.finalBounds.height / 3;
		}
		exp.moveOriginTo(cE);
	}
	
	override public function copyParentStyle(_styleParent:Style):Void {
		var s:Int = 3;
		if (Std.is(exp, FracBox)) { s = 5; }
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle:Style = this.style.getCopy();
		newStyle.size = newStyle.size - s;
		newStyle.fontweight = 'bold';
		sub.copyParentStyle(newStyle);
		exp.copyParentStyle(newStyle);
	}
	
	override public function draw(graph:MovieClip):Void {
		base.drawBox(graph);
		exp.drawBox(graph);
		sub.drawBox(graph);
	}
	
	override public function toString():String {
		return "SubSupBox";
	}
}