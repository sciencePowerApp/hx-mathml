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

public class TableBox extends Box{
	
	//private var children:Array;
	public var rowalign:String = "";			// (top | bottom | center) 
	public var columnalign:String = ""; 			// (left | center | right)
	public var rowspacing:Number = -1;			// exact units or -1 default
	public var columnspacing:Number = -1;			// exact units or -1 default
	public var framespacing:Number = -1;			// exact units or -1 default
	
	private var childrenWidth:Array;
	private var finalColumnWidth:Array;
		
	public function	TableBox(parentBox:Box):void{
		super(parentBox);
		children = new Array();
		childrenWidth = new Array();
	}
	
	public function addRow(newBox:Box):void{
		children[children.length] = newBox;
	}
	

	override public function calculate():void{
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];
			var cP:Point = new Point();
			child.calculateBox(cP);

			var trBox:TrBox = TrBox(child);
			childrenWidth[childrenWidth.length] = trBox.getChildrenWidth();
		}

		calculateMaxColumnWidth();
		for(i =0; i<children.length;i++){
			child = children[i];
			trBox = TrBox(child);
			trBox.setFinalColumnWidth(finalColumnWidth);
		}
		
		finalBounds.width=0;
		finalBounds.height=2*getFramespacing();
		
		for(i =0; i<children.length;i++){
			child = children[i];
			finalBounds.height = finalBounds.height + child.finalBounds.height;
			if(i<(children.length-1)){
				finalBounds.height = finalBounds.height + getRowspacing();
			}
			
			finalBounds.width = Math.max(finalBounds.width, child.finalBounds.width);
		}
		
		finalBounds.width = finalBounds.width + 2*getFramespacing();
		finalBounds.y = originPoint.y - finalBounds.height/2
		moveMyChildren();
	}


	override public function moveMyChildren():void{
		var childy:Number = finalBounds.y + getFramespacing();
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];

			var cP:Point = new Point();
			cP.x = originPoint.x + getFramespacing();
			cP.y = childy + child.finalBounds.height/2;

			child.moveOriginTo(cP);
			childy = childy + child.finalBounds.height + getRowspacing();
		}
	}
	
	public function getRowspacing():Number{
		if(rowspacing==-1){
			var h:Number = FontConstant.getHeight(style, "X");
			return 0.5*h;
		}
		return rowspacing;
	}
	

	public function getFramespacing():Number{
		if(framespacing==-1){
			var w:Number = FontConstant.getWidth(style, "X");
			return 0.2*w;
		}
		return framespacing;
	}
	

	public function calculateMaxColumnWidth():void{
		finalColumnWidth = childrenWidth[0];
		for(var i:int =1; i<childrenWidth.length;i++){
			var childrenW:Array = childrenWidth[i];
			for(var j:int =0; j<childrenWidth.length;j++){
				finalColumnWidth[j] = Math.max(finalColumnWidth[j], childrenW[j]);
			}
			
		}
	}


	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];
						
			var trBox:TrBox = TrBox(child);
			if(trBox.rowalign==""){ trBox.rowalign = rowalign; }
			if(trBox.columnalign==""){ trBox.columnalign = columnalign; }
			if(trBox.columnspacing==-1){ trBox.columnspacing = columnspacing; }

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
		var s:String = "TableBox "+finalBounds+" [";
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