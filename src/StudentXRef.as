package {
	
	public class StudentXRef {
		
		public var studentA:Student;
		public var studentB:Student;
		protected var cachedDelta:Number;
		
		public function StudentXRef(a:Student, b:Student) {
			
			studentA = a;
			studentB = b;
			
			// link this object back to each of the points, so they can access all their own relevant xRefs
			studentA.addXRef(this);
			studentB.addXRef(this);
			
			// TODO: add listeners to the position of students to recalculate delta when positions change
		}
		
		public function get delta():Number {
			if (isNaN(cachedDelta)) {
				cachedDelta = calculateDelta();
			}
			return cachedDelta;
		}
		
		/**
		 * This method should only be called internally until the points change position
		 * Otherwise, cached delta should be accessed via delta getter
		 */
		public function calculateDelta():Number {

			return 0;
		}
		
		
	}
}
