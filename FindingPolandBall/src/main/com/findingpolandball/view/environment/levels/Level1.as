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
		private var loadLevel:int;
		
		public function Level1(env:Level, gameTimer:GameTimer, loadLevel:int) 
		{
			trace("Level1 called");
			this.env = env;
			this.gameTimer = gameTimer; 
			this.loadLevel = loadLevel;
		}
		
		public function generateMap():void 
		{
			var dirt:Dirt;
			
			var cbd:CountryBallDao = new CountryBallDao();
			var cbv:CountryBallView;
			cbd.setLevel(loadLevel);

			var levelDao:LevelDao = new LevelDao();
			levelDao.setChallengeCount(cbd.getCountryBallsLength());
			levelDao.setLevel(loadLevel);
			
			var worldLevel:int = levelDao.getWorldLevel();
			var tileSet:Array = levelDao.getLevel();
			var levelString:String = worldLevel + "_";
			
			for (var row:int = 0; row < tileSet.length; row++) {
				for (var col:int = 0; col < tileSet[row].length; col++) {
					var tile:int =  tileSet[row][col];
					dirt = new Dirt(levelString + tile);	
					
					dirt.x = dirt.width * col;
					dirt.y = dirt.height * row;	
					
					this.addChild(dirt);

					generateCountryBalls(cbd, cbv, dirt, gameTimer, loadLevel);
				}
			}
		}
		
		private function generateCountryBalls(cbd:CountryBallDao, cbv:CountryBallView, dirt:Dirt, gameTimer:GameTimer, loadLevel:int):void
		{
			cbv = new CountryBallView();	
			cbv.setLevelCount(loadLevel);
			
			var countryBalls:Array = cbd.getLevel();
			var i:int = (Math.random() * countryBalls.length);
			var countryBall:CountryBall;
			
			if (countryBalls[i] == 1) {
				if(isPolandHere == false){					
					countryBall	= cbv.loadCountryBalls(this, dirt.x, dirt.y, 1, env, gameTimer);
					isPolandHere = true;
				}
				
				else if( isPolandHere == true){
					countryBall	= cbv.loadCountryBalls(this, dirt.x, dirt.y, 20, env, gameTimer);
				}
			}
			if (countryBalls[i] != 1) {
				countryBall	= cbv.loadCountryBalls(this, dirt.x, dirt.y, countryBalls[i], env, gameTimer);
			}
		}
	}
}