package {
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	
	import mx.core.UIComponent;
	
	import spark.components.Label;

	public class Seat {
		
		public var id:int;
		public var rowIndex:int;
		public var colIndex:int;
		public var coords:Point; // on-screen x-y position
		public var student:Student;
		public var xRefs:Vector.<SeatXRef>;
		
		protected var uiComp:UIComponent;
		protected var bgSprite:Sprite;
		protected var seatNumLabel:TextField;
		protected var studentLabel:TextField;
		
		public static const SEAT_SIZE:Number = 100;
		
		public function Seat() {
			xRefs = new Vector.<SeatXRef>;
		}
		
		public function get display():UIComponent {
			
			if (!uiComp) {
				uiComp = new UIComponent();
			}
			
			if (!bgSprite) {
				bgSprite = new Sprite();
				bgSprite.graphics.beginFill(0x999999, 1);
				bgSprite.graphics.drawRoundRect(1, 1, SEAT_SIZE-1, SEAT_SIZE-1, SEAT_SIZE/4, SEAT_SIZE/4);
				bgSprite.graphics.endFill();
				uiComp.addChild(bgSprite);
			}
			
			if (!seatNumLabel) {
				seatNumLabel = new TextField();
				seatNumLabel.width = SEAT_SIZE;
				seatNumLabel.x = 4;
				seatNumLabel.y = 4;
				seatNumLabel.text = id.toString();
				seatNumLabel.mouseEnabled = false;
				uiComp.addChild(seatNumLabel);
			}
			
			if (!studentLabel) {
				studentLabel = new TextField();
				studentLabel.width = SEAT_SIZE - (SEAT_SIZE/4);
				studentLabel.x = SEAT_SIZE/8;
				studentLabel.y = 30;
				studentLabel.mouseEnabled = false;
				uiComp.addChild(studentLabel);
			}
			
			return uiComp;
			
		}
		
		public function addXRef(xRef:SeatXRef):void {
			if (xRefs.indexOf(xRef) < 0) {
				xRefs.push(xRef);
			}
		}

		public function setStudent( s:Student ):void {
			student = s;
			student.seat = this;
			seatNumLabel.text = student.name;
			updateDisplay();
		}
		
		protected function updateDisplay():void {
			var txt:String = "Student " + student.id;
			if (student.groups.length > 0) {
				txt += "/r/n";
				txt += "(";
				for each (var group:RuleGroup in student.groups) {
					txt += group.name + ", ";
				}
				// remove last ", "
				txt = txt.substr(0, txt.length-2);
				txt += ")";
			}
			studentLabel.text = txt;
		}		
		
		
	}
}
