package com.findingpolandball.view.userinterface 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.utils.getDefinitionByName;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	
	import com.findingpolandball.view.environment.Environment;
	import com.findingpolandball.view.userinterface.PauseScreen;
	/**
	 * ...
	 * @author Denzil Daulo
	 */
	public class GameUI extends MovieClip 
	{
		private var time:Timer
		private var timer:GameTimer;
		private var pause:Boolean;
		private var pauseScreen:PauseScreen;
		
		public function GameUI() 
		{
			this.pause = false;		
		}
		
		public function gameTimer(gameTime:int):GameTimer {
			time = new Timer(1000);
			timer = new GameTimer(this, time);
			timer.setLevelDuration(gameTime);
			timer.startGameTimer();
			
			return timer;
		}
		
		public function gamePause():void {
			this.gamePauseResumeBtn.addEventListener(MouseEvent.CLICK, pauseResumeGame);	
		}
		
		public function setPauseScreen(pauseScreen:PauseScreen) {
			this.pauseScreen = pauseScreen;
		}
		
		public function resumeGame(pause:Boolean) {
			 if (pause == true) {
				timer.resumeTime();
				this.pause = false;
			}		
		}
		
		private function pauseResumeGame(e:Event):void {
			if (pause == false) {
				timer.stopTime();
				pause = true;
				pauseScreen.setPause(pause);
				pauseScreen.setgameUi(this);
			}
			this.pauseScreen.visible = pause;
		}
	}
}