package com.findingpolandball.dao 
{
	/**
	 * ...
	 * @author Denzil Daulo
	 */
	public class LevelDao 
	{	
		private var tileSet:Array = [
										[
											[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
											[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
											[3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3], 
											[2, 2, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1],  
											[1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 1, 2, 1, 1, 2, 2, 2, 1, 1], 
											[1, 2, 1, 2, 2, 1, 1, 2, 2, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1], 
											[2, 2, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1],
											[2, 2, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1],
											[2, 2, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1],  
											[1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 1, 2, 1, 1, 2, 2, 2, 1, 1]
										],
										
										[
											[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
											[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
											[3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3], 
											[2, 2, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1],  
											[1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 1, 2, 1, 1, 2, 2, 2, 1, 1], 
											[1, 2, 1, 2, 2, 1, 1, 2, 2, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1], 
											[2, 2, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1],
											[2, 2, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1],
											[2, 2, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1],  
											[1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 1, 2, 1, 1, 2, 2, 2, 1, 1]
										]

									];
		private var level:int;
		private var challengeCount:int;
		
		public function LevelDao() 
		{
			
		}
		
		public function setLevel(level:int):void {
			trace("level:" + level);
			trace("challengeCount:" + challengeCount);
			trace("level / challengeCount:" +int(level / challengeCount));
			
			this.level = int(level / challengeCount);
			if (level == challengeCount) {
				this.level = 0;
			}
			trace("pre this.level:" + this.level);
			if(this.level >= tileSet.length){
				this.level = (Math.random() * tileSet.length) - 1;
			}
			trace("post this.level:" + this.level);
		}
		
		public function setChallengeCount(challengeCount:int) {
			this.challengeCount = challengeCount;
		}
		
		public function getLevel():Array {
			if (level == 0 || level == 1) {
				return tileSet[level];
			}
			return tileSet[level-1];
		}
		
		public function getWorldLevel():int {
			var maxWorldLevel:int = tileSet.length;
			var worldLevel:int = (int(level / challengeCount)) + 1;
			trace("worldLevel:"+worldLevel);
			if ( worldLevel > maxWorldLevel ) {
				trace("maxWorldLevel:" + maxWorldLevel);
				return maxWorldLevel;
			}
			return worldLevel;
		}
	}

}