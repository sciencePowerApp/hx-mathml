package learnmath.mathml.formula;
import openfl.text.TextField;
import openfl.text.TextFormat;

class FontConstant {
	public static var fontSize:Array<Float>;
	public static var startWidthSize:Float = 6;
	public static var fontSizeFactor:Float = 1.1;
	
	public static function init():Void {
		if (fontSize == null) {	
			fontSize = new Array<Float>();
			fontSize.push(startWidthSize);
			
			for (i in 1...40) {
				fontSize.push(fontSize[i - 1] * fontSizeFactor);
			}
			/*
			for (i in 1...40) {
				fontSize.push(fontSize[i - 1] * fontSizeFactor);
				fontSize[i - 1] = fontSize[i - 1];
			}
			*/
			
			//fontSize[fontSize.length - 1] = fontSize[fontSize.length - 1];
		}
	}
	
	public static function getTextFormat(style:Style):TextFormat {
		init();	
		var tf:TextFormat = new TextFormat();
		tf.font = style.font; 
		if (style.fontweight == 'bold') {
			tf.bold = true;	
		}
		if (style.fontstyle == 'italic') {
			tf.italic = true;	
		}
		tf.color = style.getHexColor();
		tf.size = fontSize[style.size];
		return tf;
	}
	
	public static function getWidth(style:Style, text:String):Float {
		init();
		var tfield:TextField = new TextField();
		tfield.defaultTextFormat = getTextFormat(style);
		tfield.text = text;
		var add:Int = 4;
		if (style.fontstyle == 'italic') {
			add = 7;
		}
		return tfield.getLineMetrics(0).width + add;
	}
	
	public static function getHeight(style:Style, text:String):Float {
		init();	
		var tfield:TextField = new TextField();
		tfield.defaultTextFormat = getTextFormat(style);
		tfield.text = text;
		return tfield.getLineMetrics(0).height + 4;
	}
}