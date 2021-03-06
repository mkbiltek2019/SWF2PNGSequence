﻿/*
 * ActionScript Thread Library
 * 
 * Licensed under the MIT License
 * 
 * Copyright (c) 2008 BeInteractive! (www.be-interactive.org) and
 *                    Spark project  (www.libspark.org)
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 */
package org.libspark.thread
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * EnterFrameThreadExecutor クラスは IThreadExecutor インターフェイスの実装クラスで、
	 * フレーム実行のタイミングでスレッドを実行します.
	 * 
	 * @author	yossy:beinteractive
	 */
	public class EnterFrameThreadExecutor implements IThreadExecutor
	{
		/**
		 * 新しい EnterFrameThreadExecutor クラスのインスタンスを作成します
		 */
		public function EnterFrameThreadExecutor() 
		{
		}
		
		private var _clip:MovieClip;
		
		/**
		 * @inheritDoc
		 */
		public function start():void
		{
			if (_clip != null) {
				return;
			}
			
			_clip = new MovieClip();
			_clip.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		/**
		 * @inheritDoc
		 */
		public function stop():void
		{
			if (_clip == null) {
				return;
			}
			
			_clip.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			_clip = null;
		}
		
		/**
		 * フレーム実行ハンドラ
		 * 
		 * @param	e	イベント
		 * @private
		 */
		private function enterFrameHandler(e:Event):void
		{
			Thread.executeAllThreads();
		}
	}
}