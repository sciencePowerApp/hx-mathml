package learnmath.mathml.formula;
import learnmath.mathml.formula.entities.EntityGroup;
import learnmath.mathml.formula.entities.Isoamsa;

class EntityManager {
	public static var groupentities:Array<EntityGroup> = new Array<EntityGroup>();
	
	// Ex:code = &string;
	public static function getUnicode(code:String):String {
		loadGroups();
		code = StringTools.trim(code);
		code = replaceWithKnownCode(code);
		
		for (group in groupentities) {
			var unicode:String = group.getUnicode(code);
			if (unicode != "") return unicode;
		}
		
		return "";
	}
	
	public static function getChar(code:String):String {
		loadGroups();
		code = StringTools.trim(code);
		code = replaceWithKnownCode(code);
		var char:String = getCustomUnicode(code);
		if (char != "") return char;
		for (group in groupentities) {
			char = group.getChar(code);
			if (char != "") return char;
		}
		
		return "";
	}
	
	// Ex:unicode = &#x02AEF;
	public static function getName(unicode:String):String {
		loadGroups();
		var code:String = StringTools.trim(unicode);
		for (group in groupentities) {
			var code1:String = group.getCode(code);
			if (code1 != "") return code1;
		}
		return "";
	}
	
	private static function loadGroups():Void {
		if (groupentities.length < 1) {
			groupentities.push(new Isoamsa());
			/*
			groupentities.push(new Isoamsb());
			groupentities.push(new Isoamsc());
			groupentities.push(new Isoamsn());
			groupentities.push(new Isoamso());
			groupentities.push(new Isoamsr());
			groupentities.push(new Isobox());
			groupentities.push(new Isocyr1());
			groupentities.push(new Isocyr2());
			groupentities.push(new Isodia());
			groupentities.push(new Isogrk3());
			groupentities.push(new Isolat1());
			groupentities.push(new Isolat2());
			groupentities.push(new Isomfrk());
			groupentities.push(new Isomopf());
			groupentities.push(new Isomscr());
			groupentities.push(new Isonum());
			groupentities.push(new Isopub());
			groupentities.push(new Isotech());
			groupentities.push(new Mmlalias1());
			groupentities.push(new Mmlalias2());
			groupentities.push(new Mmlalias3());
			groupentities.push(new Mmlalias4());
			groupentities.push(new Mmlextra());
			*/
		}
	}
	
	public static function replaceAllCode(text:String):String {
		if (text == '&InvisibleTimes;') return "";
		if (text == '&it;') return "&it;";
		if (text == '&ApplyFunction;') return "";
		if (text == '&af;') return "";
		if (text == '&InvisibleComma;') return "";
		if (text == '&ic;') return "";
		
		var index:Int = -1;
		
		while (text.indexOf("&", index) > -1) {
			index = text.indexOf("&", index);
			var indexEnd:Int = text.indexOf(";", index);
			if (indexEnd > -1) {
				var code:String = text.substring(index, indexEnd + 1);
				var t:String = getChar(code);
				if (t != "") {
					text = text.substring(0, index) + t + text.substring(indexEnd+1);
				} else {
					index++;
				}
			} else {
				index++;
			}
		}
		
		return text;
	}
	
	private static function getCustomUnicode(code:String):String {
		if(code=='&sdot;') return "•";
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
		if(code=='&int;' || code=='?') return "&Integral;";
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
		if(code=='&InvisibleTimes;') return "";
		if(code=='&it;') return "&it;";
		if(code=='&ApplyFunction;') return "";
		if(code=='&af;') return "";
		if(code=='&InvisibleComma;') return "";
		if(code=='&ic;') return "";

		return code;
	}
}