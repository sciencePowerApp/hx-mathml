package learnmath.mathml.formula{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.geom.*;
import learnmath.mathml.formula.*;
import flash.display.MovieClip;

public class Box{
	
	public var originPoint:Point;
	public var finalBounds:Rectangle;
	public var style:Style;
	protected var children:Array;
	
	protected var parentBox:Box;
	
	public function Box(_parentBox:Box):void{
		parentBox = _parentBox;
		finalBounds = new Rectangle();
		originPoint = new Point();
		style = new Style();
	}
	
	public function initBounds(_originPoint:Point):void{
		finalBounds.x = _originPoint.x;
		finalBounds.y = _originPoint.y;
		finalBounds.width = 0;
		finalBounds.height = 0;
		originPoint.x = _originPoint.x;
		originPoint.y = _originPoint.y;
	}

	public function calculateBox(_originPoint:Point):void{
		initBounds(_originPoint);
		calculate();
	}

	public function calculate():void{
		trace("Box.calculate() !!!")
	}
	

	public function moveOriginTo(newOriginPoint:Point):void{
		finalBounds.x = newOriginPoint.x;
		finalBounds.y = finalBounds.y + (newOriginPoint.y - originPoint.y);

		originPoint.x = newOriginPoint.x;
		originPoint.y = newOriginPoint.y;
		moveMyChildren();
	}
	
	public function moveMyChildren():void{
	}
	

	public function changeSizeFromParent():void{
	}

	public function resizeFromParent():void{
		//parent box must be msubsup
		// parent of msubsup can be only type RowBox and if the next child is greater take this  height.
		var p:Box = parentBox.parentBox;
		var nextChild:Box;
		if (p!=null){
		for(var i:int =0; i<p.children.length;i++){
			var child:Box = p.children[i];
			if(child==parentBox){
				nextChild = p.children[i+1];
				break;
			}
		}
		if(nextChild!=null){
			var dxs:Number = parentBox.finalBounds.y - nextChild.finalBounds.y;
			var dxi:Number = nextChild.finalBounds.y + nextChild.finalBounds.height - parentBox.finalBounds.y - parentBox.finalBounds.height;
			if(dxs>0 && dxi>0){
				var min:Number = dxs;
				if(dxi<min){
					min = dxi;
				}
				
				min = 0.8*min;
				
				parentBox.finalBounds.y = parentBox.finalBounds.y - min;
				parentBox.finalBounds.height = parentBox.finalBounds.height + min*2;
				
				finalBounds.y = finalBounds.y - min;
				finalBounds.height = finalBounds.height + min*2;
				
				parentBox.moveMyChildren();
				
			}
		}
		
		}
	}



	public function copyParentStyle(_styleParent:Style):void{
		if(this.style.font==null){
			this.style.font = _styleParent.font;
		}
		if(this.style.size==0){
			this.style.size = _styleParent.size;
		}
		if(this.style.color==null){
			this.style.color = _styleParent.color;
		}
		if(this.style.fontweight==null){
			this.style.fontweight = _styleParent.fontweight;
		}
		if(this.style.fontstyle==null){
			this.style.fontstyle = _styleParent.fontstyle;
		}
	}
	
	public function getHexColor():uint{
		return parseInt(style.color.substring(1), 16);
	}

	public function drawBox(graph:MovieClip):void{
		draw(graph);
		//DrawFormula.drawRectangle(graph, finalBounds);
	}

	public function draw(graph:MovieClip):void{
	}


	public function toString():String{
		return "Box";
	}

	public function getTinethickness(l:Number, kLine:Number):Number{
		var s:Number = 1;
		if(l==1){
			s = finalBounds.height * kLine;
		}
		if(s<1){
			s=1;
		}else if(s>4){
			s=4;
		}
		return s;
	}
	
}

}