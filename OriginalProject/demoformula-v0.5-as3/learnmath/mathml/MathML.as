package learnmath.mathml{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import learnmath.mathml.formula.script.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.util.*;
import flash.geom.*;
import flash.display.MovieClip;

public class MathML{
	
	private var _xml:XML;
	public var dE:DrawFormula;
	
	public function MathML(xml:XML):void{
		this._xml = xml;

		var node:XML = _xml.children()[0];
		
		if(node.localName().toLowerCase().indexOf("math")>-1){
			var index:int = 0;
			for(var i:int =0; i<node.children().length();i++){
				if(node.children()[i].localName()!=""){
					index = i;
					break;
				}
			}
			node = node.children()[index];
		}else{
			index = 0;
			for(i =0; i<_xml.children().length();i++){
				if(_xml.children()[i].localName()!=""){
					index = i;
					break;
				}
			}
			node= _xml.children()[index];
		}
		
		var rootBox:Box = loadNode(node, null);
		dE = new DrawFormula(rootBox);
	}
	
	public function drawFormula(graph:MovieClip, style:Style, start:Point):Rectangle{
		dE.clear(graph);
		return dE.draw(graph, style, start);
	}
	
	private function loadNode(node:XML, parentBox:Box):Box{
		var name:String = node.localName().toLowerCase();
		var box:Box;
		if(name=='mrow'){
			box = loadMrow(node, parentBox);
		}else if(name=='mfenced'){
			box = loadMfenced(node, parentBox);
		}else if(name=='mphantom'){
			box = loadMPhantom(node, parentBox);
		}else if(name=='merror'){
			box = loadMError(node, parentBox);
		}else if(name=='mfrac'){
			box = loadMfrac(node, parentBox);
		}else if(name=='msqrt'){
			box = loadMSqrt(node, parentBox);
		}else if(name=='mroot'){
			box = loadMRoot(node, parentBox);
		}else if(name=='mover'){
			box = loadMOver(node, parentBox);
		}else if(name=='msup'){
			box = loadMSup(node, parentBox);
		}else if(name=='munder'){
			box = loadMUnder(node, parentBox);
		}else if(name=='msub'){
			box = loadMSub(node, parentBox);
		}else if(name=='msubsup'){
			box = loadMSubSup(node, parentBox);
		}else if(name=='munderover'){
			box = loadMUnderOver(node, parentBox);
		}else if(name=='mi'){
			box = loadMi(node, parentBox);
		}else if(name=='mn'){
			box = loadMn(node, parentBox);
		}else if(name=='mo'){
			box = loadMo(node, parentBox);
		}else if(name=='mtext'){
			box = loadMtext(node, parentBox);
		}else if(name=='mtable'){
			box = loadMTable(node, parentBox);
		}else if(name=='mtr'){
			box = loadMTr(node, parentBox);
		}else if(name=='mtd'){
			box = loadMTd(node, parentBox);
		}
		loadAttributes(node, box);
		
		return box;
	}
	
	private function loadAttributes(node:XML, box:Box):void{
		if(node.@color.length()==1){
			box.style.color = node.attribute("color");
		}
		if(node.@fontweight.length()==1){
			box.style.fontweight = node.attribute("fontweight");
		}
		if(node.@fontstyle.length()==1){
			box.style.fontstyle = node.attribute("fontstyle");
		}
		if(node.@fontsize.length()==1){
			box.style.size = int(node.attribute("fontsize"));
		}
		if(node.@fontfamily.length()==1){
			box.style.font = node.attribute("fontfamily");
		}
	}
	
	private function loadMrow(node:XML, parentBox:Box):Box{
		var nodeBox:RowBox = new RowBox(parentBox);
		for(var i:int =0; i<node.children().length();i++){
			if(node.children()[i].localName()!=null){
				var child:Box = loadNode(node.children()[i], nodeBox);
				nodeBox.addChild(child);
			}
		}
		return nodeBox;
	}
	
	private function loadMTable(node:XML, parentBox:Box):Box{
		var nodeBox:TableBox = new TableBox(parentBox);
		for(var i:int =0; i<node.children().length();i++){
			if(node.children()[i].localName()!=null){
				if(node.children()[i].localName().toLowerCase()=="mtr"){
					var child:Box = loadNode(node.children()[i], nodeBox);
					nodeBox.addRow(child);
				}
			}
		}
		if(node.attribute("rowalign")!=""){
			nodeBox.rowalign = StringUtil.trim(node.attribute("rowalign"));
		}
		if(node.attribute("columnalign")!=""){
			nodeBox.columnalign = StringUtil.trim(node.attribute("columnalign"));
		}
		if(node.attribute("rowspacing")!=""){
			nodeBox.rowspacing = Number(StringUtil.trim(node.attribute("rowspacing")));
		}
		if(node.attribute("columnspacing")!=""){
			nodeBox.columnspacing = Number(StringUtil.trim(node.attribute("columnspacing")));
		}
		if(node.attribute("framespacing")!=""){
			nodeBox.framespacing = Number(StringUtil.trim(node.attribute("framespacing")));
		}
		
		return nodeBox;
	}
	

	private function loadMTr(node:XML, parentBox:Box):Box{
		var nodeBox:TrBox = new TrBox(parentBox);
		for(var i:int =0; i<node.children().length();i++){
			if(node.children()[i].localName()!=null){
				if(node.children()[i].localName().toLowerCase()=="mtd"){
					var child:Box = loadNode(node.children()[i], nodeBox);
					nodeBox.addTd(child);
				}
			}
		}
		if(node.attribute("rowalign")!=""){
			nodeBox.rowalign = StringUtil.trim(node.attribute("rowalign"));
		}
		if(node.attribute("columnalign")!=""){
			nodeBox.columnalign = StringUtil.trim(node.attribute("columnalign"));
		}
		return nodeBox;
	}


	private function loadMTd(node:XML, parentBox:Box):Box{
		var nodeBox:TdBox = new TdBox(parentBox);
		for(var i:int =0; i<node.children().length();i++){
			if(node.children()[i].localName()!=null){
				var child:Box = loadNode(node.children()[i], nodeBox);
				nodeBox.addChild(child);
			}
		}
		if(node.attribute("rowalign")!=""){
			nodeBox.rowalign = StringUtil.trim(node.attribute("rowalign"));
		}
		if(node.attribute("columnalign")!=""){
			nodeBox.columnalign = StringUtil.trim(node.attribute("columnalign"));
		}
		if(node.attribute("rowspan")!=""){
			nodeBox.rowspan = Number(StringUtil.trim(node.attribute("rowspan")));
		}
		if(node.attribute("columnspan")!=""){
			nodeBox.columnspan = Number(StringUtil.trim(node.attribute("columnspan")));
		}
		return nodeBox;
	}

	private function loadMfenced(node:XML, parentBox:Box):Box{
		var nodeBox:FencedBox = new FencedBox(parentBox);
		for(var i:int =0; i<node.children().length();i++){
			if(node.children()[i].localName()!=null){
				var child:Box = loadNode(node.children()[i], nodeBox);
				nodeBox.addChild(child);
			}
		}
		if(node.attribute("linethickness").length()!=0){
			nodeBox.linethickness = Number(node.attribute("linethickness"));
		}
		if(node.attribute("open").length()!=0){
			nodeBox.open = node.attribute("open");
		}
		if(node.attribute("close").length()!=0){
			nodeBox.close = node.attribute("close");
		}
		return nodeBox;
	}
	
	private function loadMPhantom(node:XML, parentBox:Box):Box{
		var nodeBox:PhantomBox = new PhantomBox(parentBox);
		for(var i:int =0; i<node.children().length();i++){
			if(node.children()[i].localName()!=null){
				var child:Box = loadNode(node.children()[i], nodeBox);
				nodeBox.addChild(child);
			}
		}
		return nodeBox;
	}

	private function loadMError(node:XML, parentBox:Box):Box{
		var nodeBox:ErrorBox = new ErrorBox(parentBox);
		for(var i:int =0; i<node.children().length();i++){
			if(node.children()[i].localName()!=null){
				var child:Box = loadNode(node.children()[i], nodeBox);
				nodeBox.addChild(child);
			}
		}
		nodeBox.style.color = "#ff0000";
		return nodeBox;
	}

	private function loadMfrac(node:XML, parentBox:Box):Box{
		var nodeBox:FracBox = new FracBox(parentBox);
		if(node.attribute("linethickness").length()!=0){
			nodeBox.linethickness = Number(node.attribute("linethickness"));
		}
		if(node.attribute("bevelled").length()!=0){
			if (node.attribute("bevelled").toString()=="true")
				nodeBox.bevelled = true;
		}
		var numNode:Box = loadNode(node.children()[0], nodeBox);
		nodeBox.num = numNode;
		var denumNode:Box = loadNode(node.children()[1], nodeBox);
		nodeBox.denum = denumNode;
		return nodeBox;
	}

	private function loadMSqrt(node:XML, parentBox:Box):Box{
		var nodeBox:SqrtBox = new SqrtBox(parentBox);
		for(var i:int =0; i<node.children().length();i++){
			if(node.children()[i].localName()!=null){
				var child:Box = loadNode(node.children()[i], nodeBox);
				nodeBox.addChild(child);
			}
		}
		if(node.attribute("linethickness")!=""){
			nodeBox.linethickness = int(node.attribute("linethickness"));
		}
		return nodeBox;
	}

	private function loadMRoot(node:XML, parentBox:Box):Box{
		var nodeBox:RootBox = new RootBox(parentBox);
		var baseNode:Box = loadNode(node.children()[0], nodeBox);
		nodeBox.base = baseNode;
		var expNode:Box = loadNode(node.children()[1], nodeBox);
		nodeBox.index = expNode;
		if(node.attribute("linethickness").length()!=0){
			nodeBox.linethickness = int(node.attribute("linethickness"));
		}
		return nodeBox;
	}
	
	private function loadMSup(node:XML, parentBox:Box):Box{
		var nodeBox:SupBox = new SupBox(parentBox);
		var baseNode:Box = loadNode(node.children()[0], nodeBox);
		nodeBox.base = baseNode;
		var expNode:Box = loadNode(node.children()[1], nodeBox);
		nodeBox.exp = expNode;
		return nodeBox;
	}

	private function loadMOver(node:XML, parentBox:Box):Box{
		var nodeBox:OverBox = new OverBox(parentBox);
		var baseNode:Box = loadNode(node.children()[0], nodeBox);
		nodeBox.base = baseNode;
		var expNode:Box = loadNode(node.children()[1], nodeBox);
		nodeBox.exp = expNode;
		return nodeBox;
	}
	
	private function loadMSub(node:XML, parentBox:Box):Box{
		var nodeBox:SubBox = new SubBox(parentBox);
		var baseNode:Box = loadNode(node.children()[0], nodeBox);
		nodeBox.base = baseNode;
		var expNode:Box = loadNode(node.children()[1], nodeBox);
		nodeBox.sub = expNode;
		return nodeBox;
	}

	private function loadMUnder(node:XML, parentBox:Box):Box{
		var nodeBox:UnderBox = new UnderBox(parentBox);
		var baseNode:Box = loadNode(node.children()[0], nodeBox);
		nodeBox.base = baseNode;
		var expNode:Box = loadNode(node.children()[1], nodeBox);
		nodeBox.sub = expNode;
		return nodeBox;
	}

	private function loadMSubSup(node:XML, parentBox:Box):Box{
		var nodeBox:SubSupBox = new SubSupBox(parentBox);
		var baseNode:Box = loadNode(node.children()[0], nodeBox);
		nodeBox.base = baseNode;
		var subNode:Box = loadNode(node.children()[1], nodeBox);
		nodeBox.sub = subNode;
		var expNode:Box = loadNode(node.children()[2], nodeBox);
		nodeBox.exp = expNode;
		return nodeBox;
	}

	private function loadMUnderOver(node:XML, parentBox:Box):Box{
		var nodeBox:UnderOverBox = new UnderOverBox(parentBox);
		var baseNode:Box = loadNode(node.children()[0], nodeBox);
		nodeBox.base = baseNode;
		var subNode:Box = loadNode(node.children()[1], nodeBox);
		nodeBox.sub = subNode;
		var expNode:Box = loadNode(node.children()[2], nodeBox);
		nodeBox.exp = expNode;
		return nodeBox;
	}

	private function loadMi(node:XML, parentBox:Box):Box{
		var nodeBox:IBox = new IBox(parentBox);
		nodeBox.text = StringUtil.trim(node.children()[0].toString());
		return nodeBox;
	}

	private function loadMo(node:XML, parentBox:Box):Box{
		return OBox.getOBox(StringUtil.trim(node.children()[0].toString()), parentBox);
	}
	
	private function loadMtext(node:XML, parentBox:Box):Box{
		var nodeBox:TBox = new TBox(parentBox);
		nodeBox.text = StringUtil.trim(node.children()[0].toString());
		return nodeBox;
	}

	private function loadMn(node:XML, parentBox:Box):Box{
		var nodeBox:NBox = new NBox(parentBox);
		nodeBox.number = Number(StringUtil.trim(node.children()[0].toString()));
		return nodeBox;
	}
}

}