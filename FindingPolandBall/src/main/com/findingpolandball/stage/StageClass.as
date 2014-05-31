package com.findingpolandball.stage{

	import flash.display.MovieClip;
	import com.findingpolandball.view.environment.Environment;
	
	public class StageClass extends MovieClip {
		public function StageClass() {
			super();
			trace("generate game enevironment:");
			trace("this.widht:" + stage.stageWidth);
			trace("this.height:" + stage.stageHeight);

			//loadEnvironment();
		}
		
		public function loadEnvironment() {
			var intialLevel:int = 1;
		//	var environment:Environment = new Environment(intialLevel, stage.stageWidth, stage.stageHeight);
		//	environment.generateLevel();
		//	this.addChild(environment);
		}
	}
	
}
