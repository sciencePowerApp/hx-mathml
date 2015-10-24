package learnmath.mathml.formula.entities{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.entities.*;

public class Isoamsb extends EntityGroup{
	
	//Added Math Symbols: Binary Operators for MathML 2.0
	
	
	override public function getEntities():String{
		return allCodes;
	}

private static var allCodes:String = "<! ac               &#x0223E; >" + 
"<! acE              &#x0223E;&#x00333; >" + 
"<! amalg            &#x02A3F; >" + 
"<! barvee           &#x022BD; >" + 
"<! Barwed           &#x02306; >" + 
"<! barwed           &#x02305; >" + 
"<! bsolb            &#x029C5; >" + 
"<! Cap              &#x022D2; >" + 
"<! capand           &#x02A44; >" + 
"<! capbrcup         &#x02A49; >" + 
"<! capcap           &#x02A4B; >" + 
"<! capcup           &#x02A47; >" + 
"<! capdot           &#x02A40; >" + 
"<! caps             &#x02229;&#x0FE00; >" + 
"<! ccaps            &#x02A4D; >" + 
"<! ccups            &#x02A4C; >" + 
"<! ccupssm          &#x02A50; >" + 
"<! coprod           &#x02210; >" + 
"<! Cup              &#x022D3; >" + 
"<! cupbrcap         &#x02A48; >" + 
"<! cupcap           &#x02A46; >" + 
"<! cupcup           &#x02A4A; >" + 
"<! cupdot           &#x0228D; >" + 
"<! cupor            &#x02A45; >" + 
"<! cups             &#x0222A;&#x0FE00; >" + 
"<! cuvee            &#x022CE; >" + 
"<! cuwed            &#x022CF; >" + 
"<! Dagger           &#x02021; >" + 
"<! dagger           &#x02020; >" + 
"<! diam             &#x022C4; >" + 
"<! divonx           &#x022C7; >" + 
"<! eplus            &#x02A71; >" + 
"<! hercon           &#x022B9; >" + 
"<! intcal           &#x022BA; >" + 
"<! iprod            &#x02A3C; >" + 
"<! loplus           &#x02A2D; >" + 
"<! lotimes          &#x02A34; >" + 
"<! lthree           &#x022CB; >" + 
"<! ltimes           &#x022C9; >" + 
"<! midast           &#x0002A; >" + 
"<! minusb           &#x0229F; >" + 
"<! minusd           &#x02238; >" + 
"<! minusdu          &#x02A2A; >" + 
"<! ncap             &#x02A43; >" + 
"<! ncup             &#x02A42; >" + 
"<! oast             &#x0229B; >" + 
"<! ocir             &#x0229A; >" + 
"<! odash            &#x0229D; >" + 
"<! odiv             &#x02A38; >" + 
"<! odot             &#x02299; >" + 
"<! odsold           &#x029BC; >" + 
"<! ofcir            &#x029BF; >" + 
"<! ogt              &#x029C1; >" + 
"<! ohbar            &#x029B5; >" + 
"<! olcir            &#x029BE; >" + 
"<! olt              &#x029C0; >" + 
"<! omid             &#x029B6; >" + 
"<! ominus           &#x02296; >" + 
"<! opar             &#x029B7; >" + 
"<! operp            &#x029B9; >" + 
"<! oplus            &#x02295; >" + 
"<! osol             &#x02298; >" + 
"<! Otimes           &#x02A37; >" + 
"<! otimes           &#x02297; >" + 
"<! otimesas         &#x02A36; >" + 
"<! ovbar            &#x0233D; >" + 
"<! plusacir         &#x02A23; >" + 
"<! plusb            &#x0229E; >" + 
"<! pluscir          &#x02A22; >" + 
"<! plusdo           &#x02214; >" + 
"<! plusdu           &#x02A25; >" + 
"<! pluse            &#x02A72; >" + 
"<! plussim          &#x02A26; >" + 
"<! plustwo          &#x02A27; >" + 
"<! prod             &#x0220F; >" + 
"<! race             &#x029DA; >" + 
"<! roplus           &#x02A2E; >" + 
"<! rotimes          &#x02A35; >" + 
"<! rthree           &#x022CC; >" + 
"<! rtimes           &#x022CA; >" + 
"<! sdot             &#x022C5; >" + 
"<! sdotb            &#x022A1; >" + 
"<! setmn            &#x02216; >" + 
"<! simplus          &#x02A24; >" + 
"<! smashp           &#x02A33; >" + 
"<! solb             &#x029C4; >" + 
"<! sqcap            &#x02293; >" + 
"<! sqcaps           &#x02293;&#x0FE00; >" + 
"<! sqcup            &#x02294; >" + 
"<! sqcups           &#x02294;&#x0FE00; >" + 
"<! ssetmn           &#x02216; >" + 
"<! sstarf           &#x022C6; >" + 
"<! subdot           &#x02ABD; >" + 
"<! sum              &#x02211; >" + 
"<! supdot           &#x02ABE; >" + 
"<! timesb           &#x022A0; >" + 
"<! timesbar         &#x02A31; >" + 
"<! timesd           &#x02A30; >" + 
"<! tridot           &#x025EC; >" + 
"<! triminus         &#x02A3A; >" + 
"<! triplus          &#x02A39; >" + 
"<! trisb            &#x029CD; >" + 
"<! tritime          &#x02A3B; >" + 
"<! uplus            &#x0228E; >" + 
"<! veebar           &#x022BB; >" + 
"<! wedbar           &#x02A5F; >" + 
"<! wreath           &#x02240; >" + 
"<! xcap             &#x022C2; >" + 
"<! xcirc            &#x025EF; >" + 
"<! xcup             &#x022C3; >" + 
"<! xdtri            &#x025BD; >" + 
"<! xodot            &#x02A00; >" + 
"<! xoplus           &#x02A01; >" + 
"<! xotime           &#x02A02; >" + 
"<! xsqcup           &#x02A06; >" + 
"<! xuplus           &#x02A04; >" + 
"<! xutri            &#x025B3; >" + 
"<! xvee             &#x022C1; >" + 
"<! xwedge           &#x022C0; >";
}

}