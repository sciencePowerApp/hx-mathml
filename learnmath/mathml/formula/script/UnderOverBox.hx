package learnmath.mathml.formula.script;
import learnmath.mathml.formula.Box;
import openfl.display.MovieClip;
import openfl.geom.Point;

class UnderOverBox extends Box {
	public var base:Box;
	public var sub:Box;
	public var exp:Box;
	
	private var k:Float = 0.6;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void {
		var cP:Point = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.calculateBox(cP);
		
		var cE:Point = new Point();
		cE.x = originPoint.x ;
		cE.y = originPoint.y - base.finalBounds.height * k;
		exp.calculateBox(cE);
		
		var cS:Point = new Point();
		cS.x = originPoint.x ;
		cS.y = originPoint.y + base.finalBounds.height * k;
		sub.calculateBox(cS);
		
		//center exp
		var max:Float = base.finalBounds.width;
		if (exp.finalBounds.width > max) {
			max = exp.finalBounds.width;
		}
		if (sub.finalBounds.width > max) {
			max = sub.finalBounds.width;
		}
		
		cP.x = originPoint.x + (max - base.finalBounds.width) / 2;
		base.moveOriginTo(cP);

		cE.x = originPoint.x + (max - exp.finalBounds.width) / 2;
		exp.moveOriginTo(cE);

		cS.x = originPoint.x + (max - sub.finalBounds.width) / 2;
		sub.moveOriginTo(cS);

		finalBounds.y = exp.finalBounds.y;
		finalBounds.width = max;
		finalBounds.height = sub.finalBounds.y + sub.finalBounds.height - exp.finalBounds.y;
	}
	
	override public function moveMyChildren():Void {
		var cP:Point = new Point();
		cP.y = originPoint.y;
		
		var cE:Point = new Point();
		cE.y = originPoint.y - base.finalBounds.height * k;
		
		var cS:Point = new Point();
		cS.y = originPoint.y + base.finalBounds.height * k;
	
		var max:Float = base.finalBounds.width;
		if (exp.finalBounds.width > base.finalBounds.width) {
			max = exp.finalBounds.width;
		}
		if (sub.finalBounds.width > base.finalBounds.width) {
			max = sub.finalBounds.width;
		}
		
		cP.x = originPoint.x + (max - base.finalBounds.width) / 2;
		base.moveOriginTo(cP);

		cE.x = originPoint.x + (max - exp.finalBounds.width) / 2;
		exp.moveOriginTo(cE);

		cS.x = originPoint.x + (max - sub.finalBounds.width) / 2;
		sub.moveOriginTo(cS);
	}
	
	override public function copyParentStyle(_styleParent:Style):Void {
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle:Style = this.style.getCopy();
		newStyle.size = newStyle.size - 6;
		newStyle.fontweight = 'bold';
		sub.copyParentStyle(newStyle);
		exp.copyParentStyle(newStyle);
	}
	
	override public function draw(graph:MovieClip):Void {
		base.drawBox(graph);
		exp.drawBox(graph);
		sub.drawBox(graph);
	}
}