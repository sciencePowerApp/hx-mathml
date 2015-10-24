package learnmath.mathml.formula.script{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import flash.geom.*;
import flash.display.MovieClip;

public class UnderBox extends Box{
	
	public var base:Box;
	public var sub:Box;
	
	private var k:Number = 0.6;
	
	
	public function	UnderBox(parentBox:Box):void{
		super(parentBox);
	}
	
	override public function calculate():void{
		var cP:Point = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.calculateBox(cP);
		
		var cE:Point = new Point();
		cE.x = originPoint.x ;
		cE.y = originPoint.y + base.finalBounds.height * k;
		sub.calculateBox(cE);
		
		//center exp
		var dif:Number = (base.finalBounds.width - sub.finalBounds.width)/2;
		if(dif>0){
			cE.x = originPoint.x + dif;
			sub.moveOriginTo(cE);
		}else{
			cP.x = originPoint.x - dif;
			base.moveOriginTo(cP);
		}
		finalBounds.y = base.finalBounds.y;
		if(base.finalBounds.width > sub.finalBounds.width){
			finalBounds.width = base.finalBounds.width;
		}else{
			finalBounds.width = sub.finalBounds.width;
		}
		finalBounds.height = (sub.finalBounds.y + sub.finalBounds.height) - base.finalBounds.y;
	}
	

	override public function moveMyChildren():void{
		var dif:Number = (base.finalBounds.width - sub.finalBounds.width)/2;
		var cP:Point = new Point();
		var cE:Point = new Point();
		cP.y = originPoint.y;
		cE.y = originPoint.y + base.finalBounds.height * k;

		if(dif>0){
			cE.x = originPoint.x + dif;
			cP.x = originPoint.x;
		}else{
			cP.x = originPoint.x - dif;
			cE.x = originPoint.x;
		}

		base.moveOriginTo(cP);
		sub.moveOriginTo(cE);

	}

	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle:Style = this.style.getCopy();
		newStyle.size = newStyle.size - 6;
		newStyle.fontweight='bold';
		sub.copyParentStyle(newStyle);
	}
	
	override public function draw(graph:MovieClip):void{
		base.drawBox(graph);
		sub.drawBox(graph);
	}
	
	override public function toString():String{
		return "UnderBox";
	}
}

}