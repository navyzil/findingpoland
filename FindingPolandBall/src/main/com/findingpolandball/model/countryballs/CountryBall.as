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
		private var gamePoints:int;
		private var targetCountryBall:int;
		
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
		
		public function setGamePoints(gamePoints:int):void {
			this.gamePoints = gamePoints;
		}
		
		public function setTargetCountryBall(targetCountryBall:int):void {
			this.targetCountryBall = targetCountryBall;
			trace("this.targetCountryBall:" + this.targetCountryBall);
		}
		
		private function ballClick(e:Event):void {
			trace("targetCountryBall: " + targetCountryBall);
			if (countryCode == targetCountryBall) {
				trace("pre gamepoints:" + gamePoints);
				this.visible = false;
				env.cleanUpLevel(currentLevel);
				gameTimer.setTime(3);
				gamePoints+=2;
				trace("post gamepoints:" + gamePoints);
				env.generateLevel(gamePoints, gameTimer, newTarget());
			}
			else {
				gameTimer.setTime(-3);
			}
		}
		
		public function newTarget():int {
			return targetCountryBall = 1 + Math.round(Math.random() * (31 - 1)); //replace 20 with 190
		}
	}
}