package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.MouseEvent;
import Random;
import motion.Actuate;
import motion.easing.*;
import openfl.display.MovieClip;
import openfl.display.Shape;

class Main extends Sprite {
	
	public function new()  {
		super();
			
		var pool:Array<String> = ["symA.png", "symB.png", "symC.png", "symD.png", "symE.png", "symF.png", "symG.png", "symH.png", "symI.png", "symJ.png"];
		var sym1:Array<String> = [];
		var sym2:Array<String> = [];
		var sym3:Array<String> = [];
		var sym4:Array<String> = [];
		var sym5:Array<String> = [];
		
		initReel(pool, sym1);		
		initReel(pool, sym2);
		initReel(pool, sym3);
		initReel(pool, sym4);
		initReel(pool, sym5);

		var reelOne:MovieClip = new MovieClip();
		var reelTwo:MovieClip = new MovieClip();
		var reelThree:MovieClip = new MovieClip();
		var reelFour:MovieClip = new MovieClip();
		var reelFive:MovieClip = new MovieClip();

		
		addChild(reelOne);
		addChild(reelTwo);
		addChild(reelThree);
		addChild(reelFour);
		addChild(reelFive);
		
		var frameMask : Shape = new Shape();
		frameMask.graphics.beginFill(0x0000FF);
		frameMask.graphics.drawRect(0, 0, 804, 485);
		frameMask.graphics.endFill();
		addChild(frameMask);
		
		
			
		BitmapData.loadFromFile("img/ContainerReels.png").onComplete(function(bitmapData){
			var board = new Bitmap (bitmapData);
			board.x = 0;
			board.y = 0;
			addChild(board);
			board.mask = frameMask;
		});

		
		for (index => item in sym1) {
			BitmapData.loadFromFile('img/$item').onComplete(function(bitmapData){
			var bitmap = new Bitmap (bitmapData);
			bitmap.x = 5;
			bitmap.y = 155 * index;
			reelOne.addChild(bitmap);	
		});
		}		
		reelOne.mask = frameMask;

		for (index => item in sym2) {
			BitmapData.loadFromFile('img/$item').onComplete(function(bitmapData){
			var bitmap = new Bitmap (bitmapData);
			bitmap.x = 165;
			bitmap.y = 155 * index;
			reelTwo.addChild(bitmap);
		});
		}		
		reelTwo.mask = frameMask;
		
		for (index => item in sym3) {
			BitmapData.loadFromFile('img/$item').onComplete(function(bitmapData){
			var bitmap = new Bitmap (bitmapData);
			bitmap.x = 325;
			bitmap.y = 155 * index;
			reelThree.addChild(bitmap);
		});
		}	
		reelThree.mask = frameMask;
		
		for (index => item in sym4) {
			BitmapData.loadFromFile('img/$item').onComplete(function(bitmapData){
			var bitmap = new Bitmap (bitmapData);
			bitmap.x = 485;
			bitmap.y = 155 * index;
			reelFour.addChild(bitmap);
		});
		}	
		reelFour.mask = frameMask;
		
		for (index => item in sym5) {
			BitmapData.loadFromFile('img/$item').onComplete(function(bitmapData){
			var bitmap = new Bitmap (bitmapData);
			bitmap.x = 645;
			bitmap.y = 155 * index;
			reelFive.addChild(bitmap);
		});
		}		
		reelFive.mask = frameMask;
		
		BitmapData.loadFromFile ("img/Button.png").onComplete (function (bitmapData) {
			var bitmap = new Bitmap (bitmapData);
			bitmap.x = 310;
			bitmap.y = 400;
			var button = new Sprite ();
			button.addChild (bitmap);
			button.buttonMode = true;
			this.addChild (button);
			
			button.addEventListener(MouseEvent.CLICK, function(e){
				var deltaArr:Array<Int> = [-930, -775, -620, -465, -310, -155, 155, 310, 465, 620, 775, 930];
				var delta:Int = Random.fromArray(deltaArr);
				trace(delta);
				Actuate.tween (reelOne, 0.5, { y: delta}).ease (Quad.easeOut);
				Actuate.tween (reelTwo, 0.5, { y: delta}).ease (Quad.easeOut).delay (0.25);
				Actuate.tween (reelThree, 0.5, { y: delta}).ease (Quad.easeOut).delay (0.45);
				Actuate.tween (reelFour, 0.5, { y: delta}).ease (Quad.easeOut).delay (0.65);
				Actuate.tween (reelFive, 0.5, { y: delta}).ease (Quad.easeOut).delay (0.85);
			});
		});
	}
	
	private function initReel(pool:Array<String>, reel:Array<String>) {
		for (i in 0...10) {
			var rnd = Random.fromArray(pool);
			reel.push(rnd);
		}
	}

}


