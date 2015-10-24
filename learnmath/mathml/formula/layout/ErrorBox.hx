package learnmath.mathml.formula.layout;

class ErrorBox extends RowBox {
	public function new(parentBox:Box) {
		super(parentBox);
	}
	
	override public function copyParentStyle(_styleParent:Style):Void {
		super.copyParentStyle(_styleParent);
		for (i in 0...children.length) {
			var child:Box = children[i];
			child.copyParentStyle(this.style);
		}
	}
	
	override public function toString():String {
		return "ErrorBox";
	}
}