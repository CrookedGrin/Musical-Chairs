package {
	
	public class StudentXRef {
		
		public var studentA:Student;
		public var studentB:Student;
		protected var cachedDelta:Number = -1;
		
		public function StudentXRef(a:Student, b:Student) {
			
			studentA = a;
			studentB = b;
			
			// link this object back to each of the points, so they can access all their own relevant xRefs
			studentA.addXRef(this);
			studentB.addXRef(this);
			
			// TODO: add listeners to the position of students to recalculate delta when positions change
		}
		
		public function get delta():Number {
			if (cachedDelta == -1) {
				cachedDelta = calculateDelta();
			}
			return cachedDelta;
		}
		
		/**
		 * Business logic for sorting students occurs here. Delta is calculated based on the
		 * rule groups for the two students. Delta will not be unique; for example, any 2 pairs 
		 * of students with no rule groups applied to either will have an equal delta (of 0).
		 *  
		 * This method should only be called internally until the points change position
		 * Otherwise, cached delta should be accessed via delta getter
		 */
		public function calculateDelta():Number {
			var d:Number = 0;
			// get all the unique groups to which both students belong, and
			// add to delta based on combined weight
			var allRules:Vector.<RuleGroup> = studentA.groups.concat(studentB.groups);
			var uniqueRules:Vector.<RuleGroup> = new Vector.<RuleGroup>;
			var rule:RuleGroup;
			for each (rule in allRules) {
				if (uniqueRules.indexOf(rule) < 0) {
					uniqueRules.push(rule);
				}
			}
			for each (rule in uniqueRules) {
				if ((rule.students.indexOf(studentA) > -1) && rule.students.indexOf(studentB)) {
					// both students are in this rule group; add it to delta
					d += rule.weight;
				}
			}
			return d;
		}
		
		
	}
}
