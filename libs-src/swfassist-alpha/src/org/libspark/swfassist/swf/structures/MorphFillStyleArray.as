/*
 * Copyright(c) 2007 the Spark project.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
 * either express or implied. See the License for the specific language
 * governing permissions and limitations under the License.
 */

package org.libspark.swfassist.swf.structures
{
	public class MorphFillStyleArray
	{
		private var _fillStyles:Array = [];
		
		public function get numFillStyles():uint
		{
			return fillStyles.length;
		}
		
		public function get fillStyles():Array
		{
			return _fillStyles;
		}
		
		public function set fillStyles(value:Array):void
		{
			_fillStyles = value;
		}
	}
}