package com.findingpolandball.view.userinterface 
{
	/**
	 * ...
	 * @author Denzil Daulo
	 * 
	 * Reference: http://stackoverflow.com/questions/16225462/countdown-timer-for-time-based-game
	 */
	import com.findingpolandball.model.countryballs.CountryBall;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	public class GameTimer 
	{
		private var gameTime:int;
		private var levelDuration:int;
		private var gameUi:GameUI;
		private var gameTimer:Timer;
		private var countryBall:CountryBall;
		
		public function GameTimer(gameUi:GameUI, gameTimer:Timer) 
		{
			this.gameUi = gameUi;
			this.gameTimer = gameTimer;
		}
		
		public function startGameTimer():void 
		{
			gameTime = levelDuration;
			
			gameTimer.addEventListener(TimerEvent.TIMER, updateTime);
			gameTimer.start();
			displayText()
		}
		
		private function updateTime(e:TimerEvent):void
		{
			gameTime--;
			if (gameTime <=0 ) {
				timeExpired(e);
			}
			displayText();
		}

		private function timeExpired(e:TimerEvent):void
		{
			var gameTimer:Timer = e.target as Timer;
			gameTimer.removeEventListener(TimerEvent.TIMER, updateTime)
			
			//animate game over animation of countryBall
			//countryBall.s
			trace("trigger animoation for country code:" + countryBall.getTargetCountryBall());
			var targetCountryBall:int = countryBall.getTargetCountryBall();
			countryBall.triggerAnimation(targetCountryBall);
		}
			
		private function displayText():void 
		{
			gameUi.gameTimerTxt.text = String(gameTime);
		}
		
		public function setLevelDuration(levelDuration:int):void 
		{
			this.levelDuration += levelDuration;	
		}
		
		public function setTime(gameTime:int):void 
		{
			this.gameTime += gameTime;
			if (this.gameTime == 0) {
				this.gameTime = 0;
			}
		}	
		
		public function setTargetCountryBall(countryBall:CountryBall):void
		{
			this.countryBall = countryBall;
			trace("countryBall.getCountryCode:" + countryBall.getTargetCountryBall());
		}
		
		public function stopTime():void 
		{
			gameTimer.stop();
		}
		
		public function resumeTime():void 
		{
			gameTimer.start();
		}
	}

}