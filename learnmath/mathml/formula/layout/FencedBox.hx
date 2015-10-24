package learnmath.mathml.formula.layout;
import openfl.display.MovieClip;
import openfl.geom.Point;
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/

class FencedBox extends RowBox {
	public var linethickness:Float = 1.5;
	
	// accepted char: () [] {} || &langle; &rangle; &lceil;&rceil;  &lfloor; &rfloor; &Verbar;
	public var open:String = "(";
	public var close:String = ")";
	private var lfw:Float = 10;
	private var rfw:Float = 10;
	
	private var l:Float = 3/100;
	
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function calculate():Void {
		super.calculate();
		
		calculateFenceWidth();
		
		finalBounds.width = lfw + rfw;
		finalBounds.height = 0;
		finalBounds.y = children[0].finalBounds.y;
		var minYPoint:Float = children[0].finalBounds.y;
		
		for (i in 0...children.length) {
			var child:Box = children[i];
			
			finalBounds.width = finalBounds.width + child.finalBounds.width;
			if ((child.finalBounds.y + child.finalBounds.height) > minYPoint) {
				minYPoint = child.finalBounds.y + child.finalBounds.height;	
			}
			
			if (child.finalBounds.y < finalBounds.y) {
				finalBounds.y = child.finalBounds.y;	
			}
		}
		
		finalBounds.height = minYPoint - finalBounds.y;
		moveMyChildren();
	}
	
	override public function moveMyChildren():Void {
		var childx:Float = lfw;	
		for (i in 0...children.length) {
			var child:Box = children[i];
			
			var cP:Point = new Point();
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y;
			
			child.moveOriginTo(cP);
			childx = childx + child.finalBounds.width;
		}
	}
	
	private function calculateFenceWidth():Void {
		if (open == "") {	
			lfw = 1;
		} else {
			lfw = finalBounds.height / 6;
		}
		if (close == "") {
			rfw = 1;	
		} else {
			rfw = finalBounds.height / 6;
		}
	}
	
	override public function draw(graph:MovieClip):Void {
		super.draw(graph);	
		var s:Float = getTinethickness(linethickness, l) * 3 / 4;
		graph.graphics.lineStyle(s, getHexColor(), 100);
		drawFence(graph, 0, open, lfw);
		drawFence(graph, finalBounds.width -rfw, close, rfw);
	}
	
	private function drawFence(graph:MovieClip, x:Float, sign:String, fw:Float):Void {
		if(sign=="["){
			graph.graphics.moveTo(x+finalBounds.x+fw, finalBounds.y+2);
			graph.graphics.lineTo(x+finalBounds.x+fw/3, finalBounds.y + 2);
			graph.graphics.lineTo(x+finalBounds.x+fw/3, finalBounds.y + finalBounds.height - 2);
			graph.graphics.lineTo(x+finalBounds.x+fw, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="]"){
			graph.graphics.moveTo(x+finalBounds.x, finalBounds.y+2);
			graph.graphics.lineTo(x+finalBounds.x+2*fw/3, finalBounds.y + 2);
			graph.graphics.lineTo(x+finalBounds.x+2*fw/3, finalBounds.y + finalBounds.height - 2);
			graph.graphics.lineTo(x+finalBounds.x, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="|"){
			graph.graphics.moveTo(x+finalBounds.x+fw/2, finalBounds.y + 1);
			graph.graphics.lineTo(x+finalBounds.x+fw/2, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="{"){
			graph.graphics.moveTo(x+finalBounds.x+4*fw/5, finalBounds.y + 1);
			graph.graphics.curveTo(x+finalBounds.x+2*fw/5, finalBounds.y + 1,x+finalBounds.x+2*fw/5, finalBounds.y+finalBounds.height/4);
			graph.graphics.curveTo(x+finalBounds.x+2*fw/5, finalBounds.y+finalBounds.height/2-2,x+finalBounds.x, finalBounds.y+finalBounds.height/2);
			graph.graphics.curveTo(x+finalBounds.x+2*fw/5, finalBounds.y+finalBounds.height/2+2, x+finalBounds.x+2*fw/5, finalBounds.y+3*finalBounds.height/4);
			graph.graphics.curveTo(x+finalBounds.x+2*fw/5, finalBounds.y+finalBounds.height -1,x+finalBounds.x+4*fw/5, finalBounds.y + finalBounds.height - 1);
		}else if(sign=="}"){
			graph.graphics.moveTo(x+finalBounds.x +1*fw/5, finalBounds.y + 1);
			graph.graphics.curveTo(x+finalBounds.x +3*fw/5, finalBounds.y + 1,x+finalBounds.x +3*fw/5, finalBounds.y+finalBounds.height/4);
			graph.graphics.curveTo(x+finalBounds.x +3*fw/5, finalBounds.y+finalBounds.height/2-2,x+finalBounds.x +fw, finalBounds.y+finalBounds.height/2);
			graph.graphics.curveTo(x+finalBounds.x +3*fw/5, finalBounds.y+finalBounds.height/2+2, x+finalBounds.x+3*fw/5, finalBounds.y+3*finalBounds.height/4);
			graph.graphics.curveTo(x+finalBounds.x +3*fw/5, finalBounds.y+finalBounds.height -1,x+finalBounds.x+1*fw/5, finalBounds.y + finalBounds.height - 1);
		}else if(sign=="&langle;"){
			graph.graphics.moveTo(x+finalBounds.x+4*fw/5, finalBounds.y+2);
			graph.graphics.lineTo(x+finalBounds.x, finalBounds.y + finalBounds.height/2);
			graph.graphics.lineTo(x+finalBounds.x+4*fw/5, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="&rangle;"){
			graph.graphics.moveTo(x+finalBounds.x +1*fw/5, finalBounds.y+2);
			graph.graphics.lineTo(x+finalBounds.x +fw, finalBounds.y + finalBounds.height/2);
			graph.graphics.lineTo(x+finalBounds.x +1*fw/5, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="&lceil;" || sign=="\u2308"){
			graph.graphics.moveTo(x+finalBounds.x+fw, finalBounds.y+2);
			graph.graphics.lineTo(x+finalBounds.x+fw/3, finalBounds.y + 2);
			graph.graphics.lineTo(x+finalBounds.x+fw/3, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="&rceil;" || sign=="\u2309"){
			graph.graphics.moveTo(x+finalBounds.x, finalBounds.y+2);
			graph.graphics.lineTo(x+finalBounds.x+2*fw/3, finalBounds.y + 2);
			graph.graphics.lineTo(x+finalBounds.x+2*fw/3, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="&lfloor;" || sign=="\u230A"){
			graph.graphics.moveTo(x+finalBounds.x+fw/3, finalBounds.y + 2);
			graph.graphics.lineTo(x+finalBounds.x+fw/3, finalBounds.y + finalBounds.height - 2);
			graph.graphics.lineTo(x+finalBounds.x+fw, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="&rfloor;" || sign=="\u230B"){
			graph.graphics.moveTo(x+finalBounds.x +2*fw/3, finalBounds.y + 2);
			graph.graphics.lineTo(x+finalBounds.x +2*fw/3, finalBounds.y + finalBounds.height - 2);
			graph.graphics.lineTo(x+finalBounds.x , finalBounds.y + finalBounds.height - 2);
		}else if(sign=="&Verbar;"){
			graph.graphics.moveTo(x+finalBounds.x+fw/3, finalBounds.y + 2);
			graph.graphics.lineTo(x+finalBounds.x+fw/3, finalBounds.y + finalBounds.height - 2);
			graph.graphics.moveTo(x+finalBounds.x+2*fw/3, finalBounds.y + 1);
			graph.graphics.lineTo(x+finalBounds.x+2*fw/3, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="("){
			graph.graphics.moveTo(x+finalBounds.x+fw, finalBounds.y+1);
			graph.graphics.curveTo(x+finalBounds.x, finalBounds.y+finalBounds.height/2,finalBounds.x+fw, finalBounds.y+finalBounds.height-1);
		}else if(sign==")"){
			graph.graphics.moveTo(x+finalBounds.x, finalBounds.y+1);
			graph.graphics.curveTo(x+finalBounds.x+fw, finalBounds.y+finalBounds.height/2,x+finalBounds.x, finalBounds.y+finalBounds.height-1);
		}
	}

	override public function toString():String {
		return "FencedBox";	
	}
}