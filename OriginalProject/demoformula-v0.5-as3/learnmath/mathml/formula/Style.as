package learnmath.mathml.formula{

public class Style{
	public var size:Number = 0;
	public var color:String;
	public var font:String;
	public var fontweight:String;
	public var fontstyle:String;
	
	public function Style():void{
	}
	
	public function getCopy():Style{
		var newStyle:Style = new Style();
		newStyle.font = this.font;
		newStyle.size = this.size;
		newStyle.color = this.color;
		newStyle.fontweight = this.fontweight;
		newStyle.fontstyle = this.fontstyle;
		return newStyle;
	}
	
	public function getHexColor():uint{
		if(color==null || color=="") return 0;
		return parseInt(color.substring(1), 16);
	}


}

}