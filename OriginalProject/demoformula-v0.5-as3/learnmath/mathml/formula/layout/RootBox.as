package learnmath.mathml.formula.layout{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import flash.geom.*;
import flash.display.MovieClip;

public class RootBox extends Box{
	
	public var base:Box;
	public var index:Box;
	
	public var linethickness:Number = 1;
	private var kLine:Number = 0.06;		
	
	private var widthR:Number = 3;
	private var kWR:Number = 0.17;		
	
	public function	RootBox(parentBox:Box):void{
		super(parentBox);
	}
	
	override public function calculate():void{
		var cP:Point = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.calculateBox(cP);

		var cI:Point = new Point();
		cI.x = originPoint.x;
		cI.y = originPoint.y - base.finalBounds.height/4 ;
		index.calculateBox(cI);
		
		widthR = base.finalBounds.height * kWR;

		finalBounds.width = index.finalBounds.width + widthR/2 + base.finalBounds.width
		if(base.finalBounds.y<index.finalBounds.y){
			finalBounds.y = base.finalBounds.y;
		}else{
			finalBounds.y = index.finalBounds.y;
		}
		
		finalBounds.height = base.finalBounds.y + base.finalBounds.height - finalBounds.y;

		moveMyChildren();
	}

	override public function moveMyChildren():void{
		var cP:Point = new Point();
		cP.x = originPoint.x + index.finalBounds.width + widthR*1/2;
		cP.y = originPoint.y;
		base.moveOriginTo(cP);
			
		var cI:Point = new Point();
		cI.x = originPoint.x;
		cI.y = originPoint.y - base.finalBounds.height/4 ;
		index.moveOriginTo(cI);
	}

	
	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle:Style = this.style.getCopy();
		newStyle.size = newStyle.size-3;
		index.copyParentStyle(newStyle);
	}
	
	
	override public function draw(graph:MovieClip):void{
		var s:Number = getTinethickness(linethickness, kLine);
		graph.graphics.lineStyle(s, getHexColor(), 100);
		graph.graphics.moveTo(base.finalBounds.x-widthR, base.finalBounds.y + 2*widthR);
		graph.graphics.lineTo(base.finalBounds.x-widthR/2, base.finalBounds.y + base.finalBounds.height);
		graph.graphics.lineTo(base.finalBounds.x, base.finalBounds.y + s/2);
		graph.graphics.lineTo(base.finalBounds.x + base.finalBounds.width, base.finalBounds.y + s/2);

		base.draw(graph);
		index.drawBox(graph);
	}
	
	override public function toString():String{
		return "RootBox";
	}
}

}