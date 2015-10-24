package learnmath.mathml.formula.layout{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import flash.geom.*;
import flash.display.MovieClip;

public class FracBox extends Box{
	
	public var num:Box;
	public var denum:Box;
	public var linethickness:Number = 1;
	private var kLine:Number = 0.06;
	public var bevelled:Boolean = false;
	
	public function	FracBox(parentBox:Box):void{
		super(parentBox);
	}
	
	override public function calculate():void{
		num.calculateBox(new Point());
		denum.calculateBox(new Point());
		
		if(bevelled){
			finalBounds.width=num.finalBounds.width + 10 + denum.finalBounds.width;
			finalBounds.height=denum.finalBounds.height*3/4 + num.finalBounds.height*3/4;		
		}else{
			if(num.finalBounds.width>denum.finalBounds.width){
				finalBounds.width=num.finalBounds.width;
			}else{
				finalBounds.width=denum.finalBounds.width;
			}
			finalBounds.height=denum.finalBounds.height + num.finalBounds.height;		
		}
		
		moveMyChildren();
		finalBounds.y = num.finalBounds.y;
		
	}
	
	override public function moveMyChildren():void{
		if(bevelled){
			var cP:Point = new Point();
			cP.x = originPoint.x ;
			cP.y = originPoint.y + (1/4)*num.finalBounds.height - (num.finalBounds.y + num.finalBounds.height - num.originPoint.y);
			num.moveOriginTo(cP);

			var cD:Point = new Point();
			cD.x = originPoint.x + num.finalBounds.width + 10;
			cD.y = originPoint.y - (1/4)*denum.finalBounds.height + (denum.originPoint.y-denum.finalBounds.y);
			denum.moveOriginTo(cD);
		}else{
			cP = new Point();
			cP.x = originPoint.x + (finalBounds.width - num.finalBounds.width)/2;
			cP.y = originPoint.y - (num.finalBounds.y + num.finalBounds.height - num.originPoint.y);
			num.moveOriginTo(cP);

			cD = new Point();
			cD.x = originPoint.x + (finalBounds.width - denum.finalBounds.width)/2;
			cD.y = originPoint.y + (denum.originPoint.y-denum.finalBounds.y);
			denum.moveOriginTo(cD);
		}
	}	


	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
		num.copyParentStyle(this.style);
		denum.copyParentStyle(this.style);
	}
	

	override public function draw(graph:MovieClip):void{
		num.drawBox(graph);

		var s:Number = getTinethickness(linethickness, kLine);
		graph.graphics.lineStyle(s, style.getHexColor(), 100);
		if(bevelled){
			graph.graphics.moveTo(num.finalBounds.x+num.finalBounds.width+10, num.finalBounds.y);
			graph.graphics.lineTo(num.finalBounds.x+num.finalBounds.width, denum.finalBounds.y+denum.finalBounds.height);
		}else{
			graph.graphics.moveTo(originPoint.x, originPoint.y);
			graph.graphics.lineTo(originPoint.x + finalBounds.width, originPoint.y);
		}

		denum.drawBox(graph);

	}
	
	override public function toString():String{
		return "FracBox "+finalBounds + " [ num " + num.toString() + ",  denum " + denum.toString();
	}
	
}

}