package com.findingpolandball.view.userinterface 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Denzil Daulo
	 */
	public class PauseScreen extends MovieClip 
	{
		
		private var pause:Boolean;
		private var gameUi:GameUI;
		
		public function PauseScreen() 
		{
			initialize();
		}		
		
		public function setPause(pause:Boolean):void {
			this.pause = pause;
		}
		
		public function setgameUi(gameUi:GameUI):void {
			this.gameUi = gameUi;
		}

		private function resumeGame(e:Event):void {
			
			if(pause==true){
				this.visible = false;
				gameUi.resumeGame(pause);
			}
		}
		
		private function initialize():void 
		{
			this.resumeBtn.gotoAndStop(1);
			this.exitGameBtn.gotoAndStop(2);
			this.resumeBtn.addEventListener(MouseEvent.CLICK, resumeGame);
		
		}

	}

}