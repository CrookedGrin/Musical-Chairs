package {

	public class Student {

		public var id:int;
		public var seat:Seat;
		public var name:String;
		public var xRefs:Vector.<StudentXRef>;
		public var groups:Vector.<RuleGroup>;

		public function Student() {
			xRefs = new Vector.<StudentXRef>;
			groups = new Vector.<RuleGroup>;
		}

		public function addXRef( xRef:StudentXRef ):void {
			if (xRefs.indexOf(xRef) < 0) {
				xRefs.push(xRef);
			}
		}

		public function addToRuleGroup( group:RuleGroup ):void {
			if (groups.indexOf(group) < 0) {
				groups.push(group);
			}
		}

		public function removeFromRuleGroup( group:RuleGroup ):void {
			var idx:int = groups.indexOf(group);
			if (idx >= 0) {
				groups.splice(idx, 1);
			}
		}
		
		public function destruct():void {
			xRefs = null;
			groups = null;
		}
		
	}
}
