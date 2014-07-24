using UnityEngine;
using System.Collections;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace AssemblyCSharp
{
	public class TerrainGenerator : MonoBehaviour
	{
	    public int _height = 182;
	    public TerrainBlock[] _blockArray;
	    public int _maxY = 1000;
	    public int _minY = 0;
		public int _startY = 0;
		public int _startX = 0;
	    private int _currentY = 0;
		private int _currentX = 0;
	    public int _counter = 0;
		public int _direction = 0;
		public bool _isMultislope = false;
		public TerrainTuple _nextTuple = null;
	    public System.Random _rng = new System.Random();
		public int _beginPathLength = 7;
		public int _afterHoleLength = 2;
		public double _holeProb = 0.12;
		public int _minHoleSize = 150;
		public int _maxHoleSize = 320;
		public int MAX_LVL_HOLE = 650;
		public int MAX_COUNTER = 500;

		// Use this for initialization
		void Awake () 
		{
			
			TerrainBlock first = _blockArray[0];
			_nextTuple = new TerrainTuple(first._image, _startX, _startY, first._endX, first._endY);
			//_nextTuple = new TerrainTuple(first._image, 0, 0, 0, 0);
			_currentX = _startX + first._endX;
			_currentY = _startY + first._endY;
			

			
		}
		
	
		public void createStraightPath()
		{
			TerrainBlock toSave;
			toSave = _blockArray[0];
			_nextTuple = new TerrainTuple(toSave._image, _currentX, _currentY - toSave._endY ,
				_currentX + toSave._endX, _currentY + toSave.deltaY());
			_currentX = _nextTuple._endX;
			_direction = 1;			
		}
	    public TerrainTuple getNextBlock()
	    {
			TerrainBlock toSave=null;
			TerrainTuple toRet = _nextTuple;
			int lastIndex = _blockArray.Length;
			bool isDeterministic = false;
			int positionY = 0;
			if (_counter < MAX_COUNTER) _counter ++;
			if (_counter % 30 == 0) this.advanceLevel();
			if (_counter % 300 == 0) _afterHoleLength = 1;
			do
			{
				if (_beginPathLength > 0 )
				{
					createStraightPath();
					//_currentY = _nextTuple._endY;
					isDeterministic = true;
					_beginPathLength--;
					break;
				}
				else if (_rng.NextDouble() < 0.25)
				{
					toSave = _blockArray[0];
				}
				
				else toSave = _blockArray[_rng.Next(lastIndex)];
				positionY = _currentY + toSave.deltaY();
			}while (positionY < _minY || positionY > _maxY);	
			if (!isDeterministic)
			{
				_nextTuple = new TerrainTuple(toSave._image, _currentX, _currentY - toSave._startY, 
					_currentX + toSave._endX, _currentY + toSave.deltaY());

				if (toSave.deltaY() == 0) 
				{
					_isMultislope = false;
					_direction = 0;
				}
				else if (toSave.deltaY() < 0)
				{
					if (_direction == -1) _isMultislope = true;
					else _isMultislope = false;
					_direction = -1;
				}
				else 
				{
					_direction = 1;
					_isMultislope = false;
				}
				
				int holeSize = (_rng.NextDouble() > _holeProb || _isMultislope) ? 0:_rng.Next (_minHoleSize, _maxHoleSize);
				if (holeSize > 0) 
				{
					_beginPathLength = _afterHoleLength;
				}
				_currentX += toSave._endX + holeSize;
				_currentY += toSave.deltaY();
			}
			
			return  toRet;
			
	
	    }
		
		public void advanceLevel()
		{
			if (_maxHoleSize < MAX_LVL_HOLE + 30)
			{
				_minHoleSize += 30;
				_maxHoleSize += 30;
				_holeProb += 0.01;
			}
		}
		// Update is called once per frame
		void Update () 
		{
		
		}
	}
}