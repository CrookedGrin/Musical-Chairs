package {

	public class RuleGroup {

		public var id:uint;
		public var name:String;
		public var students:Vector.<Student>;
		public var weight:Number;

		public function RuleGroup( idArg:uint, weightArg:Number, list:Array ) {

			id = idArg;
			weight = weightArg;
			name = "Rule " + id;
			
			students = new Vector.<Student>;
			for each (var student:Student in list) {
				students.push(student);
				student.addToRuleGroup(this);
			}
		}
		
	}
}
