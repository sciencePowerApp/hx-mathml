package learnmath.mathml.formula.token.operators.integrals;

import learnmath.mathml.formula.script.SubSupBox;
import learnmath.mathml.formula.token.OBox;
import learnmath.mathml.formula.util.DrawUtil;
import openfl.display.MovieClip;
import openfl.geom.Point;

class IntOBox extends OBox {
	private var addSize:Float = 8;
	private var k:Float = 0.4;
	private var l:Float = 1./45;
	private var r:Float = 0.1;

	private var intWidth:Float = 0;
	private var step:Float = 0;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void {
		var h1:Float = FontConstant.getHeight(style, "X");
		finalBounds.width = k * h1;
		intWidth = k * h1;
		finalBounds.height = h1;
		finalBounds.y = finalBounds.y - finalBounds.height / 2;
	}
	
	override public function changeSizeFromParent():Void {
		resizeFromParent();
		
		var s:SubSupBox = cast parentBox;
		if (s.sub != null) {
			var cP:Point = new Point();
			cP.x = s.sub.originPoint.x - finalBounds.width / 4;
			cP.y = s.sub.originPoint.y;
			s.sub.moveOriginTo(cP);
			
			if ((s.exp.finalBounds.x + s.exp.finalBounds.width) > s.sub.finalBounds.x + s.sub.finalBounds.width) {
				s.finalBounds.width = s.exp.finalBounds.x + s.exp.finalBounds.width - s.base.finalBounds.x;
			} else {
				s.finalBounds.width = s.sub.finalBounds.x + s.sub.finalBounds.width - s.base.finalBounds.x;
			}
		}
	}
	
	override public function copyParentStyle(_styleParent:Style):Void {
		super.copyParentStyle(_styleParent);
		this.style.size = Std.int(this.style.size + addSize);
	}
	
	override public function draw(graph:MovieClip):Void {
		drawIntegral(graph, finalBounds.x, finalBounds.y, finalBounds.width, finalBounds.height);
	}
	
	public function drawIntegral(graph:MovieClip, x:Float, y:Float, w:Float, h:Float):Void {
		var rr:Float = r * w;
		var g:Float = r * h / 3;
		graph.graphics.lineStyle(l * h, getHexColor(), 100);
		graph.graphics.moveTo(x + w, y + rr);
			graph.graphics.curveTo(x + w - rr, y , x + w - 2 * rr, y + rr);
			DrawUtil.drawOval(graph, x + w -rr / 2, y + rr, rr / 2, rr / 2);
		graph.graphics.moveTo(x + w - 2 * rr, y + rr);
			graph.graphics.curveTo(x + w / 2 + g, y + h / 2, x + 2 * rr, y + h - rr);
		graph.graphics.moveTo(x + w - 2 * rr, y + rr);
			graph.graphics.curveTo(x + w / 2 - g, y + h / 2, x + 2 * rr, y + h - rr);
			graph.graphics.moveTo(x + w - 2 * rr, y + rr);
			graph.graphics.lineTo(x + 2 * rr, y + h - rr);
		graph.graphics.moveTo(x + 2 * rr, y + h - rr);
			graph.graphics.curveTo(x + rr, y + h , x, y + h - rr);
			DrawUtil.drawOval(graph, x + rr / 2, y + h - rr, rr / 2, rr / 2);
	}

	override public function toString():String {
		return "IntOBox";
	}
}