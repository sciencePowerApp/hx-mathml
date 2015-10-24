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

public class TrBox extends Box{
	
	//private var children:Array;
	public var rowalign:String = "";			//(top | bottom | center)
	public var columnalign:String = ""; 			//(left | center | right)
	public var columnspacing:Number = -1;			// exact units or -1 default		
	
	private var childrenWidth:Array;
	private var finalColumnWidth:Array;
		
	public function	TrBox(parentBox:Box):void{
		super(parentBox);
		children = new Array();
		childrenWidth = new Array();
	}
	
	public function addTd(newBox:Box):void{
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

			childx = childx + child.finalBounds.width + getColumnspacing();
			childrenWidth[childrenWidth.length] = child.finalBounds.width;
		}
	}


	public function calculateFinalBounds():void{
	
		finalBounds.height=0;
		finalBounds.y = children[0].finalBounds.y;
		var maxYPoint:Number = children[0].finalBounds.y + children[0].finalBounds.height;

		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];
			
			maxYPoint = Math.max(maxYPoint, child.finalBounds.y + child.finalBounds.height);
			finalBounds.y = Math.min(finalBounds.y, child.finalBounds.y);
		}
				
		finalBounds.height = maxYPoint - finalBounds.y;
		
		var lastChild:Box = children[children.length-1];
		finalBounds.width=lastChild.finalBounds.x + lastChild.finalBounds.width - originPoint.x;
	}
	
	public function setFinalColumnWidth(_finalColumnWidth:Array):void{
		finalColumnWidth = _finalColumnWidth;
		moveMyChildren();
		calculateFinalBounds();
	}

	override public function moveMyChildren():void{
		var childx:Number = 0;
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];

			var w:Number = child.finalBounds.width;
			var maxW:Number = finalColumnWidth[i];
			var dx:Number = (maxW-w)/2

			var tdBox:TdBox = new TdBox(child);
			if(tdBox.columnalign=="left"){
				dx = 0;
			}else if(tdBox.columnalign=="right"){
				dx = (maxW-w);
			}
			
			
			var cP:Point = new Point();
			cP.x = originPoint.x + childx + dx;
			cP.y = originPoint.y;
			child.moveOriginTo(cP);
			
			childx = childx + maxW + getColumnspacing();
		}
	
	}
	
	public function getChildrenWidth():Array{
		return childrenWidth;
	}
	
	public function getColumnspacing():Number{
		if(columnspacing==-1){
			var w:Number = FontConstant.getWidth(style, "X");
			return 0.5*w;
		}
		return columnspacing;
	}
	
	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];
			
			var tdBox:TdBox = new TdBox(child);
			if(tdBox.rowalign==""){ tdBox.rowalign = rowalign; }
			if(tdBox.columnalign==""){ tdBox.columnalign = columnalign; }

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
		var s:String = "TrBox "+finalBounds+" [";
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