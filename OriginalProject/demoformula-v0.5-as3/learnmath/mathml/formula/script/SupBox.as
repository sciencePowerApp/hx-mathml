package learnmath.mathml.formula.script{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import flash.geom.*;
import flash.display.MovieClip;

public class SupBox extends Box{
	
	public var base:Box;
	public var exp:Box;
	
	public function	SupBox(parentBox:Box):void{
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

		finalBounds.x = base.finalBounds.x;
		finalBounds.y = exp.finalBounds.y;
		finalBounds.width = base.finalBounds.width + exp.finalBounds.width;
		finalBounds.height = base.finalBounds.y + base.finalBounds.height - exp.finalBounds.y;
	}
	

	override public function moveMyChildren():void{
		var cP:Point = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.moveOriginTo(cP);
		
		var cS:Point = new Point();
		cS.x = originPoint.x + base.finalBounds.width;
		cS.y = originPoint.y - base.finalBounds.height/3;
		exp.moveOriginTo(cS);

	}
	

	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle:Style = this.style.getCopy();
		newStyle.size = newStyle.size -3;
		newStyle.fontweight='bold';
		exp.copyParentStyle(newStyle);
	}
	
	override public function draw(graph:MovieClip):void{
		base.drawBox(graph);
		exp.drawBox(graph);
	}

}

}