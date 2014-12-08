package com.findingpolandball.view.environment.levels 
{
	import com.findingpolandball.view.environment.Level;
	import com.findingpolandball.view.userinterface.GameTimer;
	import com.findingpolandball.view.userinterface.GameUI;
	import flash.display.MovieClip;
	import com.findingpolandball.view.CountryBallView;
	import com.findingpolandball.model.countryballs.CountryBall;
	import com.findingpolandball.dao.CountryBallDao;
	import com.findingpolandball.dao.LevelDao;
	/**
	 * ...
	 * @author Denzil Daulo
	 */
	public class Level1 extends MovieClip 
	{
		private var env:Level;
		private var gameTimer:GameTimer;
		private var isPolandHere:Boolean = false; 
		private var gamePoints:int;
		private var targetCountryBall:int;
		
		public function Level1(env:Level, gameTimer:GameTimer, gamePoints:int) 
		{
			trace("Level1 called");
			this.env = env;
			this.gameTimer = gameTimer; 
			this.gamePoints = gamePoints;
		}
		
		public function setTargetCountryBall(targetCountryBall:int):void {
			this.targetCountryBall = targetCountryBall;
		}
		
		public function generateMap():void 
		{
			var dirt:Dirt;
			
			var cbd:CountryBallDao = new CountryBallDao();
			var cbv:CountryBallView;
			cbd.setLevel(1);

			var levelDao:LevelDao = new LevelDao();
			levelDao.setLevel(gamePoints);
			
			var worldLevel:int = levelDao.getWorldLevel();
			var tileSet:Array = levelDao.getLevel();
			var levelString:String = worldLevel + "_";
			
			var countryBalls:Array = cbd.getLevel();
			
			var countryCode:int = 0;
			for (var row:int = 0; row < tileSet.length; row++) {
				for (var col:int = 0; col < tileSet[row].length; col++) {
					var tile:int =  tileSet[row][col];
					dirt = new Dirt(levelString + tile);	
					
					dirt.x = dirt.width * col;
					dirt.y = dirt.height * row;	
					
					this.addChild(dirt);
					generateCountryBalls(cbv, dirt, gameTimer, gamePoints, countryBalls[countryCode]);
					countryCode++;
				}
			}
		}
		
		private function generateCountryBalls(cbv:CountryBallView, dirt:Dirt, gameTimer:GameTimer, gamePoints:int, countryBallCode:int):void
		{
			cbv = new CountryBallView();	
			cbv.setLevelCount(gamePoints);
			
			cbv.setTargetCountryBall(targetCountryBall);
			cbv.loadCountryBalls(this, dirt.x, dirt.y, countryBallCode, env, gameTimer);
		}
	}
}