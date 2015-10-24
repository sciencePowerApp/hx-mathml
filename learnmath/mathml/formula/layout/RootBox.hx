package learnmath.mathml.formula.layout;
import learnmath.mathml.formula.Box;
import openfl.display.MovieClip;
import openfl.geom.Point;

class RootBox extends Box {

	public var base:Box;
	public var index:Box;
	
	public var linethickness:Float = 1.5;
	private var kLine:Float = 0.06;		
	
	private var widthR:Float = 3;
	private var kWR:Float = 0.17;		
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void {
		var cP:Point = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.calculateBox(cP);
		
		var cI:Point = new Point();
		cI.x = originPoint.x;
		cI.y = originPoint.y - base.finalBounds.height / 4 ;
		index.calculateBox(cI);
		
		widthR = base.finalBounds.height * kWR;
		finalBounds.width = index.finalBounds.width + widthR / 2 + base.finalBounds.width;
		if (base.finalBounds.y < index.finalBounds.y) {
			finalBounds.y = base.finalBounds.y;
		} else {
			finalBounds.y = index.finalBounds.y;
		}
		
		finalBounds.height = base.finalBounds.y + base.finalBounds.height - finalBounds.y;
		
		moveMyChildren();
	}
	
	override public function moveMyChildren():Void {
		var cP:Point = new Point();	
		cP.x = originPoint.x + index.finalBounds.width + widthR * 1 / 2;
		cP.y = originPoint.y;
		base.moveOriginTo(cP);
		
		var cI:Point = new Point();
		cI.x = originPoint.x;
		cI.y = originPoint.y - base.finalBounds.height / 4 ;
		index.moveOriginTo(cI);
	}
	
	override public function copyParentStyle(_styleParent:Style):Void {
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle:Style = this.style.getCopy();
		newStyle.size = newStyle.size-3;
		index.copyParentStyle(newStyle);
	}
	
	override public function draw(graph:MovieClip):Void {
		var s:Float = getTinethickness(linethickness, kLine);
		graph.graphics.lineStyle(s, getHexColor(), 100);
		graph.graphics.moveTo(base.finalBounds.x - widthR, base.finalBounds.y + 2 * widthR);
		graph.graphics.lineTo(base.finalBounds.x - widthR / 2, base.finalBounds.y + base.finalBounds.height);
		graph.graphics.lineTo(base.finalBounds.x, base.finalBounds.y + s / 2);
		graph.graphics.lineTo(base.finalBounds.x + base.finalBounds.width, base.finalBounds.y + s / 2);
		
		base.draw(graph);
		index.drawBox(graph);
	}
	
	override public function toString():String {
		return "RootBox";	
	}
}