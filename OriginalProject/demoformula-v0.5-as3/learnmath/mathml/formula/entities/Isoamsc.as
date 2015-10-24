package learnmath.mathml.formula.entities{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.entities.*;

public class Isoamsc extends EntityGroup{
	
	//Added Math Symbols: Delimiters for MathML 2.0
	
	override public function getEntities():String{
		return allCodes;
	}

private static var allCodes:String = "<! dlcorn           &#x0231E; >" + 
"<! drcorn           &#x0231F; >" + 
"<! gtlPar           &#x02995; >" + 
"<! langd            &#x02991; >" + 
"<! lbrke            &#x0298B; >" + 
"<! lbrksld          &#x0298F; >" + 
"<! lbrkslu          &#x0298D; >" + 
"<! lceil            &#x02308; >" + 
"<! lfloor           &#x0230A; >" + 
"<! lmoust           &#x023B0; >" + 
"<! lparlt           &#x02993; >" + 
"<! ltrPar           &#x02996; >" + 
"<! rangd            &#x02992; >" + 
"<! rbrke            &#x0298C; >" + 
"<! rbrksld          &#x0298E; >" + 
"<! rbrkslu          &#x02990; >" + 
"<! rceil            &#x02309; >" + 
"<! rfloor           &#x0230B; >" + 
"<! rmoust           &#x023B1; >" + 
"<! rpargt           &#x02994; >" + 
"<! ulcorn           &#x0231C; >" + 
"<! urcorn           &#x0231D; >";

}

}