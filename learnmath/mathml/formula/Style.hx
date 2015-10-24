package learnmath.mathml.formula;

class Style {
	public var size:Int = 10;
	public var color:String;
	public var font:String;
	public var fontweight:String;
	public var fontstyle:String;
	public var bgcolor:String;
	
	public function new() {
		
	}
	
	public function getCopy():Style {
		var newStyle:Style = new Style();	
		newStyle.font = this.font;
		newStyle.size = this.size;
		newStyle.color = this.color;
		newStyle.bgcolor = this.bgcolor;
		newStyle.fontweight = this.fontweight;
		newStyle.fontstyle = this.fontstyle;
		return newStyle;
	}
	
	public function getHexColor():Int {
		color = changeTheName(color);
		if (color == null || color == "") return 0;
		return Std.parseInt("0x" + color.substring(1));
	}
	
	public function getHexBgColor():Int {
		bgcolor = changeTheName(bgcolor);
		if(bgcolor==null || bgcolor=="") return 255;
		return Std.parseInt("0x" + bgcolor.substring(1));
	}
	
	public function changeTheName(c:String):String {
		if (c == null) return c;
		if (c.charAt(0) == "#") return c;
		if (c == "aqua") return "#00FFFF";
		if (c == "black") return "#000000";
		if (c == "blue") return "#0000FF";
		if (c == "fuchsia") return "#FF00FF";
		if (c == "gray") return "#808080";
		if (c == "green") return "#008000";
		if (c == "lime") return "#00FF00";
		if (c == "maroon") return "#800000";
		if (c == "navy") return "#000080";
		if (c == "olive") return "#808000";
		if (c == "purple") return "#800080";
		if (c == "red") return "#FF0000";
		if (c == "silver") return "#C0C0C0";
		if (c == "teal") return "#008080";
		if (c == "white") return "#FFFFFF";
		if (c == "yellow") return "#FFFF00";
		return c;
	}
	
	public function toString():String {
		return "color:" + color + " fontweight:" + fontweight;	
	}
}