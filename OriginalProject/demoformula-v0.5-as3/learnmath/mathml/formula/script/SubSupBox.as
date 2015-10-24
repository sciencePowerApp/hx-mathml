package learnmath.mathml.formula.script{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.operators.*;
import flash.geom.*;
import flash.display.MovieClip;

public class SubSupBox extends Box{
	
	public var base:Box;
	public var sub:Box;
	public var exp:Box;
	
	public function	SubSupBox(parentBox:Box):void{
		super(parentBox);
	}
	
	override public function calculate():void{
		var cP:Point = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.calculateBox(cP);
		
		var cE:Point = new Point();
		cE.x = originPoint.x + base.finalBounds.width;
		cE.y = originPoint.y - base.finalBounds.height/3;
		exp.calculateBox(cE);

		var cS:Point = new Point();
		cS.x = originPoint.x + base.finalBounds.width;
		cS.y = originPoint.y + base.finalBounds.height/3;
		sub.calculateBox(cS);
		
		finalBounds.x = base.originPoint.x;
		finalBounds.y = exp.finalBounds.y;

		if(sub.finalBounds.width>exp.finalBounds.width){
			finalBounds.width = base.finalBounds.width + sub.finalBounds.width;
		}else{
			finalBounds.width = base.finalBounds.width + exp.finalBounds.width;
		}
		finalBounds.height = sub.finalBounds.y + sub.finalBounds.height - exp.finalBounds.y;
	}
	


	override public function moveMyChildren():void{
		var cP:Point = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.moveOriginTo(cP);
		
		var cS:Point = new Point();
		cS.x = originPoint.x + base.finalBounds.width;
		cS.y = originPoint.y + base.finalBounds.height/3;
		sub.moveOriginTo(cS);

		var cE:Point = new Point();
		cE.x = originPoint.x + base.finalBounds.width;
		cE.y = originPoint.y - base.finalBounds.height/3;
		exp.moveOriginTo(cE);


	}
	
	
	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle:Style = this.style.getCopy();
		newStyle.size = newStyle.size -3;
		newStyle.fontweight='bold';
		sub.copyParentStyle(newStyle);
		exp.copyParentStyle(newStyle);
	}
	

	override public function draw(graph:MovieClip):void{
		base.drawBox(graph);
		exp.drawBox(graph);
		sub.drawBox(graph);
	}


	override public function toString():String{
		return "SubSupBox";
	}
}

}