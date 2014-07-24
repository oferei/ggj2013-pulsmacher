using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

namespace AssemblyCSharp
{
    public class TerrainBlock : MonoBehaviour
    {
        public Transform _image;
        public int _startY;
        public int _endY;
		public int _startX;
        public int _endX;
        public int _height;
        public int _deltaY;

        public TerrainBlock()
        {
            _image = null;
            _startY = 0;
            _endY = 0;
            _height = 0;
            _deltaY = 0;
        }
        public TerrainBlock(Transform image, int startY, int endY, int height) :this()
        {
            _image = image;
            _startY = startY;
            _endY = endY;
            _height = height;
            _deltaY = endY - startY;

        }

     
        public int deltaY()
        {
            return _endY - _startY;
        }
        public override string ToString()
        {
            return "Image: " + _image + ", Y start: " + _startY + ", Y end: " + _endY + ", delta Y: " + _deltaY + "\n";
        }

    }//TerrainBlock
}