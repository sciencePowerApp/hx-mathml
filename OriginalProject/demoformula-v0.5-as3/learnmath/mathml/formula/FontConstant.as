package learnmath.mathml.formula{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.text.TextField;
import learnmath.mathml.formula.*;
import flash.text.TextFormat;

public class FontConstant{
	
	public static var fontSize:Array;
	public static var startWidthSize:Number = 6;
	public static var fontSizeFactor:Number = 1.1;
		
	public static function init():void{
		if(fontSize==null){
			fontSize = new Array();
			fontSize[0] = startWidthSize;
			
			for(var i:int=1;i<40; i++){
				fontSize[i]= fontSize[i-1]*fontSizeFactor;
				fontSize[i-1] = Number(fontSize[i-1]);
				//trace(i + " - " + fontSize[i-1]);
			}
			fontSize[fontSize.length-1] = Number(fontSize[fontSize.length-1]);
			
		}
	}

	public static function getTextFormat(style:Style):TextFormat{
		init();
		var tf:TextFormat = new TextFormat();
		tf.font=style.font; // _sans; _serif; _typewriter
		if(style.fontweight=='bold'){
			tf.bold = true;
		}
		if(style.fontstyle=='italic'){
			tf.italic = true;
		}
		tf.color = style.getHexColor();
		tf.size = fontSize[style.size];
		return tf;
	}

	public static function getWidth(style:Style, text:String):Number{
		init();
		var tfield:TextField = new TextField();
		tfield.defaultTextFormat = getTextFormat(style);
		tfield.text = text;
		return tfield.getLineMetrics(0).width + 4;
		//return getTextFormat(style).getTextExtent(text).textFieldWidth;
	}
	
	public static function getHeight(style:Style, text:String):Number{
		init();
		var tfield:TextField = new TextField();
		tfield.defaultTextFormat = getTextFormat(style);
		tfield.text = text;
		return tfield.getLineMetrics(0).height+4;
		//return getTextFormat(style).getTextExtent(text).textFieldHeight;
	}

	public static function getAscent(style:Style, text:String):Number{
		init();
		var tfield:TextField = new TextField();
		tfield.defaultTextFormat = getTextFormat(style);
		tfield.text = text;
		return tfield.getLineMetrics(0).ascent;
		//return getTextFormat(style).getTextExtent(text).ascent;
	}

}

}