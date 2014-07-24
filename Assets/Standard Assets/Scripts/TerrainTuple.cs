using System;
using UnityEngine;

namespace AssemblyCSharp
{
	public class TerrainTuple
	{
        public Transform _image;
		public int _startX;
        public int _startY;
		public int _endX;
		public int _endY;

        public TerrainTuple()
        {
            _image = null;
            _startY = 0;
			_startX = 0;
        }

        public TerrainTuple(Transform image, int startX, int startY, int endX, int endY)
        {
            _image = image;
			_startX = startX;
            _startY = startY;
			_endX = endX;
			_endY = endY;
        }

        public void setY(int Y)
        {
            _startY = Y;
        }
        public void setfile(Transform image)
        {
            _image = image;
        }
        public override string ToString()
        {
            return "Image: " + _image + ", Position Y: " + _startY + "\n";
        }

        public Transform getImage()
        { return _image; }
        public int _getPositionY()
        { return _startY; }


    }//TerrainTuple
}

