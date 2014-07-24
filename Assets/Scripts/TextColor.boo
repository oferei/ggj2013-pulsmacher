import UnityEngine

[RequireComponent(GUIText)]

class TextColor (MonoBehaviour): 
	
	public color as Color = Color.white

	def Start ():
		guiText.material.color = color
