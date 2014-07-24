import UnityEngine

class HideCursor (MonoBehaviour): 

	def Update ():
		Screen.showCursor = not Screen.fullScreen
