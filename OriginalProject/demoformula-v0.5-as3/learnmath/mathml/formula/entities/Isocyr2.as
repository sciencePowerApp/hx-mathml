package learnmath.mathml.formula.entities{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.entities.*;

public class Isocyr2 extends EntityGroup{
	
	//Non-Russian Cyrillic for MathML 2.0
	
	override public function getEntities():String{
		return allCodes;
	}

private static var allCodes:String = "<! DJcy             &#x00402; >" + 
"<! djcy             &#x00452; >" + 
"<! DScy             &#x00405; >" + 
"<! dscy             &#x00455; >" + 
"<! DZcy             &#x0040F; >" + 
"<! dzcy             &#x0045F; >" + 
"<! GJcy             &#x00403; >" + 
"<! gjcy             &#x00453; >" + 
"<! Iukcy            &#x00406; >" + 
"<! iukcy            &#x00456; >" + 
"<! Jsercy           &#x00408; >" + 
"<! jsercy           &#x00458; >" + 
"<! Jukcy            &#x00404; >" + 
"<! jukcy            &#x00454; >" + 
"<! KJcy             &#x0040C; >" + 
"<! kjcy             &#x0045C; >" + 
"<! LJcy             &#x00409; >" + 
"<! ljcy             &#x00459; >" + 
"<! NJcy             &#x0040A; >" + 
"<! njcy             &#x0045A; >" + 
"<! TSHcy            &#x0040B; >" + 
"<! tshcy            &#x0045B; >" + 
"<! Ubrcy            &#x0040E; >" + 
"<! ubrcy            &#x0045E; >" + 
"<! YIcy             &#x00407; >" + 
"<! yicy             &#x00457; >";
}

}