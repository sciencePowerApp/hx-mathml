package learnmath.mathml.formula.script;
import learnmath.mathml.formula.Box;
import openfl.display.MovieClip;
import openfl.geom.Point;

class OverBox extends Box {
	public var base:Box;
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
		
		//center exp
		var dif:Float = (base.finalBounds.width - exp.finalBounds.width) / 2;
		if (dif > 0) {
			cE.x = originPoint.x + dif;
			exp.moveOriginTo(cE);
		} else {
			cP.x = originPoint.x - dif;
			base.moveOriginTo(cP);
		}
		finalBounds.y = exp.finalBounds.y;
		if (base.finalBounds.width > exp.finalBounds.width) {
			finalBounds.width = base.finalBounds.width;
		} else {
			finalBounds.width = exp.finalBounds.width;
		}
		finalBounds.height = base.finalBounds.y + base.finalBounds.height - exp.finalBounds.y;
	}
	
	override public function moveMyChildren():Void {
		var dif:Float = (base.finalBounds.width - exp.finalBounds.width) / 2;
		var cP:Point = new Point();
		var cE:Point = new Point();
		cP.y = originPoint.y;
		cE.y = originPoint.y - base.finalBounds.height * k;
		
		if (dif > 0) {
			cE.x = originPoint.x + dif;	
			cP.x = originPoint.x;
		} else {
			cP.x = originPoint.x - dif;
			cE.x = originPoint.x;
		}
		
		base.moveOriginTo(cP);
		exp.moveOriginTo(cE);
	}
	
	override public function copyParentStyle(_styleParent:Style):Void {
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle:Style = this.style.getCopy();
		newStyle.size = newStyle.size - 6;
		newStyle.fontweight = 'bold';
		exp.copyParentStyle(newStyle);
	}
	
	override public function draw(graph:MovieClip):Void {
		base.drawBox(graph);
		exp.drawBox(graph);
	}
}