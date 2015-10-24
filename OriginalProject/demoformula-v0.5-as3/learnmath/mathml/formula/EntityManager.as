package learnmath.mathml.formula{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.util.*;
import learnmath.mathml.formula.entities.*;

public class EntityManager{
	
	public static var groupentities:Array = new Array();
	
	
	// Ex:code = &string;
	public static function getUnicode(code:String):String{
		loadGroups();
		code = StringUtil.trim(code);
		code = replaceWithKnownCode(code);
		for(var i:int =0; i<groupentities.length;i++){
			var group:EntityGroup = groupentities[i];
			var unicode:String = group.getUnicode(code);
			if(unicode!="") return unicode;
		}
		
		return "";
	}

	public static function getChar(code:String):String{
		loadGroups();
		code = StringUtil.trim(code);
		code = replaceWithKnownCode(code);
		var char:String = getCustomUnicode(code);
		if(char!="") return char;
		
		for(var i:int =0; i<groupentities.length;i++){
			var group:EntityGroup = groupentities[i];
			char = group.getChar(code);
			if(char!="") return char;
		}
		
		return "";
	}

	// Ex:unicode = &#x02AEF;
	public static function getName(unicode:String):String{
		loadGroups();
		var code:String = StringUtil.trim(unicode);
		for(var i:Number =0; i<groupentities.length;i++){
			var group:EntityGroup = groupentities[i];
			var code1:String = group.getCode(code);
			if(code1!="") return code1;
		}
		return "";
	}

	private static function loadGroups():void{
		if(groupentities.length<1){
			groupentities[groupentities.length] = new Isoamsa();
			groupentities[groupentities.length] = new Isoamsb();
			groupentities[groupentities.length] = new Isoamsc();
			groupentities[groupentities.length] = new Isoamsn();
			groupentities[groupentities.length] = new Isoamso();
			groupentities[groupentities.length] = new Isoamsr();
			groupentities[groupentities.length] = new Isobox();
			groupentities[groupentities.length] = new Isocyr1();
			groupentities[groupentities.length] = new Isocyr2();
			groupentities[groupentities.length] = new Isodia();
			groupentities[groupentities.length] = new Isogrk3();
			groupentities[groupentities.length] = new Isolat1();
			groupentities[groupentities.length] = new Isolat2();
			groupentities[groupentities.length] = new Isomfrk();
			groupentities[groupentities.length] = new Isomopf();
			groupentities[groupentities.length] = new Isomscr();
			groupentities[groupentities.length] = new Isonum();
			groupentities[groupentities.length] = new Isopub();
			groupentities[groupentities.length] = new Isotech();
			groupentities[groupentities.length] = new Mmlalias1();
			groupentities[groupentities.length] = new Mmlalias2();
			groupentities[groupentities.length] = new Mmlalias3();
			groupentities[groupentities.length] = new Mmlalias4();
			groupentities[groupentities.length] = new Mmlextra();
		}
	}
	

	public static function replaceAllCode(text:String):String{
		var index:int = -1;
		
		while(text.indexOf("&", index)>-1){
			index = text.indexOf("&", index);
			var indexEnd:int = text.indexOf(";", index);
			if(indexEnd>-1){
				var code:String = text.substring(index, indexEnd+1);
				var t:String = getChar(code);
				if(t!=""){
					text = text.substring(0, index) + t + text.substring(indexEnd+1);
				}else{
					index++;
				}
			}else{
				index++;
			}
		}
		
		return text;
	}
	

	private static function getCustomUnicode(code:String):String{
		if(code=='&plus;') return "+";
		if(code=='&minus;') return "-";
		if(code=='&it;' || code=='&InvisibleTimes;') return " ";
		return "";
	}

	public static function replaceWithKnownCode(code:String):String{
		if(code=='&div;') return "&divide;";
		if(code=='&CenterDot;' || code=='&centerdot;') return "&middot;";
		if(code=='&PlusMinus;' || code=='&pm;') return "&plusmn;";
		if(code=='&MinusPlus;' || code=='&mp;') return "&mnplus;";
		if(code=='&ContourIntegral;' || code=='&conint;') return "&oint;";
		if(code=='&iiint;') return "&tint;";
		if(code=='&iiiint;') return "&qint;";
		if(code=='&DoubleContourIntegral;') return "&Conint;";
		if(code=='&Coproduct;' || code=='&amalg;') return "&coprod;";
		if(code=='&xcap;' || code=='&bigcap;') return "&Intersection;";
		if(code=='&xcup;' || code=='&bigcup;') return "&Union;";
		if(code=='&Dot;') return "&ddot;";
		if(code=='&ctdot;' || code=='&tdot;') return "&TripleDot;";
		if(code=='&macr;') return "&OverBar;";
		if(code=='&hat;') return "&Hat;";
		if(code=='&tilde;' || code=='˜') return "&Tilde;";
		if(code=='&rightharpoonup;') return "&rharu;";
		if(code=='&leftharpoonup;') return "&lharu;";
		if(code=='&sfrown;' || code=='&OverParenthesis;') return "&frown;";
		if(code=='&ssmile;') return "&smile;";
		if(code=='&cub;') return "&OverBrace;";
		if(code=='&int;' || code=='∫') return "&Integral;";
		if(code=='&odot;') return "&CircleDot;";
		if(code=='&ominus;') return "&CircleMinus;";
		if(code=='&oplus;') return "&CirclePlus;";
		if(code=='&otimes;') return "&CircleTimes;";
		if(code=='&infinity;') return "&infin;";
		if(code=='&NestedGreaterGreater;' || code=='&gg;') return "&Gt;";
		if(code=='&NestedLessLess;' || code=='&ll;') return "&Lt;";
		if(code=='&ngE;') return "&ngeqq;";
		if(code=='&nlE;') return "&nleqq;";
		if(code=='&ngt;') return "&ngtr;";
		if(code=='&nlt;') return "&nless;";
		if(code=='&nGtv;') return "&NotGreaterGreater;";
		if(code=='&nLtv;') return "&NotLessLess;";
		if(code=='&geq;' || code=='&GreaterEqual;') return "&ge;";
		if(code=='&leq;') return "&le;";
		if(code=='&lE;' || code=='&LessFullEqual;') return "&leqq;";
		if(code=='&gE;' || code=='&GreaterFullEqual;') return "&geqq;";
		if(code=='&gE;' || code=='&GreaterFullEqual;') return "&geqq;";
		if(code=='&ggg;') return "&Gg;";
		if(code=='&lll;') return "&Ll;";
		if(code=='&Congruent;') return "&equiv;";
		if(code=='&NotEqual;') return "&ne;";
		if(code=='&TildeTilde;' || code=='&thickapprox;') return "&approx;";
		if(code=='&backsim;' || code=='&Tilde;' || code=='&thicksim;') return "&sim;";
		if(code=='&backcong;') return "&bcong;";
		if(code=='&approxeq;') return "&ape;";
		if(code=='&Colon;') return "&Proportion;";
		if(code=='&fallingdotseq;') return "&efDot;";
		if(code=='&smid;' || code=='&VerticalBar;' || code=='&shortmid;') return "&mid;";
		if(code=='&parallel;' || code=='&spar;' || code=='&shortparallel;') return "&par;";
		if(code=='¯') return "&UnderBar;";
		if(code=='→') return "&rarr;";
		if(code=='←') return "&larr;";
		if(code=='↔') return "&harr;";
		if(code=='∑') return "&sum;";
		if(code=='∏') return "&prod;";

		return code;
	}

}

}