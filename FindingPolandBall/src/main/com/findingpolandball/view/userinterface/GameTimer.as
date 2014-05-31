package com.findingpolandball.view.userinterface 
{
	/**
	 * ...
	 * @author Denzil Daulo
	 * 
	 * Reference: http://stackoverflow.com/questions/16225462/countdown-timer-for-time-based-game
	 */
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	public class GameTimer 
	{
		private var gameTime:int;
		private var levelDuration:int;
		private var gameUi:GameUI;
		private var gameTimer:Timer;
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