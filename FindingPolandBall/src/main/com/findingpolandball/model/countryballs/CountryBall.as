package com.findingpolandball.model.countryballs 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import com.findingpolandball.view.environment.Level;
	import com.findingpolandball.view.userinterface.GameUI;
	import com.findingpolandball.view.userinterface.GameTimer;

	/**
	 * ...
	 * @author Denzil Daulo
	 */
	public class CountryBall extends MovieClip 
	{
		private var firstFrame:int;
		private var lastFrame:int;
		private var countryCode:int=0;
		private var env:Level;
		private var currentLevel:MovieClip;
		private var gameTimer:GameTimer;
		private var levelCtr:int;
		
		public function CountryBall(env:Level) 
		{
			super();
			this.width = this.width * 1.25;
			this.height = this.height * 1.25;
			this.env = env;
			this.addEventListener(MouseEvent.CLICK, ballClick);
		}
		
		public function generateCountry(frame:int):void {
			var countryBall:MovieClip = this.getChildByName("CountryBallFlag") as MovieClip;
			countryBall.gotoAndStop(frame, null);
			return;
		}
		
		public function setCountryCode(countryCode:int):void {
			this.countryCode = countryCode;
		}
		
		public function getCountryCode():int {
			return countryCode;
		}
		
		public function setCurrentLevel(currentLevel:MovieClip) {
			this.currentLevel = currentLevel;
		}
		
		public function setGameTimer(gameTimer:GameTimer):void {
			this.gameTimer = gameTimer;
		}
		
		public function setLevelCount(levelCtr:int):void {
			this.levelCtr = levelCtr;
		}
		
		private function ballClick(e:Event):void {
			if (countryCode == 1) {
				trace("pre levelCtr:" + levelCtr);
				this.visible = false;
				env.cleanUpLevel(currentLevel);
				gameTimer.setTime(5);
				levelCtr++;
				trace("post levelCtr:" + levelCtr);
				env.generateLevel(levelCtr, gameTimer);
			}
		}
	}
}