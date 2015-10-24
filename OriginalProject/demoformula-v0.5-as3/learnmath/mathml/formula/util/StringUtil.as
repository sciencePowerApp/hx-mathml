package learnmath.mathml.formula.util{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.util.*;
import learnmath.mathml.formula.entities.*;

public class StringUtil{
	
	public static function trim(txt_str:String):String {
		if(txt_str=="") return "";
		while (true){
			if(txt_str.charAt(0) == " " || txt_str.charCodeAt(0)==160){
			}else if(txt_str.charCodeAt(0)<14) {
			}else{
				break;
			}
				txt_str = txt_str.substring(1, txt_str.length);
		}
		while (true) {
			if(txt_str.charAt(txt_str.length-1) == " " || txt_str.charCodeAt(txt_str.length-1)==160){
			}else if(txt_str.charCodeAt(txt_str.length-1)<14) {
			}else{
				break;
			}
			txt_str = txt_str.substring(0, txt_str.length-1);
		}
		//trace("trimed text: " + txt_str);
		//for(var i=0; i<txt_str.length; i++){
		//	trace(txt_str.charCodeAt(i));
		//}
		return txt_str;
	}    
	
	
	public static function replace(input:String, stringToFind:String, stringToInsert:String):String {
		var output:String = "";
		var len:int = stringToFind.length;
		while (input.indexOf(stringToFind) != -1) {
			var currOffset:int = input.indexOf(stringToFind);
			output = output+input.substring(0, currOffset);
			output = output+stringToInsert;
			input = input.substr(currOffset+len, input.length);
		}
		output = output+input;
		return (output);
	}
	
	public static function isUnicode(codeOrName:String):Boolean{
		codeOrName = trim(codeOrName);
		if(codeOrName.indexOf("&#x")==0) return true;
		return false;
	}
	
}

}