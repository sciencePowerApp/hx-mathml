package learnmath.mathml.formula.layout{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import flash.geom.*;
import flash.display.MovieClip;

public class TdBox extends Box{
	
	//private var children:Array;
	public var rowalign:String = "";			//(top | bottom | center)
	public var columnalign:String = ""; 		//(left | center | right)
	public var rowspan:Number = 1;
	public var columnspan:Number = 1;
	
		
	public function	TdBox(parentBox:Box):void{
		super(parentBox);
		children = new Array();
	}
	
	public function addChild(newBox:Box):void{
		children[children.length] = newBox;
	}
	

	override public function calculate():void{
		var childx:Number = 0;
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];
			
			var cP:Point = new Point();
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y;
			child.calculateBox(cP);
			
			childx = childx + child.finalBounds.width;
		}
		
		finalBounds.width=0;
		finalBounds.height=0;
		finalBounds.y = children[0].finalBounds.y;
		var minYPoint:Number = children[0].finalBounds.y
		
		for(i =0; i<children.length;i++){
			child = children[i];
			
			finalBounds.width = finalBounds.width + child.finalBounds.width;
			if((child.finalBounds.y + child.finalBounds.height)>minYPoint){
				minYPoint = child.finalBounds.y + child.finalBounds.height
			}
			
			if(child.finalBounds.y<finalBounds.y){
				finalBounds.y = child.finalBounds.y;
			}
		}
		
		finalBounds.height = minYPoint - finalBounds.y;
	}


	override public function moveMyChildren():void{
		var childx:Number = 0;
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];
			
			var cP:Point = new Point();
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y;
			
			child.moveOriginTo(cP);
			childx = childx + child.finalBounds.width;
		}
	}
	
	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];
			child.copyParentStyle(this.style);
		}
	}
	
	
	override public function draw(graph:MovieClip):void{
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];
			child.drawBox(graph);
		}
		//DrawFormula.drawRectangle(graph, finalBounds);
	}
	
	override public function toString():String{
		var s:String = "TdBox "+finalBounds+" [";
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];
			s = s + child.toString() ;
			if((i+1)!=children.length){
				s = s + ",";
			}
		}
		s = s + "]";
		return s;
	}
	
	
}

}