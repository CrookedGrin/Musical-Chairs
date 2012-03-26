package {

	public class StudentTranche implements ITranche {
		
		private var students:Vector.<Student>;
		
		public function StudentTranche() {
			students = new Vector.<Student>;
		}

		public function get value():Number {

			return 0;
		}

		public function set value( v:Number ):void {
		}

		public function get items():Vector.<*> {
			return students as Vector.<*>;
		}

		public function addItem( item:* ):void {
			if (item is StudentXRef) {
				var xRef:StudentXRef = item as StudentXRef;
				if (students.indexOf(xRef.studentA) < 0) {
					students.push(xRef.studentA);
				}
				if (students.indexOf(xRef.studentB) < 0) {
					students.push(xRef.studentB);
				}
			}
		}
		
		public function shuffle():void {
			// TODO: randomize all the items in this Tranche
		}
	}
}
